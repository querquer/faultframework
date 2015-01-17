function  create_single_lc(x, path_and_name )
%CREATE_SINGLE_LC Summary of this function goes here
%   Detailed explanation goes here
file = 'lc_template.slx';
tmp = 'current_template';

%copy template to generate a file to work on.
if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

copyfile(file, [tmp '.slx']);

load_system([tmp '.slx']);


windowsize = round(x(3));
if(windowsize <= 0)
    windowsize = 1;
end

fun = round(x(2));
if(fun <= 0)
    fun = 1;
else
    if(fun > 3)
        fun = 3;
    end
end

threshold = x(1);
    
%change windowsize
%get current config
conf = get_param([tmp '/Subsystem/Delay Line'], 'MaskValues');
conf{1} = num2str(windowsize);
set_param([tmp '/Subsystem/Delay Line'], 'MaskValues', conf);

%set function
set_param([tmp '/Subsystem/Function'], 'Value' , num2str(fun));

%set threshold
set_param([tmp '/Subsystem/Switch'], 'Threshold' , num2str(threshold));

%save model
save_system(tmp, path_and_name);

close_system(tmp, false);

if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end
end

