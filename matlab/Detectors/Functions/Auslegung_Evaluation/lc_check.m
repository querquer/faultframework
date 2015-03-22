%% lc_check
% This is a helper-function to check every value of 'detection' whether its greater or
%equal(1) to 'threshold' or smaller(0). Depending on this comparsion a new array
%consisting of zeros and ones is generated and returned.

function det = lc_check( detection, threshold )

sd = size(detection);
det = zeros(sd(1,1), sd(1,2));
for j=1:sd(1,1)
    for i=1:sd(1,2)
        if(detection(j,i) >= threshold)
            det(j,i) = 1;
        end
    end
end
end

