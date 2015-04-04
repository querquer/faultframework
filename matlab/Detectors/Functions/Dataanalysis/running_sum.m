%% running_sum
% This function produces a running window of size "window_size" and sums it
% up.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
function m = running_sum(data, window_size)

% Get size of data
sd = size(data);

% Check format
if(sd(1,1) > sd(1,2))
    data = transpose(data);
    sd = size(data);
end

% Generate empty arrays
window = zeros(1,window_size);
m = zeros(1,sd(1,2));

% Loop through data
for i=1:sd(1,2)
    % Generate actual window
    window(1,1:window_size-1) = window(1,2:window_size);
    window(1,window_size) = data(1,i);
    % Sum it up
    m(1,i) = sum(window);
end

end

