%% delete_detector
% This function removes the specified detector from the lookup table.

%% Related Functions
%%
% There are no sub-functions implemented by ourself.

%% Source Code

function  delete_detector(name, path_and_name_lookup)

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
        detectors = LookupTable(r,c).detector;
        sdetectors = size(detectors);
        % search for detector with name == 'name'
        for i=1:sdetectors(1,2)
            if(strcmp(detectors(i).name, name))
                % delete from table
                LookupTable(r,c).detector(i) = [];
               
                break;
            end
        end
         
    end
end

% save new lookup table
save(path_and_name_lookup, 'LookupTable');


end

