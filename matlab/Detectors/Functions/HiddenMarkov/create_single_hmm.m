%% Create_single_hmm
% This function creates a Simulink_Block containing a Hidden Markov Model.
% This model represents a sensor fault detector with parameters specified
% in 'x' which is able to detect a single fault type. It will be placed
% together with other Hidden Markov Models in order to create a detector
% able to detect multiple fault types.

%% Related Functions

%%
% * <calculate_fnfp.html calculate_fnfp>

%% Source Code
function [ fn, fp ] = create_single_hmm( x, data, trigger, path_and_name  )
%CREATE_SINGLE_HMM Summary of this function goes here
%   Detailed explanation goes here

%get configuration parameters from x
    nth = round(x(1));


%window size
ws = round(x(2));


sd = size(data);
seq = ones(1,sd(1,2));

    min_data = min(data);
    max_data = max(data);

for i=1:nth-1

    th = min_data + (max_data-min_data)*(i/nth);
    seq = seq + double(data >= th);
end

%seq are all symbols emitted by hmm
trigger = trigger + 1;
[trans_est, emis_est] = hmmestimate(seq,trigger);

%determine detection output by assuming only a window of size x(4)
for i=1:sd(1,2)-(ws-1)
    wseq = seq(:,i:(i+(ws-1)));
    sdet = hmmviterbi(wseq,trans_est,emis_est);
    
    if(i==1)
        det = sdet;
    else
        det = [det , sdet(:, ws)];
    end
end
det = det -1;


[fn, fp] = calculate_fnfp(trigger, det);


%build simulink Model
file = 'hm_template.slx';
tmp = ['current_template' num2str(round(rand*1000))];

%copy template to generate a file to work on.
if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

copyfile(file, [tmp '.slx']);

load_system([tmp '.slx']);

%change windowsize
%get current config
conf = get_param([tmp '/Detector_Single_Fault/Delay Line'], 'MaskValues');
conf{1} = num2str(ws);
set_param([tmp '/Detector_Single_Fault/Delay Line'], 'MaskValues', conf);

%set trans_est
%construct matrix-string
str =mat2str_hmm(trans_est);
set_param([tmp '/Detector_Single_Fault/trans_est'], 'Value', str);

%set emis_est
str =mat2str_hmm(emis_est);
set_param([tmp '/Detector_Single_Fault/emis_est'], 'Value', str);

%set min_data
set_param([tmp '/Detector_Single_Fault/min_data'], 'Value', num2str(min_data));

%set max_data
set_param([tmp '/Detector_Single_Fault/max_data'], 'Value', num2str(max_data));

%set num_th
set_param([tmp '/Detector_Single_Fault/num_th'], 'Value', num2str(nth));

%save model
save_system(tmp, path_and_name);

close_system(tmp, false);

if(exist([tmp '.slx'], 'file'))
    delete([tmp '.slx']);
end

end

