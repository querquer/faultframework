function det = output_single_nn(net, windowsize, threshold, data, trigger)
%OUTPUT_SINGLE_NN train and calculate a neural network for only one data
%set. We assume, that there will be one data set according to only one
%fault type.

%   Detailed explanation goes here
%calculate input data
inp = createInput_NN(data,windowsize);

sd = size(data);
trg = trigger(1,windowsize:sd(1,2));


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

det = lc_check(det,threshold);
z = zeros(1,windowsize-1);
det = [z det];

end

