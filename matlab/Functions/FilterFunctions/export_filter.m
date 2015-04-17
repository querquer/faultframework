%% export_filter
% This function export the filter, wich is actually set in the Filter.slx.
% The export target must be the input.

%% Source Code

function export_filter( export_path )
%EXPORT_FILTER export the actual configured filter to the given path

load_system('Filter.slx');
actual_filter = get_param('Filter/Filter/' ,'ModelNameDialog');

if(isunix())
    file_location = ['Filter/' actual_filter];
else
    file_location = ['Filter\' actual_filter];
end

copyfile(file_location, export_path);

end

