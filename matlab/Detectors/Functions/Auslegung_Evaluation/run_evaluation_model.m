function out = run_evaluation_model(data, sampletime, detector, evaluation_model)
%RUN_EVALUATION_MODEL Summary of this function goes here
%   Detailed explanation goes here
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

