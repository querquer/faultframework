function x0 = generate_starting_point_nn()
%GENERATE_STARTING_POINT This function returns a starting point for a
%optimisation-algorithm. 
%   The automated designing of a sensorfaultdetector is done by applying a
%   optimisation-algorithm. This needs a starting-point. 



%TRAIN PARAMETER OF NEURAL NETWORK

%Goal
x0(1) = rand * 1/1000;


%Number of epochs
x0(2) = round(rand * 1000) + 1; 




%DESIGN OF NEURAL NETWORK

%Number of Inputs --> this is equal to the number of timesteps used for the
%input of the neural network.
x0(3) = round(rand * 6) + 1;

%Threshold for limit checking
x0(4) = (randn + 50)/100;

%Number of neurons per hidden layer
for i = 1:2
    x0(4+i) = round(rand * 20/i);
    
    if(x0(4+i) <= 0)
        x0(4+i) = 1;
    end
end

end

