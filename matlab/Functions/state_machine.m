%% state_machine
% This state machine represent the states of the user in the main use case
% of the framework. These states are used to handle the shown figure and
% the grey out of the buttons.

function state_machine(state, handles) 
% check if the handles is empty
if(not(isempty(handles)))   
    % buttons which dont have to grey out in any state
    buttonListStatic = {'pushbutton_chooseDetector','pushbutton_chooseFilter','pushbutton_testDetector','pushbutton_testFilter','pushbutton_addDetctor','pushbutton_addFilter'};
    


    %% Check through all cased and switch the image and the buttons which will be greyed out
    switch state
        case 1
            % process model have to be picked
            buttonList = {'pushbutton_ChooseProcessModel'};
            text_string = 'Choose Process Model';
        case 2
            % fault configuration have to be picked
            buttonList = {'pushbutton_chooseFaultKonf','pushbutton_setfault'};
            text_string = 'Choose Fault Konfiguration';
        case 3
            % suggest solution have to be klicked
            buttonList = {'pushbutton_sugsol'};
            text_string = 'Suggest Solution';
        case 4
            % click on a emelemnt in the table
            buttonList = {'pushbutton_filteringDetector','pushbutton_filteringFilter','pushbutton_deleteDetector','pushbutton_deleteFilter'};
            text_string = 'Select Element from Table';
        case 5
            % design have to be clicked
            buttonList = {'pushbutton_desdet','pushbutton_desfil','pushbutton_filteringDetector','pushbutton_filteringFilter','pushbutton_deleteDetector','pushbutton_deleteFilter'};
            text_string = 'Design Detector or Filter';
        case 6
            buttonList = {'pushbutton_export_detector','pushbutton_export_filter'};
            text_string = 'Export Detector or Filter';
        otherwise
            buttonList = {};
            text_string = 'error';
    end
    % grey out the buttons with the specified buttons
    hideButtons = evalin('base','hideButtons');
    if hideButtons == 1
        greyOutButton([buttonList buttonListStatic], handles);    
    end
    
    
    % display the new state via text element
    set(handles.staticText_state,'string',text_string);
    
    %% Save the new state of the machine to the workspace
    assignin('base','state_machine',state);
else
    %% If there are no handles, get guihandles
    handles = guihandles;
    
    % buttons which dont have to grey out in any state
    buttonListStatic = {'pushbutton_chooseDetector','pushbutton_chooseFilter','pushbutton_testDetector','pushbutton_testFilter','pushbutton_addDetctor','pushbutton_addFilter'};
   

    %% Check through all cased and switch the image and the buttons which will be greyed out
    switch state
        case 1
            % process model have to be picked
            buttonList = {'pushbutton_ChooseProcessModel'};
            text_string = 'Choose Process Model';
        case 2
            % fault configuration have to be picked
            buttonList = {'pushbutton_chooseFaultKonf','pushbutton_setfault'};
            text_string = 'Choose Fault Konfiguration';
        case 3
            % suggest solution have to be klicked
            buttonList = {'pushbutton_sugsol'};
            text_string = 'Press Suggest Solution';
        case 4
            % click on a emelemnt in the table
            buttonList = {'pushbutton_filteringDetector','pushbutton_filteringFilter','pushbutton_deleteDetector','pushbutton_deleteFilter'};
            text_string = 'Select Element from Table';
        case 5
            % design have to be clicked
            buttonList = {'pushbutton_desdet','pushbutton_desfil'};
            text_string = 'Design Detector or Filter';
        case 6
            buttonList = {'pushbutton_export_detector','pushbutton_export_filter'};
            text_string = 'Export Detector or Filter';
        otherwise
            buttonList = {};
            text_string = 'error';
    end
    % grey out the buttons with the specified buttons
    hideButtons = evalin('base','hideButtons');
    if hideButtons == 1
        greyOutButton([buttonList buttonListStatic], handles);    
    end
    
    % display the new state via text element
     set(handles.staticText_state,'string',text_string);
    
    %% Save the new state of the machine to the workspace
    assignin('base','state_machine',state);
end
