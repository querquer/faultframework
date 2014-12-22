function [fn, fp] = create_detector_nn( x, data, trigger, max_delay, path_and_name  )
%CREATE_DETECTOR_NN Creates a detector for all fault types represented in
%"data" and "trigger". The designed detector is saved at specified path
%"path_and_name".

%   Detailed explanation goes here

%determine path from "path_and_name"
tmp = 'current_detector_template';
if(exist(tmp, 'file'))
    delete(tmp);
end

copyfile('nn_detector_template.slx', [tmp '.slx']);


load_system([tmp '.slx']);

[path, name] = extract_path(path_and_name);
cd(path);

st = size(trigger);
for i = 1:st(1,2);
    %create a detector for every single fault type
    [fn, fp] = create_single_nn(x, data(i).data, trigger(i).trigger, max_delay, ['nn_' trigger(i).name '.slx']);
    
    %copy trained nn-block into final model of detector
    src = ['nn_' trigger(i).name];
    load_system([src '.slx']);
    
    
    
    h = add_block([src '/Subsystem'], [tmp '/' trigger(i).name]);

    %get current param of MinMax-Block
    num = str2num(get_param([tmp '/MinMax'], 'Inputs'));
    %add one input
    num = num + 1;
    set_param([tmp '/MinMax'], 'Inputs', num2str(num));
    
    %connect new block
    ports_in = get_param([tmp '/Signal'], 'PortHandles');
    ports_sub = get_param([tmp '/' trigger(i).name], 'PortHandles');
    ports_max = get_param([tmp '/MinMax'], 'PortHandles');
    
    %add lines
    add_line([tmp '/Subsystem'], ports_trans.Outport(1), ports_nn.Inport(1));
end

end

