function det = detection( x, data, trigger)
%DETECTION designs a detector and calculates its output based on the input
%given by 'data'
%   Detailed explanation goes here

%load NN from file as a template
if(exist('net_template.mat', 'file'))
    t = load('net_template.mat');
    net = t.net;
else
    msgID = 'detection::NeuralNetwork';
    msg = 'Could not find template-file of neural network.';
    baseException = MException(msgID,msg);
    throw(baseException);
end

%determine neural network by 'x'

%Parameters: 
%   1: Goal
%   2: Number of epochs
%   3: Number of inputs
%   4: Threshold for limit checking
%   5-6: Number of neurons per hidden layer


net.trainParam.goal = x(1);
net.trainParam.epochs = round(x(2)) + 1;

%Connect inputs to first layer
net.inputConnect(1,:) = 1;


%Change size of hidden layers
for i = 1:2
net.layers{i,1}.size = round(x(4+i)) + 1;
end


%calculate input data
wsize = round(x(3)) + 1;
inp = createInput_NN(data,wsize);

sd = size(data);
trg = trigger(1,wsize:sd(1,2));


%train NN
net = unconfigure(net);
net = init(net);
try
    pool = parpool;
    net = train(net, inp, trg, 'useParallel','yes');
catch err
    net = train(net, inp, trg);
end
%calculate output of NN given 'data'
det = sim(net,inp);

det = lc_check(det,x(4));
end

