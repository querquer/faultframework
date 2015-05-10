function [config, quality, dist] = median_filter_alternativ()
%MEDIAN_FILTER find best configuration for given data
%   tries every configuration, given in the median_configs.txt and find
%   the one with the best quality
configurations = load('Filter/median_configs.txt');

% initial values
quality = 10000;
dist = 10000;

% for all configurations
for i=1:size(configurations)
    
    % set new configuration
    load_system('Filter/Median_Filter.slx');
    set_param('Median_Filter/Constant/', 'Value', num2str(configurations(i)));
    close_system('Filter/Median_Filter.slx',1);
    
    % evaluate this configuration
    [new_quality, new_dist] = filter_evaluation;
    
    % save configuration if it is actually the best
    if(quality > new_quality)
       quality = new_quality;
       config = configurations(i);
       dist = new_dist;
    end
end

% set best configuration
load_system('Filter/Median_Filter.slx');
set_param('Median_Filter/Constant/', 'Value', num2str(config));
close_system('Filter/Median_Filter.slx',1);

end

