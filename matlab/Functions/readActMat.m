%FileName_FaultKonf = evalin('base','FileName_FaultKonf');
FileName_FaultKonf = 'test01.xml';
PathName_FaultKonf = evalin('base','PathName_FaultKonf');

file_and_path = [PathName_FaultKonf FileName_FaultKonf];

xDoc = xmlread(file_and_path);


thisList  = xDoc.getElementsByTagName('trigger');
thisElement = thisList.item(0);
actMat_str = thisElement.getTextContent();
assignin('base','act_str',actMat_str);
actMat = str2num(actMat_str);
assignin('base','act_mat',actMat);