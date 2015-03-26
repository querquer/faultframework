%% start_designing_detector
% By calling this function, passed data will be formated as needed by the
% function 'design_detector' and a detector will be desinged based on this
% data.

function [fn, fp] = start_designing_detector(data, trigger, sampletime, path_and_name, path_detector)

% 'Data' is assumed to contain the sensor observations.
% 'Trigger' is assumed to be a array of different trigger signals
% representing whether a specific fault type was injected at the according
% timestep or not. As we need to know which fault type we are confronted
% with, the 'trigger' array should constist of a structs with the fields:

%%
% * 'name': containing the name of the fault type
% * 'data': containing the trigger signal according to this fault type.

%% build input data

st = size(trigger);
for i = 1:st(1,2)
    dat(i).data = data;
    dat(i).name = trigger(i).name;
end

% Specify some parameters
evaluation_model = 'Evaluation';
grad_thr = 0.05;

[x_list, fval, exitflag, fn, fp] = design_detector(dat, trigger, sampletime, grad_thr, path_and_name, path_detector, evaluation_model)


end

