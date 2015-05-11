function  greyOutButton(buttonList, handles)

%get the list of all buttons in the handles struct
pushbuttonHandles = findobj('Style','pushbutton');

grey = [0.5 0.5 0.5];
black = [0 0 0];

if length(buttonList) == 0
    for idx=1:length(pushbuttonHandles)
        set(pushbuttonHandles(idx), 'ForeGroundColor', black);
    end
else
    %%iterate over all buttons in the gui
    for idx=1:length(pushbuttonHandles)
        % get the tag of the actual button
        buttonArray{idx} = get(pushbuttonHandles(idx), 'Tag');

    end
    
    for idx=1:length(pushbuttonHandles)
        % get the tag of the actual button
        buttonTag = get(pushbuttonHandles(idx), 'Tag');

        isIn = 0;

        %% Iterate over the buttonList and check if the actual button in the list
        for idy=1:length(buttonList)
            %if not(strcmp(buttonList{idy},buttonTag))
            if strcmp(buttonList{idy},buttonTag)
                isIn = 1;           
            end
        end

        %% if the button ist not in the buttonList, we grey him out
        if isIn == 0
            set(pushbuttonHandles(idx), 'ForeGroundColor', grey);
        else 
            set(pushbuttonHandles(idx), 'ForeGroundColor', black);
        end
    end
end
