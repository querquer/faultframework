%% running_mean
% This function produces a running window of size "window_size" containing 
% samples from 'data' and calculates its mean value.

function m = running_mean(data, window_size)

% Get size of array 'data'
sd = size(data);

% Check format
if(sd(1,1) > sd(1,2))
    data = transpose(data);
    sd = size(data);
end

% Create empty arrays
window = zeros(1,window_size);
m = zeros(1,sd(1,2));

% Loop through data
for i=1:sd(1,2)
    % Generate window
    window(1,1:window_size-1) = window(1,2:window_size);
    window(1,window_size) = data(1,i);
    % Calculate mean
    m(1,i) = mean(window);
end

end

