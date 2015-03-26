function models = find_konfiguration(path)
%FIND_DETECTORS Summary of this function goes here
%   Detailed explanation goes here
    
    %list all files and folders of specified path
    list = dir(path);
    
    %filter for '.slx'-files as they are containing the modles
    sl = size(list);
    if(sl(1,1) > 0)
        sf = 1;
        for i=1:sl(1,1)
            name = list(i).name;
            sn = size(name);
            if(sn(1,2) > 4)
                ending = name(sn(1,2)-3:sn(1,2));
                if(strcmp(ending, '.xml'))
                    models{sf} = name;
                    sf = sf + 1;
                end
            end
        end
    else
        models = '';
    end
 

end

