function state_machine(state, handles)


    
if(not(isempty(handles)))
    state_Tag = get(handles.state_pic, 'Tag');

    if(isunix())
        s0 = imread('gui/pic_state0.png');
        s1 = imread('gui/pic_state1.png');
        s2 = imread('gui/pic_state2.png');
        s3 = imread('gui/pic_state3.png');
        s4 = imread('gui/pic_state4.png');
    else
        s0 = imread('gui\pic_state0.png');
        s1 = imread('gui\pic_state1.png');
        s2 = imread('gui\pic_state2.png');
        s3 = imread('gui\pic_state3.png');
        s4 = imread('gui\pic_state4.png');
    end


    switch state
        case 1
            % process model have to be picked
            imshow(s1,'Parent',handles.state_pic)
            buttonList = {'pushbutton_ChooseProcessModel'};
        case 2
            % fault configuration have to be picked
            imshow(s2,'Parent',handles.state_pic)
            buttonList = {'pushbutton_chooseFaultKonf','pushbutton_setfault'};
        case 3
            % suggest solution have to be klicked
            imshow(s3,'Parent',handles.state_pic)
            buttonList = {'pushbutton_sugsol'};
        case 4
            % design have to be clicked
            imshow(s4,'Parent',handles.state_pic)
            buttonList = {'pushbutton_desdet','pushbutton_desfil','pushbutton_filteringDetector','pushbutton_deleteDetector','pushbutton_deleteFilter'};
        case 5
            buttonList = {'pushbutton_export_detector','pushbutton_export_filter'};
        otherwise
            buttonList = {};
            imshow(s0,'Parent',handles.state_pic)
    end
    greyOutButton(buttonList, handles);
    
    assignin('base','state_machine',state);
    set(handles.state_pic, 'Tag', state_Tag);
else
    %% if there are no handles, get guihandles
    handles = guihandles;
    state_Tag = get(handles.state_pic, 'Tag');

    if(isunix())
        s0 = imread('gui/pic_state0.png');
        s1 = imread('gui/pic_state1.png');
        s2 = imread('gui/pic_state2.png');
        s3 = imread('gui/pic_state3.png');
        s4 = imread('gui/pic_state4.png');
    else
        s0 = imread('gui\pic_state0.png');
        s1 = imread('gui\pic_state1.png');
        s2 = imread('gui\pic_state2.png');
        s3 = imread('gui\pic_state3.png');
        s4 = imread('gui\pic_state4.png');
    end

    switch state
        case 1
            % process model have to be picked
            imshow(s1,'Parent',handles.state_pic)
            buttonList = {'pushbutton_ChooseProcessModel'};
        case 2
            % fault configuration have to be picked
            imshow(s2,'Parent',handles.state_pic)
            buttonList = {'pushbutton_chooseFaultKonf','pushbutton_setfault'};
        case 3
            % suggest solution have to be klicked
            imshow(s3,'Parent',handles.state_pic)
            buttonList = {'pushbutton_sugsol'};
        case 4
            % design have to be clicked
            imshow(s4,'Parent',handles.state_pic)
            buttonList = {'pushbutton_desdet','pushbutton_desfil','pushbutton_filteringDetector','pushbutton_deleteDetector','pushbutton_deleteFilter'};
        case 5
            buttonList = {'pushbutton_export_detector','pushbutton_export_filter'};
        otherwise
            buttonList = {};
            imshow(s0,'Parent',handles.state_pic)
    end
    greyOutButton(buttonList, handles);
    
    assignin('base','state_machine',state);
    set(handles.state_pic, 'Tag', state_Tag);
end