function set_filter(model_file)
%SET_FILTER Summary of this function goes here
%   We assume, that the model where we want to change the filter is still
%   named 'Filter.slx' and is reachable from the current directory.
%   Furthermore the model_file is also assumed to be reachable.

%Load system into matlab workspace
load_system('Filter.slx');

%set the parameter or the model reference block
set_param('Filter/Filter/' ,'ModelNameDialog', model_file);

%save the changed system
close_system('Filter.slx',1);

%Load system into matlab workspace
load_system('Filter/Filter_evaluation/quality_check.slx');

%set the parameter or the model reference block
set_param('quality_check/Filter/' ,'ModelNameDialog', model_file);

%save the changed system
close_system('Filter/Filter_evaluation/quality_check.slx',1);

end

