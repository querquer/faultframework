function set_processModel(model_file)
%SET_DETECTOR Summary of this function goes here
%   We assume, that the model where we want to change the detector is still
%   named 'Faultdetection.slx' and is reachable from the current directory.
%   Furthermore the model_file is also assumed to be reachable.

%Load system into matlab workspace
load_system('Processmodel.slx');

%set the parameter or the model reference block
set_param('Processmodel/Processmodel' ,'ModelNameDialog', model_file);

%save the changed system
close_system('Processmodel.slx',1);

end

