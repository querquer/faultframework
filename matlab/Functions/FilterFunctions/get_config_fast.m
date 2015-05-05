%% get_config_fast
% Same funktion like <get_config.html get_config> with the difference that
% the filter is not set. This should save some time. Fore example while
% building the <build_suggestion_table.html lookuptable>.
%
% Run the actual set filter with different configurations and find the best. The
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
% if you want change the properties of your filter automaticaly you have
% to write a function wich do so. This function should be added here and in the
% <get_config.html get_config.m>.
% 
% The function should set a new filter configuration and evaluate it with
% the <filter_evaluation.html filter_evaluation> function. The best
% configuration should be set at the end and the config, quality and
% dist should be returned. The quality and the dist are delivered by the 
% <filter_evaluation.html filter_evaluation> function. The config value
% should be a number wich indicate the best configuration.
%

%% Source Code

function [config, quality, dist] = get_config_fast(model_file)
%GET_CONFIG set and return the best config of the filter.

%   ######## ADD NEW FILTER #########
%   if you add a new filter, you should write a function wich trys
%   different configurations and you should pass it here like the given
%   examples. If not, you will get zero as configuration and the default
%   configuration will be used.

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

