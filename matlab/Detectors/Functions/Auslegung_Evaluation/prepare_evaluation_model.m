%% prepare_evaluation_model
% This function adapts parameter of evaluation model.
% In order to provide some information about the returned detector, we
% need to evaluate the resulting Simulink model one last time. This is
% done by referencing the created Simulink model inside a separate
% evaluation model. Therefore some parameters of this evaluation model
% has to be adapted.

%% Related Functions

%%
% * <extract_path.html extract_path>

%% Source Code
function [inputfile, outputfile] = prepare_evaluation_model( data, sampletime, detector, evaluation_model)

% Adapting filenames based on the current plattform
if(isunix)
    inputfile = [pwd '/input_eval.mat'];
    outputfile = [pwd '/eval_detector.mat'];
else
    inputfile = [pwd '\input_eval.mat'];
    outputfile = [pwd '\eval_detector.mat'];
end

[path, modelname] = extract_path(evaluation_model);

%%
% Preparing the input data.

% Create timestamps for every datum in data
sd = size(data);
time = zeros(1, sd(1,2));
t = 0;
for i = 1:sd(1,2)
    time(i) = t;
    t = t + sampletime;
end

ar = [time ; data];

%%
% Save input file. This file contains the generated inputs which will be
% played back in order to determine the output of the fault detector.

save(inputfile, 'ar');

%%
% Change parameter of model.

load_system([evaluation_model '.slx']);
% Set parameters
set_param([modelname '/Model'], 'ModelName', detector);
set_param([modelname '/From File'], 'FileName', inputfile);
set_param([modelname '/To File'], 'FileName',outputfile);
set_param(modelname , 'StopTime', num2str(t-sampletime));
set_param(modelname, 'FixedStep', num2str(sampletime));
evalin('base', ['SampleTime = ' num2str(sampletime)]);

save_system([evaluation_model '.slx']);
close_system([evaluation_model '.slx']);


end

