function convertFaultyData()
%% convertFaultyData

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
    evalin('base','GlobalSeed');
catch
    display('Error:Could not load GlobalSeed!')
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

%% prepare faulty_data to a struct array

phase_length = (SimLength/2^num_faults)*(1/SampleTime);
num_data = 2^num_faults;

faulty_data_struct = struct();
for idx=1:num_data
    array_start = phase_length*(idx-1)+1;
    array_end = phase_length*idx;

    faulty_data_struct(idx).value = getsamples(faulty_data,[array_start:array_end]);
end

if(debugMode == 1)
    assignin('base','faulty_data_struct',faulty_data_struct);
end

%% fill data_singlefault
counter = 0;

for idx=1:length(act_vec)

    data_singlefault(idx).name = fault_types(idx);
    data_singlefault(idx).data = zeros(1,phase_length);
    
    if(act_vec(idx) == 1)
        counter = counter + 1;
        data_singlefault(idx).data = transpose(faulty_data_struct(counter+1).value.Data);
    end 
end

if(debugMode == 1)
    assignin('base','data_singlefault',data_singlefault);
end

%% trigger convert to array
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

%% fill trigger_singlefault


counter = 1;
phase_length = (SimLength/2^num_faults)*(1/SampleTime);
num_data = 2^num_faults;


for idx=1:length(act_vec)
    trigger_singlefault(idx).name = fault_types(idx);
    trigger_singlefault(idx).data = zeros(1,phase_length);
    
    if(act_vec(idx) == 1)
        counter = counter + 1;

        %delete first sample
        %trigger_arr(idx).data(1) = [];
        curr_trigger = transpose(trigger_arr(idx).data);
        
        % determine the location of the correct phase
        array_start = phase_length*(counter-1)+1;
        array_end = phase_length*counter;
        
        trigger_singlefault(idx).data = getsamples(curr_trigger,[array_start:array_end]);
    end
end

if(debugMode == 1)
    assignin('base','trigger_singlefault',trigger_singlefault);
end


%% fill data_multifault

data_multifault = transpose(faulty_data_struct(num_data).value.Data);

if(debugMode == 1)
    assignin('base','data_multifault',data_multifault);
end

%% fill trigger_multifault

last_phase_start = phase_length*(num_data-1)+1;
last_phase_end = phase_length*num_data;

for idx=1:length(act_vec)
    trigger_multifault(idx).name = fault_types(idx);
    trigger_multifault(idx).data = zeros(1,phase_length);
    
    if(act_vec(idx) == 1)

        %curr_trigger = delsample(trigger_arr(idx),'Index',1);
        curr_trigger = transpose(trigger_arr(idx).data);
        
        trigger_multifault(idx).data = getsamples(curr_trigger,[last_phase_start:last_phase_end]);
    end
end

if(debugMode == 1)
    assignin('base','trigger_multifault',trigger_multifault);
end

