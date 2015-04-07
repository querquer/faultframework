function convertFaultyData()
%% Convert the faulty data to several spezific data types


%% Load all needed variables from workspace
try
    SimLength = evalin('base','SimLength');
catch
    display('Error:Could not load SimLength!')
end

try
    SampleTime = evalin('base','SampleTime');
catch
    display('Error:Could not load SampleTime!');
end

try
    num_faults = evalin('base','num_faults');
catch
    display('Error:Could not load num_faults!')
end

try
    act_vec = evalin('base','act_vec');
catch
    display('Error:Could not load act_vec!')
end

try
    faulty_data = evalin('base','faulty_data');
catch
    display('Error: No faultydata found!');
end
   
fault_types = {'value_correlated_offset','time_correlated_offset','value_correlated_noise','time_correlated_noise','const_offset','const_noise','outlier','spike','stuck_at_zero','stuck_at_x','saturation','const_delay','time_correlated_delay'};

debugMode = 1;

%% Builds a struct array from faulty data
% The struct array contains the data from the schedule run seperated by
% each fault combination.
% The amount of fault combinations is determined by 2^(number of activated faults).
num_data = 2^num_faults;
phase_length = (SimLength/num_data)*(1/SampleTime);

faulty_data_struct = struct();
for idx=1:num_data
    array_start = int32(phase_length*(idx-1)+2);
    array_end = int32(phase_length*idx);

    faulty_data_struct(idx).value = getsamples(faulty_data,[array_start:array_end]);
end

if(debugMode == 1)
    assignin('base','faulty_data_struct',faulty_data_struct);
end


%% Builds a struct array which contains the data from the single fault run
% The amount of single fault runs is determined only by the number of
% activated faults.
counter = 0;

for idx=1:length(act_vec)   
    if(act_vec(idx) == 1)
        counter = counter + 1;
        data_singlefault(counter).name = fault_types(idx);
        data_singlefault(counter).data = transpose(faulty_data_struct(counter+1).value.Data);
    end 
end

if(debugMode == 1)
    assignin('base','data_singlefault',data_singlefault);
end

%% Builds a struct array from the trigger data which were provided by the fault framework
% Each element contains the trigger data of a fault for the whole schdule
% run. There is one element for each fault.
% The order is determined by the Trigger Bus and is based on the fault ids
% in the fault configuration files.
trigger_struct = evalin('base','trigger');

trigger_arr(1).data = double(trigger_struct(1).value_correlated_offset.data);
trigger_arr(2).data = double(trigger_struct(1).time_correlated_offset.data);
trigger_arr(3).data = double(trigger_struct(1).value_correlated_noise.data);
trigger_arr(4).data = double(trigger_struct(1).time_correlated_noise.data);
trigger_arr(5).data = double(trigger_struct(1).const_offset.data);
trigger_arr(6).data = double(trigger_struct(1).const_noise.data);
trigger_arr(7).data = double(trigger_struct(1).outlier.data);
trigger_arr(8).data = double(trigger_struct(1).spike.data);
trigger_arr(9).data = double(trigger_struct(1).stuck_at_zero.data);
trigger_arr(10).data = double(trigger_struct(1).stuck_at_x.data);
trigger_arr(11).data = double(trigger_struct(1).saturation.data);
trigger_arr(12).data = double(trigger_struct(1).const_delay.data);
trigger_arr(13).data = double(trigger_struct(1).time_correlated_delay.data);

if(debugMode == 1)
    assignin('base','trigger_arr',trigger_arr);
end

%% Builds a struct array which contains the trigger belonging to the data single fault array
% The first element contains the trigger information to the first element
% of the data trigger array.
if(1 == 1)
    counter = 1;
    for idy = 1+1:num_faults+1
        phase_start = int32(phase_length*(idy-1)+2);
        phase_end = int32(phase_length*idy);     
        
        trigger_vec = findTrigger(trigger_arr,idy,phase_length);
       
        for idz = 1:length(trigger_vec)          
            if(trigger_vec(idz) == 1)
                curr_trigger = transpose(trigger_arr(idz).data);
                trigger_singlefault_temp(counter).name = fault_types(idz);
                trigger_singlefault_temp(counter).data = getsamples(curr_trigger,[phase_start:phase_end]);
            end
        end
        counter = counter + 1;
    end
    assignin('base','trigger_singlefault_temp',trigger_singlefault_temp);
    %sort trigger_singlefault with fault_types
    counter = 1;
    for ida = 1:length(fault_types)
        for idb = 1:length(trigger_singlefault_temp)
            
            if(strcmp(fault_types(ida),trigger_singlefault_temp(idb).name))
                trigger_singlefault(counter).name = fault_types(ida);
                trigger_singlefault(counter).data = trigger_singlefault_temp(idb).data;
                counter = counter + 1;
            end
        end
        
    end
end

if(debugMode == 1)
    assignin('base','trigger_singlefault',trigger_singlefault);
end


%% Builds a array which contains the data of the last schedule run
% The last run in the schedule containing a fault activation with all
% faults.

data_multifault = transpose(faulty_data_struct(num_data).value.Data);

if(debugMode == 1)
    assignin('base','data_multifault',data_multifault);
end

%% Builds a struct array which contains the trigger belonging to the data multi fault array

last_phase_start = int32(phase_length*(num_data-1)+2);
last_phase_end = int32(phase_length*num_data);

counter = 0;
for idx=1:length(act_vec)
    if(act_vec(idx) == 1)
        counter = counter +1;
        
        %curr_trigger = delsample(trigger_arr(idx),'Index',1);
        curr_trigger = transpose(trigger_arr(idx).data);
        
        trigger_multifault(counter).name = fault_types(idx);
        trigger_multifault(counter).data = getsamples(curr_trigger,[last_phase_start:last_phase_end]);
    end
end

if(debugMode == 1)
    display('Successfully generated faulty data!');
    assignin('base','trigger_multifault',trigger_multifault);
end

