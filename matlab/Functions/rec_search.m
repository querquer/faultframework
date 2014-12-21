function name = rec_search(path, exp)
%REC_SEARCH searches recursive for files with specific names and returns
%its full name
%   Detailed explanation goes here
name = [];
curr_pwd = pwd;
cd(path);
mfiles = dir('*.m');

sf = size(mfiles);
for i = 1:sf(1,1)
    if(isempty(regexp(mfiles(i).name, regexptranslate('wildcard',exp))) == 0)
        name = mfiles(i).name;
    end
end

if(isempty(name))
    folder = dir('*');
    sf = size(folder);
    for i = 1:sf(1,1)
        if(folder(i).isdir && strcmp(folder(i).name, '..') == 0 && strcmp(folder(i).name, '.') == 0) 
            if(isunix)
                name = rec_search([pwd '/' folder(i).name], exp);
            else
                name = rec_search([pwd '\' folder(i).name], exp);
            end
            
            if(isempty(name) == 0)
                break;
            end
        end
    end
end

cd(curr_pwd);
end

