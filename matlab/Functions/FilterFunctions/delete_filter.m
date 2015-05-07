%% delete_filter
% This function removes the specified filter from the lookup table.

%% Related Functions
%%
% There are no sub-functions implemented by ourself.

%% Source Code

function  delete_filter(name, path_and_name_lookup)

% load lookup table
t = load(path_and_name_lookup);
LookupTable = t.LookupTable;
slook = size(LookupTable);

% loop through the whole table
% loop through columns, which are representing the dynamics low, middle and
% high
for c=1:slook(1,2)
    % loop through rows, which are representing the fault combinations
    for r=1:slook(1,1)
        % get detectors of current cell
        filters = LookupTable(r,c).filter;
        sfilters = size(filters);
        % search for detector with name == 'name'
        for i=1:sfilters(1,2)
            if(strcmp(filters(i).name, name))
                % delete from table
                LookupTable(r,c).filter(i) = [];
               
                break;
            end
        end
         
    end
end

% save new lookup table
save(path_and_name_lookup, 'LookupTable');


end

