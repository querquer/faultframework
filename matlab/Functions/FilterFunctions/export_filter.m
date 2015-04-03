function export_filter( export_path )
%EXPORT_FILTER export the actual configured filter to the given path

load_system('Filter.slx');
actual_filter = get_param('Filter/Filter/' ,'ModelNameDialog');

if(isunix())
    file_location = ['Filter/' actual_filter '.slx'];
else
    file_location = ['Filter\' actual_filter '.slx'];
end

copyfile(file_location, export_path);

end

