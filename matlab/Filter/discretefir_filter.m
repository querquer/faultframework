function [param_string, quality, dist] = discretefir_filter()
configurations = load('Filter/discretefir_filter.txt');

quality = 10000;
dist = 10000;
param_string = '';

for i=1:size(configurations)
    new_param_string = sprintf('[%.1f %.1f]', configurations(i,1), configurations(i,2));
    load_system('Filter/DiscreteFIR_Filter.slx');
    set_param('DiscreteFIR_Filter/Discrete FIR Filter/', 'Coefficients', new_param_string);
    close_system('Filter/DiscreteFIR_Filter.slx',1);
    
    [new_quality, new_dist] = filter_evaluation;
    if(quality > new_quality)
       quality = new_quality;
       dist = new_dist;
       param_string = new_param_string;
    end
end

load_system('Filter/DiscreteFIR_Filter.slx');
set_param('DiscreteFIR_Filter/Discrete FIR Filter/', 'Coefficients', param_string);
close_system('Filter/DiscreteFIR_Filter.slx',1);

end