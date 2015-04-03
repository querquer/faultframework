%% add_detector 
% This function evaluates a new type of detectors and adds it to the
% LookupTable. To do so, the detector is configured to detect all faults
% and fault combinations. This is done for an examplary process model
% containing high, middle and low dynamics. 

function add_detector(path_detector, name_detector, path_and_name_lookup, path_data)

% Model containing low, middle and high dynamics
class{3} = 'low.slx';
class{2} = 'middle.slx';
class{1} = 'high.slx';
% Loop through low, middle and high dynamics
for c = 1:3

    % Loop through all fault combinations
    files = getAvailableFaultCombinations();
    sizef = size(files);
    for com = 1:sizef(1,2)
        
        % Generate data
        [data, trigger] = get_classification_data_detector(files(com).path);
        
        % Configure detector
        if(isunix())
            path_and_name = [pwd '/add_detector' num2str(round(rand*1000)) '.slx'];
        else
            path_and_name = [pwd '\add_detector' num2str(round(rand*1000)) '.slx'];
        end
        
        sampletime = 0.05;
        evaluation_model = 'Evaluation';
        grad_thr = 0.005;
        [x_list, fval, exitflag, FN_final, FP_final] = design_detector(data, trigger, sampletime, grad_thr, path_and_name, path_detector, evaluation_model);
        
        % Load LookupTable
        t = load(path_and_name_lookup);
        LookupTable = t.LookupTable;
        
        % Get current detectors
        line = bi2de(files(com).faultComb);
        detectors = LookupTable(line,c).detector;
        
        % Create new entry
        sd = size(detectors);
        new_detector.fn_rates = FN_final;
        new_detector.fp_rates = FP_final;
        new_detector.name = name_detector;
        new_detector.path = path_detector;
        
        % Add entry to existing entries
        LoopupTable(line, c).detector(sd(1,2) + 1) = new_detector;
        save(path_and_name_lookup, 'LookupTable');
        
        % Remove temporarily configured detector
        if(exist(path_and_name, 'file'))
            delete(path_and_name);
        end
    end

end


end

