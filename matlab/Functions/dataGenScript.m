path = 'Data\03\middle';

runScheduleModeFromGenData;
display('Faulty data were successfuly generated!');

convertFaultyData;
display('Converting faulty data was successful!');  

faultyData2Mat(path, act_vec, faulty_data_struct,trigger_struct);
display('Faulty data were successfully saved!');  