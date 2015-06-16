%% filterSuggestedDetectors
% This function filters the list of detectors produced by the function
% "suggestSolution". If an fn_rate is specified, detectors with a
% false-negative rate greater then this value will be deleted from the
% list. Likewise the fp_rate specifies a threshold for the false-positive
% rate of detectors. 'name' is meant to contain names of detectors to
% exclude from the list as well.

%% Related Functions
% There are no sub-functions implemented by ourself.
%% Source Code

function detectors = filterSuggestedDetectors(detectors, fn_rate, fp_rate, names)

sDetectors = size(detectors);
i = 1;
while(i<=sDetectors(1,2))
    
    % Check for false-negative rate
    if(exist('fn_rate', 'var') && ~isempty(fn_rate))
        if(detectors(i).fn_rate.fn_rate > fn_rate)
            detectors(i) = [];
            sDetectors = size(detectors);
            continue;
        end    
    end
    
    % Check for false-positive rate
    if(exist('fp_rate', 'var') && ~isempty(fp_rate))
        if(detectors(i).fp_rate.fp_rate > fp_rate)
            detectors(i) = [];
            sDetectors = size(detectors);
            continue;
        end
    end
    
    % Check for name
    if(exist('names', 'var') && ~isempty(names) && iscell(names))
        sn = size(names);
        delete = 0;
        for k=1:sn(1,2)
            if~(strcmp(detectors(i).name, names{1,k}))
                delete = 1;
            end
        end

        if(delete == 1)
            detectors(i) = [];
            sDetectors = size(detectors);
            continue;
        end
    end
     
    
    i = i + 1;
end

end

