function trigger_vec = findTrigger(trigger_arr, schedule_nr, phase_length)

trigger_vec = zeros(1,13);

start_search = int32(phase_length*(schedule_nr-1)+2);
end_search = int32(phase_length*schedule_nr);

% search which fault(s) are active in the given phase space
for idx = start_search:end_search
    if trigger_arr(1).data(idx) == 1
        trigger_vec(1) = 1;
    end
    if trigger_arr(2).data(idx) == 1
        trigger_vec(2) = 1;
    end
    if trigger_arr(3).data(idx) == 1
        trigger_vec(3) = 1;
    end
    if trigger_arr(4).data(idx) == 1
        trigger_vec(4) = 1;
    end
    if trigger_arr(5).data(idx) == 1
        trigger_vec(5) = 1;
    end
    if trigger_arr(6).data(idx) == 1
        trigger_vec(6) = 1;
    end
    if trigger_arr(7).data(idx) == 1
        trigger_vec(7) = 1;
    end
    if trigger_arr(8).data(idx) == 1
        trigger_vec(8) = 1;
    end
    if trigger_arr(9).data(idx) == 1
        trigger_vec(9) = 1;
    end
    if trigger_arr(10).data(idx) == 1
        trigger_vec(10) = 1;
    end
    if trigger_arr(11).data(idx) == 1
        trigger_vec(11) = 1;
    end
    if trigger_arr(12).data(idx) == 1
        trigger_vec(12) = 1;
    end   
end