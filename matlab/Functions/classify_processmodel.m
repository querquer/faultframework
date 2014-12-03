function class = classify_processmodel( data )
%CLASSIFY_PROCESSMODEL classifies the process model based on sample data
%   

mean = mean_of_squared_gradient(data);

if(mean <= 2.902689602196207e-06)
    class = 0;
end

if((mean > 2.902689602196207e-06) && (mean < 4.780559712570934e-04))
    class = 1;
end

if(mean >= 4.780559712570934e-04)
    class = 2;
end

end

