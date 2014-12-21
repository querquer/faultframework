function det = output_detector_nn( x, data, trigger)
%DETECTION designs a detector and calculates its output based on the input
%given by 'data'
%   Detailed explanation goes here

net = design_nn(x);

%calculate input data
wsize = round(x(3)) + 1;
inp = createInput_NN(data,wsize);

sd = size(data);
trg = trigger(1,wsize:sd(1,2));


%train NN
net = unconfigure(net);
net = init(net);

%try to parallelise training of NN
%implement parallelsation here.
try
    net = train(net, inp, trg);%, 'useParallel','yes');
catch err
    net = train(net, inp, trg);
end

%save trained NN
%save('net_trained.mat', 'net');

%calculate output of NN given 'data'
det = sim(net,inp);

det = lc_check(det,x(4));
z = zeros(1,wsize-1);
det = [z det];
end

