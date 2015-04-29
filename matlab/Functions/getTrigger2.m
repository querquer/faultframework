%% getTrigger
% Builds a trigger phase vector which contains the trigger data of all active faults in the specific phase of the schedule


%% Related Functions

%%
% * <findTrigger.html findTrigger>


%% Source Code
function trigger_phase_vec = getTrigger2(trigger_struct, schedule_nr)
% Call findTrigger to get the information which fault was in the given
% phase active.
trigger_vec = findTrigger2(trigger_struct,schedule_nr);

fault_types = {'value_correlated_offset','time_correlated_offset','value_correlated_noise','time_correlated_noise','const_offset','const_noise','outlier','spike','stuck_at_zero','stuck_at_x','saturation','const_delay','time_correlated_delay'};

% Iterate over the result vector from findVecor and get the corresponding
% trigger data to the faults
trigger_phase_vec = struct;
counter = 1;
for idy = 1:length(trigger_vec)
    if(trigger_vec(idy) == 1)
        trigger_phase_vec(counter).name = fault_types(idy);
        trigger_phase_vec(counter).data = trigger_struct(idy,schedule_nr);
        
        counter = counter + 1;
    end
end

