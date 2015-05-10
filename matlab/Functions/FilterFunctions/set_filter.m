%% set_filter
% This function set another filter in the Filter.slx
%

%% Source Code

function set_filter(model_file)
%SET_FILTER set another filter
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
load_system('Filter/Filter_evaluation/filter_quality_check_simple.slx');

%set the parameter or the model reference block
set_param('filter_quality_check_simple/Filter/' ,'ModelNameDialog', model_file);

close_system('Filter/Filter_evaluation/filter_quality_check_simple.slx',1);

end

