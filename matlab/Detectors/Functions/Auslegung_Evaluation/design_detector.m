function [x, fval, exitflag] = design_detector(data, trigger, detector, max_delay)
%DESIGN_DETECTOR Designs a specific detector by minimizing the
%false-negatives and false-positives.

%   Detailed explanation goes here

%generate starting point for optimisation. This function must be
%implemented by the detector itself.
x = generate_starting_point();
cnt = 1;
    function FNFP = opt_fun(x)
            %get detection results for test data. This function must be
            %implemented by the detector itself.
            
            det = detection(x,data, trigger);
            st = size(trigger);
            [FN, FP] = evaluate_FNFP(trigger(1,round(x(3)) + 1:st(1,2)), det, max_delay);
            FNFP = (FN + FP)/2; 
            
            disp([num2str(cnt) '. Iteration: FVal: ' num2str(FNFP) ' x: ' num2str(x)]);
            cnt = cnt + 1;
    end

%format of x: e.g.: x = [-1.2, 1]
[x,fval,exitflag] = fminsearch(@opt_fun,x, optimset('TolFun',0.01));


%create detector as Simulink-Model. This function must be implemented by
%the detector itself.
%create_detector(x);


end

