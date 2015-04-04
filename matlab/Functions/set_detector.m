%% Set_detector
% This function sets the model-reference of 'Faultdetection.slx' to the
% model specified by 'model_file'. We assume, that the model where we want to change the detector is still
% named 'Faultdetection.slx' and is reachable from the current directory.
% Furthermore the model_file is also assumed to be reachable.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code

function set_detector(model_file)

%Load system into matlab workspace
load_system('Faultdetection.slx');

%set the parameter or the model reference block
set_param('Faultdetection/Model/' ,'ModelNameDialog', model_file);

%save the changed system
close_system('Faultdetection.slx',1);

end

