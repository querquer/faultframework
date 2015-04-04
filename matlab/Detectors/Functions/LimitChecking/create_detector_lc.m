%% Create Detector
% This function builds up a Simulink-Model containing a sensor fault
% detector based on limit checking. The model is build concerning the given
% configuration 'x_list'. 

%% Related Functions

%%
% * <extract_path.html extract_path>
% * <create_single_lc.html create_single_lc>


%% Source Code
function  create_detector_lc(x_list, data, trigger, path_and_name )
%CREATE_DETECTOR_LC Summary of this function goes here
%   Detailed explanation goes here

tmp = ['current_detector_template' num2str(round(rand*1000))];
if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end
close_system(tmp, false);

copyfile('lc_detector_template.slx', [tmp '.slx']);


load_system([tmp '.slx']);


st = size(trigger);
for i = 1:st(1,2);
    %create a detector for every single fault type
    disp(trigger(i).name);
    src = ['lc_' trigger(i).name num2str(round(rand*1000))];
    create_single_lc(x_list{i}, [src '.slx']);

    %copy trained lc-block into final model of detector
    load_system([src '.slx']);
    
    h = add_block([src '/Subsystem'], [tmp '/' trigger(i).name]);

    %get current param of MinMax-Block
    num = str2double(get_param([tmp '/MinMax'], 'Inputs'));
    %add one input
    if(i > 1)
        num = num + 1;
    end
    set_param([tmp '/MinMax'], 'Inputs', num2str(num));
    
    %connect new block
    ports_sig = get_param([tmp '/Signal'], 'PortHandles');
    ports_sub = get_param([tmp '/' trigger(i).name], 'PortHandles');
    ports_max = get_param([tmp '/MinMax'], 'PortHandles');
    
    %add lines
    add_line(tmp, ports_sig.Outport(1), ports_sub.Inport(1));
    add_line(tmp, ports_sub.Outport(1), ports_max.Inport(num));
    
    %close src
    close_system(src, false);
    delete([src '.slx']);
    
end

%determine path from "path_and_name"
[path, name] = extract_path(path_and_name);
curr_dir = pwd;
cd(path);

s = size(name);
close_system(name(1:s(1,2)-4), false);
save_system(tmp, path_and_name);

close_system(tmp, false);

if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

cd(curr_dir);
end

