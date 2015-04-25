%% testDetector 
% This function evaluates a new type of detectors. To do so, the detector is configured to detect all faults
% and fault combinations. This is done for an examplary process model
% containing high, middle and low dynamics. 

%% Related Functions

%%
% * <getAvailableFaultCombinations.html getAvailableFaultCombinations>
% * <getClassificationDataDetector.html getClassificationDataDetector>
% * <start_designing_detector.html start_designing_detector>
% * <bin2dec13.html bin2dec13>
% * <disp_dbg.html disp_dbg>

%% Source Code

function detectors = testDetector(path_detector, name_detector, path_data)

% Model containing low, middle and high dynamics
class{3} = 'low';
class{2} = 'middle';
class{1} = 'high';

counterDetectors = 1;
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
        
        % Build entry for Lookup-Table

        detectors(counterDetectors).name = name_detector;
        detectors(counterDetectors).path = path_detector;
        detectors(counterDetectors).fn_rate = FN_final;
        detectors(counterDetectors).fp_rate = FP_final;
        detectors(counterDetectors).row = bin2dec13(files(com).faultComb);
        detectors(counterDetectors).column = c;
        
        counterDetectors = counterDetectors +1;
        
        % Remove temporarily configured detector
        if(exist(path_and_name, 'file'))
            delete(path_and_name);
        end
        
        % Display progess
        disp_dbg(['Progress: ' num2str(((c-1)*sizef(1,2)+com)/(3*sizef(1,2)))]);
    end

end


end

