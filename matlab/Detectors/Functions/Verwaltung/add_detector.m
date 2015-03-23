%% add_detector 
% This function evaluates a new type of detectors and adds it to the
% LookupTable. To do so, the detector is configured to detect all faults
% and fault combinations. This is done for an examplary process model
% containing high, middle and low dynamics. 

function add_detector(path_detector, name_detector, path_and_name_lookup)

% Model containing low, middle and high dynamics
models{3} = 'low.slx';
models{2} = 'middle.slx';
models{1} = 'high.slx';
% Loop through low, middle and high dynamics
for class = 1:3

    % Loop through all fault combinations
    for com = 1:8191
        
        % Generate data
        [data, trigger] = generate_faulty_data_detector(models{class});
        
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
        line = bi2de(failures);
        detectors = LookupTable(line,class).detector;
        
        % Create new entry
        sd = size(detectors);
        new_detector.fn_rates = FN_final;
        new_detector.fp_rates = FP_final;
        new_detector.name = name_detector;
        
        % Add entry to existing entries
        detectors{sd(1,2) + 1} = new_detector;
        
        % Save LokkupTable to file
        LoopupTable(line, class).detector = detectors;
        save(path_and_name_lookup, 'LookupTable');
        
        % Remove temporarily configured detector
        if(exist(path_and_name, 'file'))
            delete(path_and_name);
        end
    end

end


end

