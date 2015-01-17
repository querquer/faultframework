function grad = running_gradient( data )
%RUNNING_GRADIENT calculates the gradient between every two time steps.
%data of a timeseries is expected as data(i,:), different timeseres are
%expected at data(:,...).

if(iscell(data))
    msgID = 'running_gradient:data format';
    msg = 'The input data is expected do be a array, not a cell-array!';
    baseException = MException(msgID,msg);
    throw(baseException);
end

sd = size(data);
grad = zeros(sd(1,1),sd(1,2));

%for every timeseries
for ts = 1:sd(1,1)
    %for every timestep
    for i = 1:sd(1,2)-1
        grad(ts,i) = data(ts,i+1)-data(ts,i);
        if(i == sd(1,2)-1)
             grad(ts,i+1) = grad(ts,i);
        end
    end
end


end

