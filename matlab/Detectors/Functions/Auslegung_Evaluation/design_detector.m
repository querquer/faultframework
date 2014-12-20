function [x, fval, exitflag, fn, fp] = design_detector(data, trigger, detector, max_delay, grad_thr)
%DESIGN_DETECTOR Designs a specific detector by minimizing the
%false-negatives and false-positives.

%   Detailed explanation goes here

%generate starting point for optimisation. This function must be
%implemented by the detector itself.
x = generate_starting_point();

%try to open a parallelisation pool in order to enable possible
%sub-routines to make use of it.
try
    pool = parpool();
catch err
end

%cnt = 1;
    function FNFP = opt_fun(x)
            %get detection results for test data. This function must be
            %implemented by the detector itself.
            
            det = detection(x,data, trigger);
            st = size(trigger);
            [FN, FP] = evaluate_FNFP(trigger(1,round(x(3)) + 1:st(1,2)), det, max_delay);
            FNFP = (FN + FP)/2; 
            
            %disp([num2str(cnt) '. Iteration: FVal: ' num2str(FNFP) ' x: ' num2str(x)]);
            %cnt = cnt + 1;
    end

    %function to check whether the gradient of function-values is low or
    %not. If it is low, we will stop optimisation.
    last_fval = -1;
    function stop = terminate(x,optimvalues,state)
        stop = false;
        %Check if we are at the end of an iteration
        if(isequal(state,'iter'))
            if(last_fval > -1)
                %calculate gradient
                grad = optimvalues.fval - last_fval;
                disp(grad);
                %stop if gradient is low
                if(abs(grad) <= grad_thr)
                    stop = true;
                end
            else
                last_fval = optimvalues.fval;
            end
        end
    end


%format of x: e.g.: x = [-1.2, 1]. Go to 'generate_starting_point.m' for
%detail information on a specific detector.
options = optimset('OutputFcn', @terminate);
[x,fval,exitflag] = fminsearch(@opt_fun,x, options);


%create detector as Simulink-Model. This function must be implemented by
%the detector itself.
[file, fn, fp] = create_detector(x, data, trigger, max_delay);


end

