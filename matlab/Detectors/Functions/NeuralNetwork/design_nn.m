function net = design_nn(x)
%DESIGN_NN designs a neural network based on specified parameters 'x'
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

if(x(1) >= 0)
    net.trainParam.goal = x(1);
else
    net.trainParam.goal = 0;
end

if(x(2) >= 0)
    net.trainParam.epochs = round(x(2)) + 1;
else
    net.trainParam.epochs = 1;
end

%Connect inputs to first layer
net.inputConnect(1,:) = 1;


%Change size of hidden layers
for i = 1:2
    if(x(4+i) >= 0)
        net.layers{i,1}.size = round(x(4+i)) + 1;
    else
        net.layers{i,1}.size = 1;
    end
end

end

