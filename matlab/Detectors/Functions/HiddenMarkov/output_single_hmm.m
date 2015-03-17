function det = output_single_hmm(x,data,trigger)
%OUTPUT_SINGLE_HMM Summary of this function goes here
%   Detailed explanation goes here

%estimate hmm
%partitioning data

%number of parts has to be greater then zero
if(x(1) >=2)
    nth = round(x(1));
else
    nth = 2;
end
%param a
a = x(2) * double(x(2) > 0);
%param b
b = x(3) * double(x(3) > 0);

%window size
ws = round(x(4));
if(ws < 1)
    ws = 1;
end

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
end

