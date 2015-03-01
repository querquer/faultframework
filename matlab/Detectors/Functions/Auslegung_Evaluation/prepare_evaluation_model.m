function [inputfile, outputfile] = prepare_evaluation_model( data, sampletime, detector, evaluation_model)
%PREPARE_EVALUATION adapts parameter of evaluation model
%   Detailed explanation goes here

%filenames
if(isunix)
    inputfile = [pwd '/input_eval.mat'];
    outputfile = [pwd '/eval_detector.mat'];
else
    inputfile = [pwd '\input_eval.mat'];
    outputfile = [pwd '\eval_detector.mat'];
end

[path, modelname] = extract_path(evaluation_model);

sd = size(data);
%create timestamps for every datum in data
time = zeros(1, sd(1,2));
t = 0;
for i = 1:sd(1,2)
    time(i) = t;
    t = t + sampletime;
end

ar = [time ; data];
save(inputfile, 'ar');

%change parameter of model
load_system([evaluation_model '.slx']);

set_param([modelname '/Model'], 'ModelName', detector);
set_param([modelname '/From File'], 'FileName', inputfile);
set_param([modelname '/To File'], 'FileName',outputfile);
set_param(modelname , 'StopTime', num2str(t-sampletime));
evalin('base', ['SampleTime = ' num2str(sampletime)]);

save_system([evaluation_model '.slx']);
close_system([evaluation_model '.slx']);


end

