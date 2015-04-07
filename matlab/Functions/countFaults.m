function countFaults(file_name_faultKonf)
%% Count all faults and build a activation vector from the given fault configuration file and provied them to the workspace

% Open the XML by the given fault configuraion name
xDoc = xmlread(strcat('Faultinjection/XML/',file_name_faultKonf));
allFaultList  = xDoc.getElementsByTagName('fault');


%% Iterate through the Fault Konfiguration 
% Increment num_faults if activation is 1.
% Set 1 in the activation vector if the corresponding fault is set as
% activated.
num_faults = 0;
act_vec = [0,0,0,0,0,0,0,0,0,0,0,0,0];

for idx = 0:allFaultList.getLength-1
    thisFault = allFaultList.item(idx);
    
    thisFileActivationList = thisFault.getElementsByTagName('activation');
    thisFileActivation = thisFileActivationList.item(0);

    findAct = char(thisFileActivation.getFirstChild.getData);
    if(findAct == '1')   
        act_vec(idx+1) = 1;
        num_faults = num_faults + 1;
    end
end

%% Write both created varibles to the workspace
assignin('base','num_faults', num_faults);
assignin('base','act_vec', act_vec);



