function out = run_evaluation_model(data, sampletime, detector, evaluation_model)
%RUN_EVALUATION_MODEL Evaluates the created sensor fault detector.
%   In order to provide some information about the returned detector, we
%   need to evaluate the resulting Simulink model one last time. As we
%   assume different fault types, we need to asses the resulting detector
%   according to all these fault types. 

sd = size(data);
[path, modelname] = extract_path(evaluation_model);
for i = 1:sd(1,2)
    dt = data(i).data;
    %prepare model
    [inputfile, outputfile] = prepare_evaluation_model(dt, sampletime, detector, evaluation_model);
    
    %run model
    load_system([evaluation_model '.slx']);
    sim( modelname);
    close_system([evaluation_model '.slx']);
    
    %load outputs
    f = load(outputfile);
    det = f.data(2,:);
    
    out(i).name = data(i).name;
    out(i).data = det;
    
    %clear up
    delete(inputfile, outputfile);
end

end

