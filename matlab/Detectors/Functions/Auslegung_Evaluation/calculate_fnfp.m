%% calculate_fnfp
% One possibility to asses sensor fault detectors is to determine the
% false-negatives-rate and false-positives-rates. The lower this values,
% the better is the detector. This function determines this rates by
% comparing the output ('detection') made by the detector with the correct
% values ('trigger') which where saved from the faultinjection-framework.  
% Both rates are calculated by using the following equations: 
% $$ false-negatives = \frac{f_n}{r_p + f_n} $$ ;   $$ false-positives = \frac{f_p}{r_n + fp} $$
% 
%
% * $f_n$: Number of false-negatives detections.
% * $f_p$: Nnumber of false-positives detections.
% * $t_n$: Number of right-negatives detections.
% * $t_p$: Number of right-positives detections.
%

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
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
% Determining the values.

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
% Convert fn/fp to rates.
if(tp+fn > 0)
    fn = fn/(tp+fn);
else
    fn = 0;
end

if(tn+fp >0)
    fp = fp/(tn+fp);
else
    fp = 0;
end

end

