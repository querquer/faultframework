%% add_detector 
% This function evaluates a new type of detectors and adds it to the
% LookupTable. To do so, the detector is configured to detect all faults
% and fault combinations. This is done for an examplary process model
% containing high, middle and low dynamics. 

%% Related Functions

%%
% * <getAvailableFaultCombinations.html getAvailableFaultCombinations>
% * <getClassificationDataDetector.html getClassificationDataDetector>
% * <start_designing_detector.html start_designing_detector>

%% Source Code

function add_detector(path_detector, name_detector, path_and_name_lookup, path_data)

% Model containing low, middle and high dynamics
class{3} = 'low';
class{2} = 'middle';
class{1} = 'high';
% Loop through low, middle and high dynamics
for c = 1:3

    % Loop through all fault combinations
    files = getAvailableFaultCombinations(path_data, class{c});
    sizef = size(files);
    for com = 1:sizef(1,2)
        
        % Skip this file if there are no faults injected
        if(sum(files(com).faultComb) == 0)
            continue;
        end
        
        % Generate data
        [data_multifault, data_singlefault, trigger_multifault, trigger_singlefault] = getClassificationDataDetector(files, com);
        
        % Configure detector
        if(isunix())
            path_and_name = [pwd '/add_detector' num2str(round(rand*1000)) '.slx'];
        else
            path_and_name = [pwd '\add_detector' num2str(round(rand*1000)) '.slx'];
        end
        
        sampletime = 0.05;
        [FN_final, FP_final] =  start_designing_detector(data_multifault, data_singlefault, trigger_multifault, trigger_singlefault, sampletime, path_and_name, path_detector);
        
        % Load LookupTable
        t = load(path_and_name_lookup);
        LookupTable = t.LookupTable;
        
        % Get current detectors
        line = bi2de(files(com).faultComb);
        detectors = LookupTable(line,c).detector;
        
        % Create new entry
        sd = size(detectors);

        % Add entry to existing entries
        LookupTable(line, c).detector(sd(1,2) + 1).name = name_detector;
        LookupTable(line, c).detector(sd(1,2) + 1).path = path_detector;
        LookupTable(line, c).detector(sd(1,2) + 1).fn_rate = FN_final;
        LookupTable(line, c).detector(sd(1,2) + 1).fp_rate = FP_final;
        
        save(path_and_name_lookup, 'LookupTable');
        
        % Remove temporarily configured detector
        if(exist(path_and_name, 'file'))
            delete(path_and_name);
        end
        
        % Display progess
        disp_dbg(['Progress: ' num2str(((c-1)*sizef(1,2)+com)/(3*sizef(1,2)))]);
    end

end


end

