function [config, quality, dist] = get_config()
%GET_CONFIG set and return the best config of the actuall filter
%   run the filter with different configurations and find the best. The
%   configurations and how they are changed is specified in the .m funktion
%   of the filter. For example for the Median_Filter.slx the configuration
%   options wich will be testet are specified in the median_filter.m
%   
%   ######## ADD NEW FILTER #########
%   if you add a new filter, you should write a function wich trys
%   different configurations and you should pass it here like the given
%   examples. If not, you will get zero as configuration and the default
%   configuration will be used.
%   
%   Return values
%   config:     The best parameters for the filter
%
%   quality:        gives the average difference between the filtered faulty_data
%   and the filtered faultfree_data, when the faulttrigger is active. This
%   is to give an quality value wich not depend on fauilures caused by
%   distortion of the filter. A smaller value is better.
%
%   average_dist:   gives the average difference between the
%   filtered faulty_data and the faultfree_data. To give information on the
%   impact of the distortion of the filter. A smaller value is better.

load_system('Filter.slx');
filter = get_param('Filter/Filter/' ,'ModelNameDialog');    % get the actual filter
close_system('Filter.slx',1);

% start the configurationfunction of the filter
if(strcmp(filter,'Median_Filter'))
    [config, quality, dist] = median_filter();
elseif(strcmp(filter,'Discrete_Filter'))
    [config, quality, dist] = discrete_filter();
elseif(strcmp(filter,'DiscreteFIR_Filter'))
    [config, quality, dist] = discretefir_filter();
elseif(strcmp(filter,'Kalman_Filter'))
    [config, quality, dist] = kalman_filter();
else    % if ther is no configurationfunction use the default
    [config, quality, dist] = none();
end

