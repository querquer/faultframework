function add_filter( added_filter )
%ADD_FILTER Summary of this function goes here
%   Detailed explanation goes here 

set_filter(added_filter);

t = load('Functions/lookuptable.mat');
LookupTable = t.LookupTable;

% Loop through low, middle and high dynamics
for class = 1:3

% TODO: hier einfügen das verschiedene dynamiken als eingang in das
% evaluationsmodell genutzt werden.
    
    % Loop through all fault combinations
    for com = 1:8191
        
        % Create new entry
        new_filter.name = added_filter;
        [new_filter.quality, new_filter.dist] = filter_evaluation();
        
        % Get current filter
        filter = LookupTable(com,class).filter;
        sf = size(filter);
        
        % Add entry to existing entries
        LookupTable(com, class).filter(sf(1,2) + 1) = new_filter;
        save('Functions/lookuptable.mat', 'LookupTable');
    end

end

end

