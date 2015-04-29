%% runScheduleMode
% Generate faulty_data from the entered process and fault model un schedule
% mode. At first the global variables are initalise of readed from workspace. 
% Then it takes the actual fault konfiguration, set the mode to schedule(instead of free running)
% Runs the Fault Injection Modul in schedule mode

%% Related Functions

%%
% * <myXMLwrite.html myXMLwrite>


%% Source Code
function runScheduleMode()
%% 

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
    num_faults = evalin('base','num_faults');
catch
    display('Could not load variable: num_faults');
end


%% Get the current fault configuration file
curr_file = 'injection_campaign.xml';

xDoc = xmlread(curr_file);

allCampaignList  = xDoc.getElementsByTagName('campaign');
thisCampaign = allCampaignList.item(0);

thisFileList = thisCampaign.getElementsByTagName('file');
thisFile = thisFileList.item(0);

if(isunix())
    fault_conf_file = (thisFile.getTextContent());
else
    fault_conf_file = char(thisFile.getTextContent());
end


%% Open the actual fault konfiguration and set the schedule mode on
xDoc = xmlread(fault_conf_file);

thisList  = xDoc.getElementsByTagName('schedule');
thisElement = thisList.item(0);
thisElement.setTextContent('1');

myXMLwrite(fault_conf_file,xDoc);


%% Execute script which start the Fault Injection Modul
warning off all

sim('GenerateData');

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




