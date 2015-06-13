%% None
% None is no filter.
%
% This function evalute the filter with the actuall configuration.

%% Return Values
% * *config*:       is the number of the values are used.
% * *quality*:      delivers a quality indication. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>
% * *dist*:         delivers a indication how much differ the faultfree and the filtered
%                   data. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>

%% Source Code

function [config, quality, dist] = none()
%NONE evalute the filter with the actuall configuration

config = 0;
[quality, dist] = filter_evaluation;

end