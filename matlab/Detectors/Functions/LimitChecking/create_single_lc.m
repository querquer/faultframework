%% Create_single_lc
% This is a subroutine of create_detector_lc.m It is meant to create a
% Simulink-Block containing a sensor fault detector detecting only one
% fault type. This Block will be copied to another Simulink-Model, which
% then will contain all single detectors.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code

function  create_single_lc(x, path_and_name )
%CREATE_SINGLE_LC Summary of this function goes here
%   Detailed explanation goes here
file = 'lc_template.slx';
tmp = ['current_template' num2str(round(rand*1000))];

%copy template to generate a file to work on.
if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

copyfile(file, [tmp '.slx']);

load_system([tmp '.slx']);

% determine configuration from 'x'
windowsize = round(x(3));
fun = round(x(2));
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

% delete temporarily model
if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end
end

