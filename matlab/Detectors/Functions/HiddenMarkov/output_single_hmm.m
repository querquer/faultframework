function det = output_single_hmm(x,data,trigger)
%OUTPUT_SINGLE_HMM Summary of this function goes here
%   Detailed explanation goes here

%estimate hmm
%partitioning data

%number of parts has to be greater then zero
nth = round(x(1));

%window size
ws = round(x(2));

sd = size(data);
seq = ones(1,sd(1,2));

for i=1:nth-1
    min_data = min(data);
    max_data = max(data);
    th = min_data + (max_data-min_data)*(i/nth);
    seq = seq + double(data >= th);
end

%seq are all symbols emitted by hmm
trigger = trigger + 1;
[trans_est, emis_est] = hmmestimate(seq,trigger);

%determine detection output by assuming only a window of size x(2)
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

