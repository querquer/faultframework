function faultyData2Mat(path_and_name, act_vec, faulty_data_struct,trigger_arr, phase_length)
%% creates from the faulty_data_struct and trigger_arr a cell array
% faultyData2Mat('Data/low/low', act_vec, faulty_data_struct,trigger_arr,phase_length);




for idx=1:length(faulty_data_struct)  



    % get data from faulty data struct
    
    faulty_data_mat{1}= faulty_data_struct(idx).value;

    % find the active faults in the current schedule and extract them
    faulty_data_mat{2} = getTrigger(trigger_arr,idx,phase_length);
    % getTrigger(trigger_arr,2,length(faulty_data_struct(1).value.data));

    % save data and fault trigger as .mat
    act_vec_str = num2str(findTrigger(trigger_arr,idx,phase_length));
    act_vec_str = act_vec_str(find(~isspace(num2str(act_vec_str))));
    curr_name = strcat(path_and_name,'_',act_vec_str,'_',num2str(idx),'.mat');
    save(curr_name, 'faulty_data_mat');
end


if(1 == 0)
    num_data = length(trigger_arr(1).data);
    trigger_global = zeros(1,num_data);
    matrix_trigger = [transpose(trigger_arr(1).data) ; 
        transpose(trigger_arr(2).data) ; 
        transpose(trigger_arr(3).data) ; 
        transpose(trigger_arr(4).data) ;
        transpose(trigger_arr(5).data) ;
        transpose(trigger_arr(6).data) ;
        transpose(trigger_arr(7).data) ;
        transpose(trigger_arr(8).data) ;
        transpose(trigger_arr(9).data) ;
        transpose(trigger_arr(10).data) ;
        transpose(trigger_arr(11).data) ;
        transpose(trigger_arr(12).data) ;
        transpose(trigger_arr(13).data) ;];

    assignin('base','matrix_trigger',matrix_trigger);
    trigger_global = sum(matrix_trigger);
    assignin('base','trigger_global',trigger_global);
end