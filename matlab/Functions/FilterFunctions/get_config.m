function [config, quality] = get_config()
%GET_CONFIG Summary of this function goes here
%   Detailed explanation goes here
load_system('Filter.slx');
filter = get_param('Filter/Filter/' ,'ModelNameDialog');
close_system('Filter.slx',1);

if(strcmp(filter,'Median_Filter'))
    [config, quality] = median_filter();
elseif(strcmp(filter,'Discrete_Filter'))
    [config, quality] = discrete_filter();
elseif(strcmp(filter,'DiscreteFIR_Filter'))
    [config, quality] = discretefir_filter();
elseif(strcmp(filter,'Kalman_Filter'))
    [config, quality] = kalman_filter();
else
    [config, quality] = none();
end

