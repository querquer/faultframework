function [fn, fp] = create_detector_nn( x, data, trigger, max_delay, path_and_name )
%CREATE_DETECTOR creates simulink-model based on parameters in 'x'
%   Detailed explanation goes here

%Train NN with specific parameters several times and use the best one.
net = design_nn(x);

[net, fn, fp] = train_nn(net, data, trigger, x(3), x(4), max_delay);

%build simulink Model
src = gensim(net, -1);

tmp = 'nn_template';
load_system([tmp '.slx']);

%copy nn from 'untitled' to tmp
h = add_block([src '/' net.name], [tmp '/' net.name]);

%connect lines
%get handles of ports
ports_nn = get_param(h, 'PortHandles');
ports_trans = get_param([tmp '/Transpose'], 'PortHandles');
ports_sw = get_param([tmp '/Switch'], 'PortHandles');

%connect
add_line(tmp, ports_trans.Outport(1), ports_nn.Inport(1));
add_line(tmp, ports_nn.Outport(1), ports_sw.Inport(2));

%change windowsize
%get current config
conf = get_param([tmp '/Delay Line'], 'MaskValues');
conf{1} = num2str(x(3));
set_param([tmp '/Delay Line'], 'MaskValues', conf);

%save model
save_system(tmp, path_and_name);
close_system(tmp, false);
close_system(src, false);
end

