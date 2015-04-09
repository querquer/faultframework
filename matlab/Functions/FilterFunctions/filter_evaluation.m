%% filter_evaluation
% This function run the FailureProcessing.slx with the actual configuration
% and deliver the results.

%% Return Values
% * *quality*:          gives the average difference between the filtered faulty_data
%                       and the filtered faultfree_data, when the faulttrigger is active. This
%                       is to give an quality value wich not depend on fauilures caused by
%                          distortion of the filter. A smaller value is better.
%
% * *average_dist*:     gives the average difference between the
%                       filtered faulty_data and the faultfree_data. To give information on the
%                       impact of the distortion of the filter. A smaller value is better.
%

%% Source Code

function [quality, average_dist] = filter_evaluation()
%FILTER_EVALUATION evaluate the filter wich is actually set.

SimOut = sim('FailureProcessing.slx');  % run the actual failureProcessing to get the results
dataarray = SimOut.get('yout');         % array wich contain the outputdata
quality = dataarray(end,4);             % seperates the quality
average_dist = dataarray(end,3);        % seperates the average_dist
end