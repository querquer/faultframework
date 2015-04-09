%% createXML
% Creates a Fault Konfiguration XML-File.
% The script try to read variables created/enteres through the
% gui_faultlist/id. IF these variables are not defined, there will be set a default value
% instead


%% Source Code
function createXML(filename)


%% Creates a new XML-File
docNode = com.mathworks.xml.XMLUtils.createDocument('injection');
toc = docNode.getDocumentElement;

%% Set up variable which count the number of active faults
num_faults = 0;

%% First noce containing the schedule mode
schedule_node = docNode.createElement('schedule');
schedule_node.appendChild(docNode.createTextNode('0'));
toc.appendChild(schedule_node);

%% Faultlist contains all labels of faults
fault_types = {'value correlated offset','time correlated offset','value correlated noise','time correlated noise','const offset','const noise','outlier','spike','stuck at zero','stuck at x','saturation','const delay','time correlated delay'};

%% Iterate through the Faultlist and creates entries for general parameters and individual parameters
for idx = 1:numel(fault_types)
    curr_fault = docNode.createElement('fault');
    id = idx-1;
    
    curr_attr = docNode.createElement('label');
    curr_attr.appendChild(docNode.createTextNode(fault_types{idx}));
    curr_fault.appendChild(curr_attr);
    
    curr_attr = docNode.createElement('id');
    curr_attr.appendChild(docNode.createTextNode(int2str(id)));
    curr_fault.appendChild(curr_attr);
    
    curr_attr = docNode.createElement('activation');
    try
        curr_attr.appendChild(docNode.createTextNode(int2str(evalin('base',strcat('id',int2str(id),'activation')))));
        num_faults = num_faults +1; 
    catch
        curr_attr.appendChild(docNode.createTextNode('0'));
    end
    curr_fault.appendChild(curr_attr);

    curr_attr = docNode.createElement('occurrence');
    try
        curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'occurrence'))));
    catch
        curr_attr.appendChild(docNode.createTextNode('0'));
    end
    curr_fault.appendChild(curr_attr);
    
    curr_attr = docNode.createElement('factor');
    curr_attr.setAttribute('type','param');
    try
        curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'factor'))));
    catch
        curr_attr.appendChild(docNode.createTextNode('0'));
    end
    curr_fault.appendChild(curr_attr);
    
    % additional fault setup
    if(id == 0)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
    end 
    if(id == 1)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('1'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('correlation');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'correlation'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('sin(x)'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('amplitude');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'amplitude'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
    end   
    
    if(id == 2)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('pdf');
        try
            curr_attr.setAttribute('min',(evalin('base',strcat('id',int2str(id),'pdfmin'))));
        catch
            curr_attr.setAttribute('min','0.05');
        end
        try
            curr_attr.setAttribute('min',(evalin('base',strcat('id',int2str(id),'pdfmax'))));
        catch
            curr_attr.setAttribute('max','5');
        end
        try
            curr_attr.setAttribute('min',(evalin('base',strcat('id',int2str(id),'pdfstep_size'))));
        catch
            curr_attr.setAttribute('step_size','0.1');
        end
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'pdf'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('( 1 / (sqrt(2*3.1416*1) ) ) * exp( -( ((x-3)^2) / 2) )'));
        end
        curr_fault.appendChild(curr_attr);
    end
    
    if(id == 3)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('1'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('pdf');
        try
            curr_attr.setAttribute('min',evalin('base',strcat('id',int2str(id),'pdfmin')));
        catch
            curr_attr.setAttribute('min','0.05');
        end
        try
            curr_attr.setAttribute('min',evalin('base',strcat('id',int2str(id),'pdfmax')));
        catch
            curr_attr.setAttribute('max','5');
        end
        try
            curr_attr.setAttribute('min',evalin('base',strcat('id',int2str(id),'pdfstep_size')));
        catch
            curr_attr.setAttribute('step_size','0.1');
        end
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'pdf'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('( 1 / (sqrt(2*3.1416*1) ) ) * exp( -( ((x-3)^2) / 2) )'));
        end
        curr_fault.appendChild(curr_attr);
    end    
    
    if(id == 4)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('amplitude');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'amplitude'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end    
        curr_fault.appendChild(curr_attr);
    end 
    
    if(id == 5)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('pdf');
        try
            curr_attr.setAttribute('min',evalin('base',strcat('id',int2str(id),'pdfmin')));
        catch
            curr_attr.setAttribute('min','0.05');
        end
        try
            curr_attr.setAttribute('min',evalin('base',strcat('id',int2str(id),'pdfmax')));
        catch
            curr_attr.setAttribute('max','5');
        end
        try
            curr_attr.setAttribute('min',evalin('base',strcat('id',int2str(id),'pdfstep_size')));
        catch
            curr_attr.setAttribute('step_size','0.1');
        end
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'pdf'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('( 1 / (sqrt(2*3.1416*1) ) ) * exp( -( ((x-3)^2) / 2) )'));
        end
        curr_fault.appendChild(curr_attr);
    end  
    
    if(id == 6)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('negative');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'negative'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
    end  
    
    if(id == 7)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('length');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'length'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0.2'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('amplitude');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'amplitude'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('( 1 / (sqrt(2*3.1416*0.5) ) ) * exp( -( ((x)^2) / 0.2) ) * 1.772455'));
        end
        curr_fault.appendChild(curr_attr);
    end  
    
    if(id == 8)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('length');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'length'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
    end 
    
    if(id == 9)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('top');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'top'))));
        catch
        	curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('bottom');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'bottom'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('length');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'length'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);       
    end 
    
    if(id == 10)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('top');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'top'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('bottom');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'bottom'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
    end 
    
    if(id == 11)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('param');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'param'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('0'));
        end
        curr_fault.appendChild(curr_attr);
    end 
    
    if(id == 12)
        curr_attr = docNode.createElement('permanent');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'permanent'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('1'));
        end
        curr_fault.appendChild(curr_attr);
        
        curr_attr = docNode.createElement('correlation');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'correlation'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('sin(x)+cos(x)'));
        end
        curr_fault.appendChild(curr_attr)
        
        curr_attr = docNode.createElement('delay');
        curr_attr.setAttribute('type','param');
        try
            curr_attr.appendChild(docNode.createTextNode(evalin('base',strcat('id',int2str(id),'delay'))));
        catch
            curr_attr.appendChild(docNode.createTextNode('2'));
        end
        curr_fault.appendChild(curr_attr);
    end 
    
    toc.appendChild(curr_fault);
end

%% Checks the designated filename 
if filename > 0
    curr_filename = strcat('Faultinjection/XML/',filename);
else
    curr_filename = 'Faultinjection/XML/faultKonf_TEMP';
end

%% Write the calculated amount of faults as variable to the workspace
assignin('base','num_faults', num_faults);    

%% Finally creation of the XML-File
xmlwrite(curr_filename,docNode);
type(curr_filename);

