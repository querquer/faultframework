%% add_detector 
% This function adds a new type of detectors to the
% LookupTable. Therefore the type has to be evaluated befor by calling the
% function <testDetector.html testDetector>.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code

function add_detector(detectors, path_and_name_lookup)

% Load LookupTable
t = load(path_and_name_lookup);
LookupTable = t.LookupTable;

% Loop through all supported fault combinations of this type of detector:
sDetectors = size(detectors);
for i = 1: sDetectors(1,2);
       
        % Get current detectors
        line = detectors(i).row;
        c = detectors(i).column;

        % Create new entry
        sd = size(LookupTable(line,c).detector);

        % Add entry to existing entries
        LookupTable(line, c).detector(sd(1,2) + 1).name = detectors(i).name;
        LookupTable(line, c).detector(sd(1,2) + 1).path = detectors(i).path;
        LookupTable(line, c).detector(sd(1,2) + 1).fn_rate = detectors(i).fn_rate;
        LookupTable(line, c).detector(sd(1,2) + 1).fp_rate = detectors(i).fp_rate; 
end

% Save Lookup-Table
save(path_and_name_lookup, 'LookupTable');

end

