function [config, quality, dist] = median_filter()
configurations = load('Filter/median_configs.txt');
quality = 10000;
dist = 10000;
for i=1:size(configurations)
    load_system('Filter/Median_Filter.slx');
    set_param('Median_Filter/Constant/', 'Value', num2str(configurations(i)));
    close_system('Filter/Median_Filter.slx',1);
    
    [new_quality, new_dist] = filter_evaluation;
    if(quality > new_quality)
       quality = new_quality;
       config = configurations(i);
       dist = new_dist;
    end
end

load_system('Filter/Median_Filter.slx');
set_param('Median_Filter/Constant/', 'Value', num2str(config));
close_system('Filter/Median_Filter.slx',1);

end

