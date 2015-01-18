function [x, fval, exitflag, FN_final, FP_final] = design_detector(data, trigger, sampletime, max_delay, grad_thr, path_and_name, path_detector, evaluation_model)
%DESIGN_DETECTOR Designs a specific detector by minimizing the
%false-negatives and false-positives.

%   Detailed explanation goes here


%get function handles
[fun_starting_point,fun_config_dependend_output, fun_create] = find_functions(path_detector);

%generate starting point for optimisation. This function must be
%implemented by the detector itself.
x = feval(fun_starting_point);

%try to open a parallelisation pool in order to enable possible
%sub-routines to make use of it.
try
    pool = parpool();
catch err
end

    function FNFP = opt_fun(x)
            %get detection results for test data. This function must be
            %implemented by the detector itself.
            %det has to match to the format of 'trigger'
            det = feval(fun_config_dependend_output, x,data, trigger);
            %calculate false-positve and false-negative rate
            [FN, FP] = evaluation(trigger, det, max_delay);
            
            %determine one value measuring the performance of the system in
            %order to avoid multi-objectiv optimisation. Possible
            %future-work: use multi-objectiv optimisation here!
            sf = size(FN);
            sum = 0;
            for i = 1:sf(1,2);
                sum = sum + (FN(i).fn_rate + FP(i).fp_rate)/2;
                disp(['FN :' num2str(FN(i).fn_rate)]);
                disp(['FP :' num2str(FP(i).fp_rate)]);
            end
            
            FNFP = sum/sf(1,2);
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
curr_dir = pwd;
cd(path_detector);
feval(fun_create, x, data, trigger, max_delay, path_and_name);
cd(curr_dir);


%use Evaluation.slx to get final fn/fp-rates.
out = run_evaluation_model(data, sampletime, path_and_name, evaluation_model);
[FN_final, FP_final] = evaluation(trigger, out, max_delay);
 
end

