%% add_filter
% This function integrate a new filter in the <build_suggestion_table.html
% lookuptable>. Therefor the filter is tested on any pssible fault
% configuration.

%% Related Functions
% * <set_filter.html set_filter>
% * <getAvailableFaultCombinations.html getAvailableFaultCombinations>
% * <build_trigger.html build_trigger>
% * <bin2dec13.html bin2dec13>

%% Anleitung Filter selber bauen
% TODO: mit inhalt füllen
%% Source Code

function add_filter( added_filter, path_trainData )
%ADD_FILTER This function integrate a new filter in the lookuptable.

set_filter(added_filter);

% get the lookuptable
t = load('Functions/lookuptable.mat');
LookupTable = t.LookupTable;

% Model containing low, middle and high dynamics
class{3} = 'low';
class{2} = 'middle';
class{1} = 'high';

% Loop through low, middle and high dynamics
for c = 1:3

    files = getAvailableFaultCombinations(path_trainData, class{c});
    sizef = size(files);
    
    % Loop through all fault combinations
    for com = 1:sizef(1,2)
        
        [process, triggerBus] = build_trigger(files(com).name);
        
        % if this model has no faults injectet, it is taken as the
        % faultfree data
        if(sum(files(com).faultComb) == 0)
            assignin('base', 'faultfree_data', process);
            continue;
        end
        
        % write the stuff to workspace for use in the simulation
        assignin('base', 'faulty_data', process);
        assignin('base', 'trigger', triggerBus);
        
        % Create new entry
        new_filter.name = added_filter;
        [~ , new_filter.quality, new_filter.dist] = get_config_fast(added_filter);
        
        % Get current filter
        line = bin2dec13(files(com).faultComb);
        filter = LookupTable(line, c).filter;
        sf = size(filter);
        
        % is the new Filter already in the LookupTable?
        filterPresence = 0;
        for filterCount = 1:sf(1,2)
            if(strcmp(filter(filterCount).name, added_filter))
                % filter already in the LookupTable
                filterPresence = filterCount;
            end
        end
        
        if(filterPresence ~= 0)
            % overwrite existing values
            LookupTable(line, c).filter(filterPresence) = new_filter;
        else
            % Add entry to existing entries
            LookupTable(line, c).filter(sf(1,2) + 1) = new_filter;
        end

        save('Functions/lookuptable.mat', 'LookupTable');
    end

end

end

