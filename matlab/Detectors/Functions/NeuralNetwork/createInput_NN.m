%% CreateInput_NN
% This is a helper function creating the input of a neural network.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
function [inp] = createInput_NN(data, windowsize)
%CREATEINPUT_NN Summary of this function goes here
%   Detailed explanation goes here

sd = size(data);


for i=1:sd(1,2)-windowsize+1
    if(i == 1)
        inp = transpose(data(1,1:windowsize));
    else
        inp = [inp transpose(data(1,i:windowsize+i-1))];
    end
end

end

