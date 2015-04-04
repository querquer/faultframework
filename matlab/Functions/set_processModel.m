%% Set_processModel
% This function sets the model-reference of 'Processmodel.slx' to the
% model specified by 'model_file'. We assume, that the model where we want to change the detector is still
% named 'Processmodel.slx' and is reachable from the current directory.
% Furthermore the model_file is also assumed to be reachable.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code

function set_processModel(model_file)

%Load system into matlab workspace
load_system('Processmodel.slx');

%set the parameter or the model reference block
set_param('Processmodel/Processmodel' ,'ModelNameDialog', model_file);

%save the changed system
close_system('Processmodel.slx',1);

end

