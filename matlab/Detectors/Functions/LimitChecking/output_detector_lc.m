function out = output_detector_lc( x, data, trigger )
%OUTPUT_DETECTOR_LC calculates the output of a detector based on limit
%checking with respect to configuration "x"


%check input data 
sd = size(data);
st = size(trigger);
if(sd(1,2) ~= st(1,2))
    msgID = 'output_detector_lc:data format';
    msg = 'Number of samples in "data" does not match number of samples in "trigger"! Is the format of "data" or "trigger" wrong?';
    baseException = MException(msgID,msg);
    throw(baseException);
end

%get output for every fault type
for i = 1:sd(1,2)
    dt = data(i).data;
    windowsize = round(x((i-1)*3 + 3));
    if(windowsize <= 0)
        windowsize = 1;
    end
    
    fun = round(x((i-1)*3 + 2));
    if(fun <= 0)
        fun = 1;
    else
        if(fun > 3)
            fun = 3;
        end
    end
    
    switch fun
        case 1
            sout = running_gradient(dt);
        case 2
            sout = running_mean(dt, windowsize);
        case 3
            sout = running_var(dt, windowsize);
    end
   
    det = lc_check(sout, x((i-1)*3 + 1));
    
    out(i).name = trigger(i).name;
    out(i).data = det;
   
end


end

