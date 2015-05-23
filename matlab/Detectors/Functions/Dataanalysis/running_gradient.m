%% running_gradient
% This function calculates the gradient between every two time steps.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code

function grad = running_gradient( data )

% Check format of input data
if(iscell(data))
    msgID = 'running_gradient:data format';
    msg = 'The input data is expected do be a array, not a cell-array!';
    baseException = MException(msgID,msg);
    throw(baseException);
end

sd = size(data);
grad = zeros(sd(1,1),sd(1,2));

% For every timeseries
for ts = 1:sd(1,1)
    % For every timestep
    for i = 1:sd(1,2)-1
        % Calculate gradient
        grad(ts,i) = data(ts,i+1)-data(ts,i);
        if(i == sd(1,2)-1)
             grad(ts,i+1) = grad(ts,i);
        end
    end
end


end

