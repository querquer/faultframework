function [param_string, quality, dist] = discrete_filter()
%DISCRETE_FILTER find best configuration for given data
%   tries every configuration, given in the discrete_filter.txt and find
%   the one with the best quality
configurations = load('Filter/discrete_filter.txt');

% initial values
quality = 10000;
dist = 10000;
param_string = '';

% for all configurations
for i=1:size(configurations)
    
    % set new configuration
    new_param_string = sprintf('[%.1f %.1f]', configurations(i,1), configurations(i,2));
    load_system('Filter/Discrete_Filter.slx');
    set_param('Discrete_Filter/Discrete Filter/', 'Denominator', new_param_string);
    close_system('Filter/Discrete_Filter.slx',1);
    
    % evaluate with this configuration
    [new_quality, new_dist] = filter_evaluation;
    
    % save if it is actually the best configuration
    if(quality > new_quality)
       quality = new_quality;
       dist = new_dist;
       param_string = new_param_string;
    end
end

% set best filter
load_system('Filter/Discrete_Filter.slx');
set_param('Discrete_Filter/Discrete Filter/', 'Denominator', param_string);
close_system('Filter/Discrete_Filter.slx',1);

end