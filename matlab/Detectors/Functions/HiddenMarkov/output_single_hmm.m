function det = output_single_hmm(x,data,trigger)
%OUTPUT_SINGLE_HMM Summary of this function goes here
%   Detailed explanation goes here

%estimate hmm
%partitioning data

%number of parts has to be greater then zero
if(x(1) >=1)
    nth = x(1);
else
    nth = 1;
end
%param a
a = x(2) * double(x(2) > 0);
%param b
b = x(3) * double(x(3) > 0);

sd = size(data);
seq = ones(1,sd(1,2));

for i=1:nth-1
    min_data = min(data);
    max_data = max(data);
    th = get_thresholds(i/nth,a,b, min_data, max_data);
    seq = seq + double(data >= th);
end

%seq are all symbols emitted by hmm
trigger = trigger + 1;
[trans_est, emis_est] = hmmestimate(seq,trigger);

det = hmmviterbi(seq,trans_est,emis_est);
det = det -1;
end

