%% test_filter
% test the filter on the actual model and fault configuration.

%% New Filter
% if you want to test your own filter, be sure that the .slx file of your
% filter is locatet in the Filter folder.

%% Return Values
% * *quality*:      delivers a quality indication. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>
% * *dist*:         delivers a indication how much differ the faultfree and the filtered
%                   data. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>

%% Related Functions
% * <set_filter.html set_filter>
% * <filter_evaluation.html filter_evaluation>
%

%% Source Code

function [ quality, dist ] = test_filter(model_file)

set_filter(model_file);
[quality, dist] = filter_evaluation();

end

