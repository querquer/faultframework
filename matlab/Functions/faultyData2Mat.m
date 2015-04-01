function faultyData2Mat(path_and_name, faulty_data_struct,trigger_arr)
%% convert the faulty_data_struct into .mat

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

if(1 == 0)
    for idx=1:length(faulty_data_struct)  
        curr_name = strcat(path_and_name, '_', num2str(idx),'.mat');
        faulty_data_mat = faulty_data_struct(idx).value;
        save(curr_name, 'faulty_data_mat');
    end
end
