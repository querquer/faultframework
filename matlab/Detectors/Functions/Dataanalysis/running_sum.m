function m = running_sum(data, window_size)
%RUNNING_SUM produces a running window of size "window_size" and sums it
%up.

sd = size(data);

if(sd(1,1) > sd(1,2))
    data = transpose(data);
    sd = size(data);
end

window = zeros(1,window_size);
m = zeros(1,sd(1,2));

for i=1:sd(1,2)
    window(1,1:window_size-1) = window(1,2:window_size);
    window(1,window_size) = data(1,i);
    m(1,i) = sum(window);
end

end

