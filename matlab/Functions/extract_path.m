%% Extract_path
% This function is a helper function which extracts the name of a file and
% the path to this file from a given path with the file name. 

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
function [path, name] = extract_path(path_and_name)
%EXTRACT_PATH Returns the path to a given file. "path_and_name" has to
%contain also the path of the file.

if(isunix)
    %search for last "/"
    k = strfind(path_and_name, '/');
else
    %search for last "\"
    k = strfind(path_and_name, '\');
end

 sk = size(k);
 sp = size(path_and_name);
 if(sk(1,1) > 0)
    path = path_and_name(1:k(sk(1,2)));
    name = path_and_name(k(sk(1,2))+1:sp(1,2));
 else
    path = pwd;
    name = path_and_name;
 end

end

