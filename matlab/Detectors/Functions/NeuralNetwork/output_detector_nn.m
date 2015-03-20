function out = output_detector_nn( x, data, trigger)
%DETECTION designs a detector and calculates its output based on the input
%given by 'data'
%   Detailed explanation goes here

%design neural network based on parameters in 'x'
net = design_nn(x);

if(x(3) < 0)
    x(3) = 0;
end

%get output for every fault type
dt = data.data;
trg = trigger.data;

windowsize = round(x(3)) + 1;
lc_threshold = x(4);
det = output_single_nn(net, windowsize, lc_threshold, dt, trg); 
    
out.name = trigger.name;
out.data = det;

end

