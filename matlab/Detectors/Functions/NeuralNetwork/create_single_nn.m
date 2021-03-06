%% Create_single_nn
% Creates a simulink-model containing a single neural network to detect one fault type. 
% The neural network is configured based on parameters in 'x'.

%% Related Functions

%%
% * <design_nn.html design_nn>
% * <train_nn.html train_nn>

%% Source Code
function [fn, fp] = create_single_nn( x, data, trigger, path_and_name )
%CREATE_DETECTOR creates simulink-model containing a single neural network to detect one fault type. 
%The neural network is configured based on parameters in 'x'
%   Detailed explanation goes here

%Train NN with specific parameters several times and use the best one.
net = design_nn(x);

[net, fn, fp] = train_nn(net, data, trigger, x(3), x(4));

%build simulink Model
src = gensim(net, -1);
file = 'nn_template.slx';
tmp = ['current_template' num2str(round(rand*1000))];

%copy template to generate a file to work on.
if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

copyfile(file, [tmp '.slx']);

load_system([tmp '.slx']);

%copy nn from 'untitled' to tmp
h = add_block([src '/' net.name], [tmp '/Subsystem/' net.name]);

%connect lines
%get handles of ports
ports_nn = get_param(h, 'PortHandles');
ports_trans = get_param([tmp '/Subsystem/Transpose'], 'PortHandles');
ports_sw = get_param([tmp '/Subsystem/Switch'], 'PortHandles');

%connect
add_line([tmp '/Subsystem'], ports_trans.Outport(1), ports_nn.Inport(1));
add_line([tmp '/Subsystem'], ports_nn.Outport(1), ports_sw.Inport(2));

%change windowsize
%get current config
conf = get_param([tmp '/Subsystem/Delay Line'], 'MaskValues');
wsize = round(x(3)) + 1;
conf{1} = num2str(wsize);
set_param([tmp '/Subsystem/Delay Line'], 'MaskValues', conf);

%save model
save_system(tmp, path_and_name);

close_system(tmp, false);
close_system(src, false);

if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end
end

