%% build_trigger
% This function extract the process model and the trigger data from a
% special input file. Than it generates the triggerbus as input for the
% FailureProcessing.slx. Therefor it fills the unactivated fauilures
% with zeros.
%

%% Failures types indicated by the trigger bus
% #     value correlated offset
% #     time correlated offset
% #     value correlated noise
% #     time correlated noise
% #     const offset
% #     const noise
% #     outlier
% #     spike
% #     stuck at zero
% #     stuck at X
% #     saturation
% #     const delay
% #     time correlated delay
%

%% Related Functions
% * <filename2bi.html filename2bi>
%

%% Source Code

function [ process, triggerBus] = build_trigger( input_file )
%BUILD_TRIGGERBUS returns from a .mat file the triggerbus and the
%process data

% load the data we need to build the triggerbus
file = load(input_file);
input = file.faulty_data_mat;
activationArray = filename2bi(input_file);

process = input{1,1};

timeSeries = input{1,1}.Time;

% build a new timeseries
stepCount = size(timeSeries);

% build a zero trigger, which is placed for the not activated faults
zeroTrigger = false(stepCount(1) , 1);
zeroTimeSeries = timeseries(zeroTrigger, timeSeries);

failureCount = 0;

% for value correlated offset
if(activationArray(1) == 0)
    triggerBus.value_correlated_offset = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.value_correlated_offset = newTimeSeries;
end

% time correlated offset
if(activationArray(2) == 0)
    triggerBus.time_correlated_offset = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.time_correlated_offset = newTimeSeries;
end

% value correlated noise
if(activationArray(3) == 0)
    triggerBus.value_correlated_noise = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.value_correlated_noise = newTimeSeries;
end

% time correlated noise
if(activationArray(4) == 0)
    triggerBus.time_correlated_noise = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.time_correlated_noise = newTimeSeries;
end

% const offset
if(activationArray(5) == 0)
    triggerBus.const_offset = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.const_offset = newTimeSeries;
end

% const noise
if(activationArray(6) == 0)
    triggerBus.const_noise = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.const_noise = newTimeSeries;
end

% outlier
if(activationArray(7) == 0)
    triggerBus.outlier = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.outlier = newTimeSeries;
end

% spike
if(activationArray(8) == 0)
    triggerBus.spike = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.spike = newTimeSeries;
end

% stuck at zero
if(activationArray(9) == 0)
    triggerBus.stuck_at_zero = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.stuck_at_zero = newTimeSeries;
end

% stuck at X
if(activationArray(10) == 0)
    triggerBus.stuck_at_x = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.stuck_at_x = newTimeSeries;
end

% saturation
if(activationArray(11) == 0)
    triggerBus.saturation = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.saturation = newTimeSeries;
end

% const delay
if(activationArray(12) == 0)
    triggerBus.const_delay = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);
    triggerBus.const_delay = newTimeSeries;
end

% time correlated delay
if(activationArray(13) == 0)
    triggerBus.time_correlated_delay = zeroTimeSeries;
else
    failureCount = failureCount + 1;
    newData = logical(input{1,2}(failureCount).data');
    newTimeSeries = timeseries(newData, timeSeries);;
    triggerBus.time_correlated_delay = newTimeSeries;
end


end

