%% faultyData2Mat
% Save the results from the workspace as .mat to the givon location

%% Related Functions

%%
% * <findTrigger.html findTrigger>
% * <getTrigger.html getTrigger>

%% Source Code
function faultyData2Mat(path_and_name, act_vec, faulty_data_struct,trigger_struct)
% example: 
% faultyData2Mat('Data\low\', act_vec, faulty_data_struct,trigger_struct)
phase_length = length(faulty_data_struct(1).value.Data);

for idx=1:length(faulty_data_struct)  

    % get data from faulty data struct
    faulty_data_mat{1}= faulty_data_struct(idx).value;

    % find the active faults in the current schedule and extract them
    faulty_data_mat{2} = getTrigger2(trigger_struct,idx);
    

    % save data and fault trigger as .mat
    act_vec_str = num2str(findTrigger2(trigger_struct,idx));
    act_vec_str = act_vec_str(find(~isspace(num2str(act_vec_str))));
    curr_name = strcat(path_and_name,'_',act_vec_str,'_',num2str(idx),'.mat');
    save(curr_name, 'faulty_data_mat');
end
