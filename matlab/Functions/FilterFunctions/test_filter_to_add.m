function new_filter_collector = test_filter_to_add( added_filter, path_trainData )

set_filter(added_filter);

% Model containing low, middle and high dynamics
class{3} = 'low';
class{2} = 'middle';
class{1} = 'high';

filterCount = 1;

% Loop through low, middle and high dynamics
for c = 1:3

    files = getAvailableFaultCombinations(path_trainData, class{c});
    sizef = size(files);
    
    % Loop through all fault combinations
    for com = 1:sizef(1,2)
        
        [process, triggerBus] = build_trigger(files(com).path);
        
        % if this model has no faults injectet, it is taken as the
        % faultfree data
        if(sum(files(com).faultComb) == 0)
            assignin('base', 'faultfree_data', process);
            continue;
        end
        
        % write the stuff to workspace for use in the simulation
        assignin('base', 'faulty_data', process);
        assignin('base', 'trigger', triggerBus);
        sPTime = size(process.Time);
        SimLength_Schedule = process.Time(sPTime(1,1));
        assignin('base', 'SimLength_Schedule', SimLength_Schedule);
        
        % Create new entry
        % cut the .slx ending
        si = size(added_filter);
        added_filter_name = added_filter(1:si(1,2)-4);
        
        % get the config
        [~ , quality, dist] = get_config_fast(added_filter);
        
        % create new entry in new_filter_collector
        new_filter_collector(filterCount).name = added_filter_name;
        new_filter_collector(filterCount).quality = quality;
        new_filter_collector(filterCount).dist = dist;
        new_filter_collector(filterCount).row = bin2dec13(files(com).faultComb);
        new_filter_collector(filterCount).column = c;
        filterCount = filterCount+1;
        
    end

end

end

