%% test_filter_to_add
% This function test a new filter on every possible fault configuration for
% the three dynamics. After this, you can add the new filter to the
% lookuptable with the function <add_filter.html add_filter>.

%% add your own filter
% If you have your own filter model and you want to integrated it to this
% project you must follow this steps:
%
% # Be sure that you use fixed-step discrete solver, were the step size is named
% *SampleTime* and the Stop time is *inf*.
% 
% # Put your .slx data in the folder /Filter.
% 
% # If you want change the properties of your filter automaticaly you have
% to write a function which do so. This function should be added in the
% <get_config.html get_config.m> and the <get_config_fast.html
% get_config_fast.m>. How the function should look like is described there.
% 
% # Now you can use the add_filter function to add your filter to the
% suggested solutions. The best way is to use the *Choose Filter* button,
% choose your filter and than push the *Add Filter* button. The calculations
% can take a long time!

%% Related Functions

% * <add_filter.html add_filter>
% * <set_filter.html set_filter>
% * <getAvailableFaultCombinations.html getAvailableFaultCombinations>
% * <build_trigger.html build_trigger>
% * <bin2dec13.html bin2dec13>

%% Source Code

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

