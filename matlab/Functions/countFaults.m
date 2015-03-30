function countFaults(file_name_faultKonf)
%% Count the amount of faults were the activation is 1 in the given Fault Konfiguration

num_faults = 0;
act_vec = [0,0,0,0,0,0,0,0,0,0,0,0,0];

xDoc = xmlread(strcat('Faultinjection/XML/',file_name_faultKonf));
allFaultList  = xDoc.getElementsByTagName('fault');


%% Iterate through the Fault Konfiguration and increment num_faults if activation is 1

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

%% Write the amount of faults to the workspace
assignin('base','num_faults', num_faults);
assignin('base','act_vec', act_vec);



