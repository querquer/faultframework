function trigger_phase_vec = getTrigger(trigger_arr, schedule_nr, phase_length)

trigger_vec = findTrigger(trigger_arr,schedule_nr,phase_length);

fault_types = {'value_correlated_offset','time_correlated_offset','value_correlated_noise','time_correlated_noise','const_offset','const_noise','outlier','spike','stuck_at_zero','stuck_at_x','saturation','const_delay','time_correlated_delay'};

trigger_phase_vec = struct;
counter = 1;
for idy = 1:length(trigger_vec)
    if(trigger_vec(idy) == 1)
        curr_trigger = transpose(trigger_arr(idy).data);
        phase_start = int32(phase_length*idy+2);
        phase_end = int32(phase_length*(idy+1));
        
        trigger_phase_vec(counter).name = fault_types(idy);
        trigger_phase_vec(counter).data = getsamples(curr_trigger,[phase_start:phase_end]);
        counter = counter + 1;
    end
end



