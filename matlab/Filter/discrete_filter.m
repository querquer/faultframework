function [param_string, quality, dist] = discrete_filter()
configurations = load('Filter/discrete_filter.txt');

quality = 10000;
dist = 10000;
param_string = '';

for i=1:size(configurations)
    new_param_string = sprintf('[%.1f %.1f]', configurations(i,1), configurations(i,2));
    load_system('Filter/Discrete_Filter.slx');
    set_param('Discrete_Filter/Discrete Filter/', 'Denominator', new_param_string);
    close_system('Filter/Discrete_Filter.slx',1);
    
    [new_quality, new_dist] = filter_evaluation;
    if(quality > new_quality)
       quality = new_quality;
       dist = new_dist;
       param_string = new_param_string;
    end
end

load_system('Filter/Discrete_Filter.slx');
set_param('Discrete_Filter/Discrete Filter/', 'Denominator', param_string);
close_system('Filter/Discrete_Filter.slx',1);

end