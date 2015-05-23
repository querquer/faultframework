%% loadFaultKonf
% Set the given Fault Configuration File into the Injection Campaign File


%% Source Code
function loadFaultKonf(file_name_faultKonf)

curr_file = 'injection_campaign.xml';

xDoc = xmlread(curr_file);

allCampaignList  = xDoc.getElementsByTagName('campaign');
thisCampaign = allCampaignList.item(0);

thisFileList = thisCampaign.getElementsByTagName('file');
thisFile = thisFileList.item(0);

if(isunix())
    thisFile.setTextContent(strcat('Faultinjection/XML/',file_name_faultKonf));
else
    thisFile.setTextContent(strcat('Faultinjection\XML\',file_name_faultKonf));
end


myXMLwrite(curr_file,xDoc);





