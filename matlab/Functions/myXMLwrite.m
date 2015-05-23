%% myXMLwrite
% Same functionality as xlmwrite from matlab, but without adding
% empty lines after every line.


%% Source Code
function ST = myXMLwrite(fileName, docNode)
docNodeRoot=docNode.getDocumentElement;
str=strrep(char(docNode.saveXML(docNodeRoot)), 'encoding="UTF-16"', 'encoding="UTF-8"');
fid=fopen(fileName, 'w');
fwrite(fid, str);
ST = fclose(fid);
