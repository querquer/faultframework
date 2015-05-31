%% findTrigger
% Build a array which contains a 1 if the fault was active in the given schedule


%% Source Code
function trigger_vec = findTrigger(trigger_struct, schedule_nr)

trigger_vec = zeros(1,13);
end_search = length(trigger_struct(1,1).data);

% search which fault(s) are active in the given phase space
for idx = 1:end_search
    if trigger_struct(1,schedule_nr).data(idx) == 1
        trigger_vec(1) = 1;
    end
    if trigger_struct(2,schedule_nr).data(idx) == 1
        trigger_vec(2) = 1;
    end
    if trigger_struct(3,schedule_nr).data(idx) == 1
        trigger_vec(3) = 1;
    end
    if trigger_struct(4,schedule_nr).data(idx) == 1
        trigger_vec(4) = 1;
    end
    if trigger_struct(5,schedule_nr).data(idx) == 1
        trigger_vec(5) = 1;
    end
    if trigger_struct(6,schedule_nr).data(idx) == 1
        trigger_vec(6) = 1;
    end
    if trigger_struct(7,schedule_nr).data(idx) == 1
        trigger_vec(7) = 1;
    end
    if trigger_struct(8,schedule_nr).data(idx) == 1
        trigger_vec(8) = 1;
    end
    if trigger_struct(9,schedule_nr).data(idx) == 1
        trigger_vec(9) = 1;
    end
    if trigger_struct(10,schedule_nr).data(idx) == 1
        trigger_vec(10) = 1;
    end
    if trigger_struct(11,schedule_nr).data(idx) == 1
        trigger_vec(11) = 1;
    end
    if trigger_struct(12,schedule_nr).data(idx) == 1
        trigger_vec(12) = 1;
    end   
end