function variance = running_var(data, window_size)
%RUNNING_VAR Summary of this function goes here
%   Detailed explanation goes here
sd = size(data);

if(sd(1,1) > sd(1,2))
    data = transpose(data);
    sd = size(data);
end

window = zeros(1,window_size);
variance = zeros(1,sd(1,2));

for i=1:sd(1,2)
    window(1,1:window_size-1) = window(1,2:window_size);
    window(1,window_size) = data(1,i);
    variance(1,i) = var(window);
end

end

