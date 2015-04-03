%% faultCombis
% This functions searches the folder specified by path_data and class in
% order to get all fault type combinations saved until now.

function files = getAvailableFaultCombinations(path_data, class)

%% Search for files
if(isunix())
    current_path = [path_data '/' class];
else
    current_path = [path_data '\' class];
end

list =  dir(current_path);

    %filter for '.mat'-files as they are containing the data
    sl = size(list);
    if(sl(1,1) > 0)
        sf = 1;
        for i=1:sl(1,1)
            name = list(i).name;
            sn = size(name);
            if(sn(1,2) > 4)
                ending = name(sn(1,2)-3:sn(1,2));
                if(strcmp(ending, '.mat'))
                    files(sf).name = name;
                    if(isunix())
                        files(sf).path = [current_path '/' name];
                    else
                        files(sf).path = [current_path '\' name];
                    end
                    
                    %read fault combination from string
                    % find binary numer in string --> _*_
                    ind = strfind(name, '_');
                    str_num = name(ind(1,1)+1:ind(1,2)-1);
                    % insert ',' after every number to convert to binary
                    % afterwards
                    sstr = size(str_num);
                    for k=1:sstr(1,2)-1
                        if(k==1)
                            new_str = [str_num(k) ','];
                        else
                            new_str = [new_str str_num(k) ','];
                        end
                    end
                    new_str = [new_str str_num(sstr(1,2))];
                    
                    % convert to binary number
                    files(sf).faultComb = str2num(new_str);
                    
                    sf = sf + 1;
                end
            end
            
            % search for subdirectories
            if(list(i).isdir())
                if(~strcmp(list(i).name, '.') && ~strcmp(list(i).name, '..'))
                    % go into subdirecotry
                    f = getAvailableFaultCombinations(current_path, list(i).name);
                    sizef = size(f);
                    if(exist('files','var'))
                        files = [files , f];
                    else
                        files = f;
                    end
                    sf = sf + sizef(1,2);
                end  
            end
        end
    else
        files = '';
    end

end

