%% runScheduleModeFromGenData
% Generate faulty_data from the entered process and fault model in schedule
% mode. At first we generate the fault free data from the given process
% model and parameters. Afterwards we set up these data for the further
% processing in the fault injection modul. Then we configure the fault
% injetion modul and run the injection on the data.


function x = runScheduleModeFromGenData()

%% create fault free data using the gendata model

warning off all
sim('GenData');
warning on all

%%
% In this step we generate a new timeseries of fault free data. The new
% timeseries is a x times duplication of the old timeseries. This is 
% needed due to the injection of x diffrent fault combinations.

gendata = gendata(1:end-1);
assignin('base','gendata',gendata);

num_faults = evalin('base','num_faults');
num_slots = 2^num_faults;
DataGen_data = transpose(gendata);

% the amount of faults in the fault configuration file is readed
if num_faults > 0
    for idx=2:num_slots
        DataGen_data = [DataGen_data, transpose(gendata)];
    end
end

% the simulation parameter from the gui is readed
SampleTime = evalin('base','SampleTime');
SimLength = evalin('base','SimLength');

% generate a new series of fault free data which can now are passed to the
% fault injection modul
ts = SampleTime:SampleTime:SimLength*num_slots;
DataGen_data = timeseries(transpose(DataGen_data),ts);

assignin('base','DataGen_data',DataGen_data);
assignin('base','SimLength_Schedule',SimLength*num_slots);
%% 
% Get the current fault configuration file and set the mode to 'schedule'
% This is needed due to the possibility that the injection modul have
% several modi.


curr_file = 'injection_campaign.xml';

xDoc = xmlread(curr_file);

allCampaignList  = xDoc.getElementsByTagName('campaign');
thisCampaign = allCampaignList.item(0);

thisFileList = thisCampaign.getElementsByTagName('file');
thisFile = thisFileList.item(0);


fault_conf_file = char(thisFile.getTextContent());

xDoc = xmlread(fault_conf_file);

thisList  = xDoc.getElementsByTagName('schedule');
thisElement = thisList.item(0);
thisElement.setTextContent('1');

myXMLwrite(fault_conf_file,xDoc);

%% 
% Open the current fault konfiguration and get the trigger matrix.

thisList  = xDoc.getElementsByTagName('trigger');
thisElement = thisList.item(0);
actMat_str = thisElement.getTextContent();
actMat = str2num(actMat_str);
assignin('base','actMat',actMat);


%% 
% run the fault injection modul

warning off all
SimLength_old = SimLength;
SimLength = SimLength*num_slots;
assignin('base','SimLength',SimLength);

sim('GenFaultyData');

SimLength = SimLength_old;
assignin('base','SimLength',SimLength);

warning on all
%% 
% Write the generated results from the fault injection model to the workspace
if(exist('faultfree_data','var'))
    assignin('base','faultfree_data',faultfree_data);
else
    display('Error: Could not run fault injection in schedule mode');
end

if(exist('faulty_data','var'))
    assignin('base','faulty_data',faulty_data);
else
    display('Error: Could not run fault injection in schedule mode');
end

if(exist('trigger','var'))
    assignin('base','trigger',trigger);
else
    display('Error: Could not run fault injection in schedule mode');
end


%% 
% Open the actual fault konfiguration and set the schedule mode off
xDoc = xmlread(fault_conf_file);

thisList  = xDoc.getElementsByTagName('schedule');
thisElement = thisList.item(0);
thisElement.setTextContent('0');

myXMLwrite(fault_conf_file,xDoc);

