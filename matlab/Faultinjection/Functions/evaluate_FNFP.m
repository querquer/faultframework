function [fp, fn] = evaluate_FNFP(trigger, detection, max_delay)
%EVALUATE Calculates false-positive-rate and false-negative-rate
%   Based on the detection results 'detection' and the trigger signal, we
%   can calculate the false-positives and false-negatives. As some
%   detection-methods may have a kind of delay, the user can specify the
%   maximum delay of an detection result.

%generate vector, where every 1 means: fault was injected, but not
%detected, every -1 means: fault was detected, but not injected
res = trigger - detection;

%get size of vector
st = size(res);
s1 = st(1,1);
s2 = st(1,2);

if(s1 > s2)
    ind = s1;
    res = transpose(res);
else
    ind = s2;
end

%go through vector in order to calculate fp/fn
ind_1 = 0;
pos_fn = 0;
fn = 0;
fp = 0;
for i=1:ind
    if(res(i) == -1)
        %decide whether it is a false-negative or a delayed detection
        if(ind_1 == 0)
            fp = fp + 1;
        else
            %check for max_delay
            delay = i - ind_1;
            if(max_delay < delay)
                fp = fp + 1;
            else
                %detected fault with an acceptable delay --> can not be a
                %false-negatives
                pos_fn = 0;
            end
        end
    end
    
    %faults were injected, but not detected immediatly
    if(res(i) == 1)
        ind_1 = i;
        pos_fn = 1;
    end
    
    %Check for false-negatives
    %pos_fn == 1 --> we injected a fault, but did not detected it until now
    if(res(i) == 0 && pos_fn == 1)
        %check if max_delay is exceeded
        delay = i - ind_1;
        if(delay > max_delay)
            %false-negative
            pos_fn = 0;
            fn = fn + 1;
        end
    end
end


%convert fn/fp to rates
fn = fn/ind;
fp = fp/ind;

end

