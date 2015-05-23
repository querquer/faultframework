%% add_filter
% This function integrate a new filter in the <build_suggestion_table.html
% lookuptable> or update the values of an existing filter. Therefore, the filter is tested on any possible fault
% configuration.

%% Related Functions
% * <set_filter.html set_filter>
% * <getAvailableFaultCombinations.html getAvailableFaultCombinations>
% * <build_trigger.html build_trigger>
% * <bin2dec13.html bin2dec13>

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
% to write a function wich do so. This function should be added in the
% <get_config.html get_config.m> and the <get_config_fast.html
% get_config_fast.m>. How the function should look like is described there.
% 
% # Now you can use the add_filter function to add your filter to the
% suggested solutions. The best way is to use the *Choose Filter* button,
% choose your filter and than push the *Add Filter* button. The calculations
% can take a long time!

%% Source Code

function add_filter( new_filter_collector, path_and_name_lookup )
%ADD_FILTER This function integrate a new filter in the lookuptable.

% get the lookuptable
t = load(path_and_name_lookup);
LookupTable = t.LookupTable;

sFilters = size(new_filter_collector);
for i = 1:sFilters(1,2);
    
    line = new_filter_collector(i).row;
    c = new_filter_collector(i).column;
    
    
    filter = LookupTable(line, c).filter;
    sf = size(filter);
        
    % is the new Filter already in the LookupTable?
    filterPresence = 0;
    for filterCount = 1:sf(1,2)
        if(strcmp(filter(filterCount).name, new_filter_collector(i).name))
            % filter already in the LookupTable
            filterPresence = filterCount;
        end
    end
        
    if(filterPresence ~= 0)
        % overwrite existing values
        LookupTable(line, c).filter(filterPresence).name = new_filter_collector(i).name;
        LookupTable(line, c).filter(filterPresence).quality = new_filter_collector(i).quality;
        LookupTable(line, c).filter(filterPresence).dist = new_filter_collector(i).dist;
    else
        % Add entry to existing entries
        LookupTable(line, c).filter(sf(1,2) + 1).name = new_filter_collector(i).name;
        LookupTable(line, c).filter(sf(1,2) + 1).quality = new_filter_collector(i).quality;
        LookupTable(line, c).filter(sf(1,2) + 1).dist = new_filter_collector(i).dist;
    end

    save(path_and_name_lookup, 'LookupTable');
        
end

