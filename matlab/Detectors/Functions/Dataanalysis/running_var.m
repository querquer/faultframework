%% running_var
% This function creates windows of size 'window_size' for every sample in
% data and calculates the variance of all data sampls of this window.
% Therefore, we get a running variance.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
function variance = running_var(data, window_size)

% Get number of samples
sd = size(data);

% Check format
if(sd(1,1) > sd(1,2))
    data = transpose(data);
    sd = size(data);
end

% Generate window-array
window = zeros(1,window_size);

% Generate variance-array
variance = zeros(1,sd(1,2));

% Loop through 'data'
for i=1:sd(1,2)
    % Generate window of actual samples
    window(1,1:window_size-1) = window(1,2:window_size);
    window(1,window_size) = data(1,i);
    % Calculate variance of window
    variance(1,i) = var(window);
end

end

