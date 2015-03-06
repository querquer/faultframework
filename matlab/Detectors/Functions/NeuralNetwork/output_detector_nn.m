function out = output_detector_nn( x, data, trigger)
%DETECTION designs a detector and calculates its output based on the input
%given by 'data'
%   Detailed explanation goes here

%design neural network based on parameters in 'x'
net = design_nn(x);

if(x(3) < 0)
    x(3) = 0;
end

%loop throug every fault type
sd = size(data);
st = size(trigger);
if(sd(1,2) ~= st(1,2))
    msgID = 'output_detector_nn:data format';
    msg = 'Number of samples in "data" does not match number of samples in "trigger"! Is the format of "data" or "trigger" wrong?';
    baseException = MException(msgID,msg);
    throw(baseException);
end

%get output for every fault type
for i = 1:sd(1,2)
    dt = data(i).data;
    trg = trigger(i).data;
    
    windowsize = round(x(3)) + 1;
    lc_threshold = x(4);
    det = output_single_nn(net, windowsize, lc_threshold, dt, trg); 
    
    out(i).name = trigger(i).name;
    out(i).data = det;
   
end

end

