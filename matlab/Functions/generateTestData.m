function generateTestData()
%% Generate faulty_data from the entered process and fault model
% At first the global variables are initalise of readed from workspace. 
% Then it takes the actual fault konfiguration, set the mode to schedule(instead of free running)
% Runs the Fault Injection Modul and provides the generated faulty data as
% struct array

%% Try to read global variables from workspace, if not possible default values are used
try
    SimLength = evalin('base','SimLength');
catch
    assignin('base','SimLength', 10.0);
    SimLength = 10.0;
end
try
    SampleTime = evalin('base','SampleTime');
catch
    assignin('base','SampleTime', 0.01);
    SampleTime = 0.01;
end
try
    evalin('base','GlobalSeed');
catch
    assignin('base','GlobalSeed', 10.0);
end

try
    num_faults = evalin('base','num_faults');
catch
    display('Could not load variable: num_faults');
end

try
    curr_file = evalin('base','filename');
catch
    curr_file = 'faultKonf_TEMP.xml';
end
curr_file_path = strcat('Faultinjection/XML/',curr_file);

%% Open the actual fault konfiguration and set the schedule mode on
xDoc = xmlread(curr_file_path);

thisList  = xDoc.getElementsByTagName('schedule');
thisElement = thisList.item(0);
thisElement.setTextContent('1');

myXMLwrite(curr_file_path,xDoc);


%% Execute script which start the Fault Injection Modul
sim('GenerateData');

%% Open the actual fault konfiguration and set the schedule mode off
xDoc = xmlread(curr_file_path);

thisList  = xDoc.getElementsByTagName('schedule');
thisElement = thisList.item(0);
thisElement.setTextContent('0');

myXMLwrite(curr_file_path,xDoc);

%% Read the faulty data from file and prepare them into the sruct array
if(1 == 0)
    try
        faulty_data = evalin('base','faulty_data');
    catch
        display('Error: No faulty data were found!')
    end

    curr_ts = delsample(faulty_data,'Index',1);

    phase_length = (SimLength/2^num_faults)*(1/SampleTime);
    num_data = 2^num_faults;

    faulty_data_struct = struct();
    for idx=1:num_data
        array_start = phase_length*(idx-1)+1;
        array_end = phase_length*idx;

        faulty_data_struct(idx).value = getsamples(curr_ts,[array_start:array_end]);
    end
    assignin('base','faulty_data_struct', faulty_data_struct);
end
display('Faulty Data were successfully generated!')
