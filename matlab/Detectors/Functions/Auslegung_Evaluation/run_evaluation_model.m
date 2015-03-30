%% run_evaluatioin_model
% In order to provide some information about the returned detector, we
% need to evaluate the resulting Simulink model one last time. As we
% assume different fault types, we need to asses the resulting detector
% according to all these fault types. 

function out = run_evaluation_model(data, sampletime, detector, evaluation_model)

% Get number of fault types
sd = size(data);
[path, modelname] = extract_path(evaluation_model);
% Loop through all fault types
for i = 1:sd(1,2)
    dt = data(i).data;
    % Prepare evaluation model
    [inputfile, outputfile] = prepare_evaluation_model(dt, sampletime, detector, evaluation_model);
    
    % Run model
    load_system([evaluation_model '.slx']);
    sim( modelname);
    close_system([evaluation_model '.slx']);
    
    % Load outputs
    f = load(outputfile);
    det = f.data(2,:);
    
    out(i).name = data(i).name;
    sd = size(det);
    out(i).data = [det(1,2:sd(1,2)),0];
    
    % Delete temporary files
    delete(inputfile, outputfile);
end

end

