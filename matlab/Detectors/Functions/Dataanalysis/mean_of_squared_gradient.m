function mean = mean_of_squared_gradient( data)
%MEAN_OF_GRADIENT calculates the mean of the gradient of the signal
%   The Input 'data' is assumed to be 1-dimensional array representing a
%   time series of a signal, e.g. a output-signal of a sensor. By
%   calculating the gradient of the signal in a first step and using matrix
%   operations in a second step, the mean of the squared gradient is determined.


    sd = size(data);
    
    if(sd(1,1) > sd(1,2))
        s = sd(1,1);
        g = gradient(data);
        mean = (transpose(g)*g)/s;
    else
        s = sd(1,2);
        g = gradient(data);
        mean = (g*transpose(g))/s;
    end
end

