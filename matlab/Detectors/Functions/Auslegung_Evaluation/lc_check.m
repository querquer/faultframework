function det = lc_check( detection, threshold )
%LC_CHECK Summary of this function goes here
%   Detailed explanation goes here
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

