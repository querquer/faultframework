%% start_designing_detector
% By calling this function, passed data will be formated as needed by the
% function 'design_detector' and a detector will be desinged based on this
% data.

%% Related Functions

%%
% * <design_detector.html design_detector>


%% Source Code
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

st = size(trigger_multifault);

% divide data into learning data and evaluation data (2/3, 1/3)
size_data = size(data_multifault);
data_eval.name = 'Multifault';
n = round(size_data(1,2)/3);
data_eval.data = data_multifault(1,1:n);
data_multifault = data_multifault(1,n+1:size_data(1,2));

trigger_eval.name = 'Multifault';

for i = 1:st(1,2)
    data(i).data = data_multifault;
    data(i).name = trigger_multifault(i).name;
    if(i==1)
        trigger_eval.data = trigger_multifault(i).data(1,1:n); 
        trigger_multifault(i).data = trigger_multifault(i).data(1,n+1:size_data(1,2));
    else
        trigger_eval.data = trigger_eval.data +  trigger_multifault(i).data(1,1:n);
        trigger_multifault(i).data = trigger_multifault(i).data(1,n+1:size_data(1,2));
    end
end

% Check whether all trigger values lower or equal to 1
trigger_eval.data(trigger_eval.data>1) = 1;

% Specify some parameters
evaluation_model = 'Evaluation';
grad_thr = 0.05;

[x_list, fval, exitflag, fn, fp] = design_detector(data,data_eval, data_singlefault, trigger_multifault,trigger_eval, trigger_singlefault, sampletime, grad_thr, path_and_name, path_detector, evaluation_model)


end

