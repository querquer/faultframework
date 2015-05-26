function getActivationFromXML()

% loadFaultKonf(FileName_FaultKonf)
% getActivationFromStatus(xml_id,act_status)


act_mat = 0;


% get fault conf from injection campaign file
inj_file = 'injection_campaign.xml';
xDoc = xmlread(inj_file);

allCampaignList  = xDoc.getElementsByTagName('campaign');
thisCampaign = allCampaignList.item(0);

thisFileList = thisCampaign.getElementsByTagName('file');
thisFile = thisFileList.item(0);

faultConf_path_name = char(thisFile.getTextContent());



% read fault configuration file
xDoc = xmlread(faultConf_path_name);

% get the activation matrix
thisList  = xDoc.getElementsByTagName('trigger');
thisElement = thisList.item(0);
act_str = thisElement.getTextContent();
act_mat = str2num(act_str);

assignin('base','act_mat',act_mat);



