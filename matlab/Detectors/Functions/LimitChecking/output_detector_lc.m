%% Example implementation of 'output_detector*.m'
% This function is meant to compute the configuration dependend output of a
% detector for a given input 'data'. As some detectors are configured by
% learning from data, an additional input 'trigger' is provided which
% contains the classification results. Every faulty timestep in 'data'
% is marked by a '1' in 'trigger'. Furthermore, every faultfree timestep is
% marked by a '0'.

%% Related Functions

%%
% * <running_gradient.html running_gradient>
% * <running_mean.html running_mean>
% * <running_var.html running_var>
% * <lc_check.html lc_check>

%% Source Code

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

