function [FN, FP] = create_detector_nn( x, data, trigger,  path_and_name  )
%CREATE_DETECTOR_NN Creates a detector for all fault types represented in
%"data" and "trigger". The designed detector is saved at specified path
%"path_and_name".

%   Detailed explanation goes here


tmp = ['current_detector_template' num2str(round(rand*1000))];
if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

copyfile('nn_detector_template.slx', [tmp '.slx']);


load_system([tmp '.slx']);

st = size(trigger);
for i = 1:st(1,2);
    %create a detector for every single fault type
    disp(trigger(i).name);
    src = ['nn_' trigger(i).name num2str(round(rand*1000))];
    [fn, fp] = create_single_nn(x, data(i).data, trigger(i).data, [src '.slx']);
    FN(i).name = trigger(i).name;
    FN(i).fn_rate = fn;
    FP(i).name = trigger(i).name;
    FP(i).fp_rate = fp;
    %copy trained nn-block into final model of detector
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

save_system(tmp, name);

close_system(tmp, false);

if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

cd(curr_dir);
end

