function des = gui_continue()

choice = questdlg('This action will probably take a long time. You want to continue?', ...
	'Sure?', ...
	'Continue','Back','Back');
% Handle response
switch choice
    case 'Continue'
        des = 1;
    case 'Back'
        des = 0;
end