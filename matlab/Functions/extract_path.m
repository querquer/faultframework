function [path, name] = extract_path(path_and_name)
%EXTRACT_PATH Returns the path to a given file. "path_and_name" has to
%contain also the path of the file.

if(isunix)
    %search for last "/"
    k = strfind(path_and_name, '/');
    sk = size(k);
    sp = size(path_and_name);
    path = path_and_name(1:k(sk(1,2)));
    name = path_and_name(k(sk(1,2))+1:sp(1,2));
else
    %search for last "\"
    k = strfind(path_and_name, '\');
    sk = size(k);
    sp = size(path_and_name);
    path = path_and_name(1:k(sk(1,2)));
    name = path_and_name(k(sk(1,2))+1:sp(1,2));
end

end

