function x = runScheduleModeFromGenData()

%% create fault free data using the gendata model
warning off all

sim('GenData');


warning on all
%% preprocess fault free data
gendata = gendata(1:end-1);
assignin('base','gendata',gendata);

num_faults = evalin('base','num_faults');
num_slots = 2^num_faults;
DataGen_data = transpose(gendata);

if num_faults > 0
    for idx=2:num_slots
        DataGen_data = [DataGen_data, transpose(gendata)];
    end
end

SampleTime = evalin('base','SampleTime');
SimLength = evalin('base','SimLength');
ts = SampleTime:SampleTime:SimLength*num_slots;
 
DataGen_data = timeseries(transpose(DataGen_data),ts);
assignin('base','DataGen_data',DataGen_data);
assignin('base','SimLength_Schedule',SimLength*num_slots);
%% Get the current fault configuration file
curr_file = 'injection_campaign.xml';

xDoc = xmlread(curr_file);

allCampaignList  = xDoc.getElementsByTagName('campaign');
thisCampaign = allCampaignList.item(0);

thisFileList = thisCampaign.getElementsByTagName('file');
thisFile = thisFileList.item(0);


fault_conf_file = char(thisFile.getTextContent());



%% Open the actual fault konfiguration and set the schedule mode on
xDoc = xmlread(fault_conf_file);

thisList  = xDoc.getElementsByTagName('schedule');
thisElement = thisList.item(0);
thisElement.setTextContent('1');

myXMLwrite(fault_conf_file,xDoc);

%% Open the actual fault konfiguration and get the trigger matrix

thisList  = xDoc.getElementsByTagName('trigger');
thisElement = thisList.item(0);
actMat_str = thisElement.getTextContent();
actMat = str2num(actMat_str);
assignin('base','actMat',actMat);


%% run fault injection
warning off all
SimLength_old = SimLength;
SimLength = SimLength*num_slots;
assignin('base','SimLength',SimLength);

sim('GenFaultyData');

SimLength = SimLength_old;
assignin('base','SimLength',SimLength);

warning on all
%% Write the generated results from the fault injection model to the workspace
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


%% Open the actual fault konfiguration and set the schedule mode off
xDoc = xmlread(fault_conf_file);

thisList  = xDoc.getElementsByTagName('schedule');
thisElement = thisList.item(0);
thisElement.setTextContent('0');

myXMLwrite(fault_conf_file,xDoc);

