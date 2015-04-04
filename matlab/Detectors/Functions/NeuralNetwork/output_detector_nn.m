%% Output_detector_nn
% This function desings and trains a detector based on neural networks and caluculates
% its outputs based on the input data given by 'data'.

%% Related Functions

%%
% * <design_nn.html design_nn>
% * <output_single_nn.html output_single_nn>

%% Source Code
function out = output_detector_nn( x, data, trigger)

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

