function [fn, fp] = evaluate_FNFP2(trigger, detection)
%EVALUATE_FNFP2 Summary of this function goes here
%   Detailed explanation goes here
r = trigger - detection;

a = r(r==0 & detection == 0);
sa = size(a);
tn = sa(1,2);

a = r(r==0 & trigger == 1);
sa = size(a);
tp = sa(1,2);

a = r(r==-1 & detection == 1);
fp = -1 * sum(a);

a = r(r==1 & detection == 0);
fn =  sum(a);

%%
% convert fn/fp to rates
fn = fn/(tp+fn);
fp = fp/(tn+fp);

end

