function loadFaultKonf(file_name_faultKonf)
%% Set the given Fault Konfiguration File into the Injection Campaign File

curr_file = 'injection_campaign.xml';

xDoc = xmlread(curr_file);

allCampaignList  = xDoc.getElementsByTagName('campaign');
thisCampaign = allCampaignList.item(0);

thisFileList = thisCampaign.getElementsByTagName('file');
thisFile = thisFileList.item(0);

thisFile.setTextContent(strcat('Faultinjection/XML/',file_name_faultKonf));

myXMLwrite(curr_file,xDoc);

assignin('base','filename', file_name_faultKonf);




