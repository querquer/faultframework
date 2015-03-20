function out = output_detector_lc( x, data, trigger )
%OUTPUT_DETECTOR_LC calculates the output of a detector based on limit
%checking with respect to configuration "x"

%get output for every fault type

    dt = data.data;
    windowsize = round(x(3));
    fun = round(x(2));
    thr = x(1);

    switch fun
        case 1
            sout = running_gradient(dt);
        case 2
            sout = running_mean(dt, windowsize);
        case 3
            sout = running_var(dt, windowsize);
    end
   
    det = lc_check(sout, thr);
    
    out.name = trigger.name;
    out.data = det;
   
end

