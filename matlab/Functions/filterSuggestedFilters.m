%% filterSuggestedFilters
% This function filters the list of filters produced by the function
% "suggestSolution". If an quality is specified, filters with a
% quality greater then this value will be deleted from the
% list. Likewise the dist specifies a threshold for the distance
% between the filtered and unfiltered data. 'name' is meant to 
% contain names of filters to
% exclude from the list as well.

%% Related Functions
% * <suggest_solution.html suggest_solution>
% * <filter_evaluation.html filter_evaluation>

%% Source Code

function filters = filterSuggestedFilters(filters, quality, dist, names)

sFilters = size(filters);
i = 1;
while(i<=sFilters(1,2))
    
    % Check for quality
    if(exist('quality', 'var') && ~isempty(quality))
        if(filters(i).quality > quality)
            filters(i) = [];
            sFilters = size(filters);
            continue;
        end    
    end
    
    % Check for distance rate
    if(exist('dist', 'var') && ~isempty(dist))
        if(filters(i).dist > dist)
            filters(i) = [];
            sFilters = size(filters);
            continue;
        end
    end
    
    % Check for name
    if(exist('names', 'var') && ~isempty(names) && iscell(names))
        sn = size(names);
        delete = 0;
        for k=1:sn(1,2)
            if(strcmp(filters(i).name, names{1,k}))
                delete = 1;
            end
        end

        if(delete == 1)
            filters(i) = [];
            sFilters = size(filters);
            continue;
        end
    end
     
    
    i = i + 1;
end

end


