%% calculate_fnfp
% One possibility to asses sensor fault detectors is to determine the
% false-negatives-rate and false-positives-rates. The lower this values,
% the better is the detector. This function determines this rates by
% comparing the output ('detection') made by the detector with the correct
% values ('trigger') which where saved from the faultinjection-framework.  
% Both rates are calculated by using the following equations: 
% $$ false-negatives = \frac{f_n}{r_p + f_n} $$    $$ false-positives = \frac{f_p}{r_n + fp}$$
% 
%
% * $f_n$: number of false-negatives detections
% * $f_p$: number of false-positives detections
% * $t_n$: number of right-negatives detections
% * $t_p$: number of right-positives detections
%

function [fn, fp] = calculate_fnfp(trigger, detection)

%%
% By substraction the detection output from the trigger values. Now we have
% the following machtes:
%%
% * r(i) = -1 --> $f_p$
% * r(i) = 1 --> $f_n$
% * r(i) = 0 and detection(i) = 0 --> $t_n$
% * r(i) = 0 and detection(i) = 1 --> $t_p$
r = trigger - detection;

%%
% Determining the values

% Count true-negatives
a = r(r==0 & detection == 0);
sa = size(a);
tn = sa(1,2);

% Count true-positives
a = r(r==0 & trigger == 1);
sa = size(a);
tp = sa(1,2);

% Count false-positives
a = r(r==-1 & detection == 1);
fp = -1 * sum(a);

% Count false-negatives
a = r(r==1 & detection == 0);
fn =  sum(a);

%%
% convert fn/fp to rates
fn = fn/(tp+fn);
fp = fp/(tn+fp);

end

