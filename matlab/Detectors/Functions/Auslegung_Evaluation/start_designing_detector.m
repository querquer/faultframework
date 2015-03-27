%% start_designing_detector
% By calling this function, passed data will be formated as needed by the
% function 'design_detector' and a detector will be desinged based on this
% data.

function [fn, fp] = start_designing_detector(data_multifault, data_singlefault, trigger_multifault, trigger_singlefault, sampletime, path_and_name, path_detector)

% 'data_multifault' is assumed to contain the sensor observations where mutliple fault types were injected.
% 'data_singlefault' is assumed to contain sensor observations where only
% one fault type were injected.
% 'trigger_multifault' is assumed to be a array of different trigger
% signals, each for one fault type.
% 'trigger_singlefault' is assumed to be a array of different trigger
% signals, each for one fault type.
% Trigger singals representing whether a specific fault type was injected at the according
% timestep or not. As we need to know which fault type we are confronted
% with, the 'trigger' array should constist of a structs with the fields:

%%
% * 'name': containing the name of the fault type
% * 'data': containing the trigger signal according to this fault type.

%% build input data

st = size(trigger);
for i = 1:st(1,2)
    data(i).data = data_multifault;
    data(i).name = trigger_multifault(i).name;
end

% Specify some parameters
evaluation_model = 'Evaluation';
grad_thr = 0.05;

[x_list, fval, exitflag, fn, fp] = design_detector(data_multifault, data_singlefault, trigger_multifault, trigger_singlefault, sampletime, grad_thr, path_and_name, path_detector, evaluation_model)


end

