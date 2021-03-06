%% set_filter_evaluation
% This function set another filter evaluation method in the Filter.slx
%

%% Source Code

function set_filter_evaluation(model_file)
%SET_FILTER set another evaluation model
%   We assume, that the model where we want to change the filter_evaluation is still
%   named 'Filter.slx' and is reachable from the current directory.
%   Furthermore the model_file is also assumed to be reachable.

%Load system into matlab workspace
load_system('Filter.slx');

%set the parameter or the model reference block
set_param('Filter/Filter_evaluation/' ,'ModelNameDialog', model_file);

%save the changed system
close_system('Filter.slx',1);

end

