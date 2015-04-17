%% get_config
% Run the filter with different configurations and find the best. The
% configurations and how they are changed is specified in the .m funktion
% of the filter. For example for the Median_Filter.slx the configuration
% options wich will be testet are specified in the median_filter.m

%% Input Value
% * *model_file*:   The name of the filter you want to use

%% Return Values
% * *config*:       a value witch can tell you, witch configuration is the
%                   best.
% * *quality*:      delivers a quality indication. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>
% * *dist*:         delivers a indication how much differ the faultfree and the filtered
%                   data. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>

%% Add New Filter
% TODO: inhalt schreiben
%

%% Related Functions
% * <set_filter.html set_filter>
%

%% Source Code

function [config, quality, dist] = get_config(model_file)
%GET_CONFIG set and return the best config of the filter.

%   ######## ADD NEW FILTER #########
%   if you add a new filter, you should write a function wich trys
%   different configurations and you should pass it here like the given
%   examples. If not, you will get zero as configuration and the default
%   configuration will be used.

set_filter(model_file);

% start the configurationfunction of the filter
% if you add a new filter, the configuration function should be added here
if(strcmp(model_file,'Median_Filter.slx'))
    [config, quality, dist] = median_filter();
elseif(strcmp(model_file,'Discrete_Filter.slx'))
    [config, quality, dist] = discrete_filter();
elseif(strcmp(model_file,'DiscreteFIR_Filter.slx'))
    [config, quality, dist] = discretefir_filter();
% elseif(strcmp(filter,'Kalman_Filter'))
%     [config, quality, dist] = kalman_filter();
else    % if ther is no configurationfunction, use the default
    [config, quality, dist] = none();
end

