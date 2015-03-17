function [x, fval, exitflag, FN_final, FP_final] = design_detector(data, trigger, sampletime, max_delay, grad_thr, path_and_name, path_detector, evaluation_model)
%DESIGN_DETECTOR Designs a specific detector by minimizing the false-negatives and false-positives.

%% Design_Detector
% This function represents the core of the automated configuration of a
% sensor fault detector. The algorithm is based on an optimization
% algorithm, namely a genetic algorithm. Using the function
% 'generate_starting_point', 'output_detector' and 'create_detector' allows
% the optimization algorithm to determine the best configuration 'x' of the
% specified type of sensor fault detectors. The function
% 'generate_starting_point' returns an initial configuration 'x'. Based on
% such a configuration, 'output_detector' produces a sample output, which
% is evaluated in terms of false-positives and false-negatives. Both values
% are used for assesing configurations. Due to the genetic algorithm and
% based on the implementation of the detector dependend functions
% ('generate_starting_point', 'output_detecotr', 'create_detector') the run
% time of this function can increase up to several hours.

%% Input Parameters
% * 'data': Array of structures with field 'name' specifying the fault type
% represented by this sample data and field 'data' which contains the
% sample data. Every entry represents a different fault type. 
% * 'trigger': Array of structures with field 'name specifying the fault
% type represented by this sample data and field 'trigger' which is another
% array consisting of zeros (sample data at the same index in 'data' is not
% faulty) and ones (sample data at the same index in 'data' is faulty).
% * 'sampletime': The resulting Simulink model representing the designed
% detector will have this Sample Time. 
% * 'max_delay': Defines the maximum delay of an detection result. If a
% failure occured at time t = 0, the detector will detect it at least at t
% = 'sampletime' * 'max_delay'. 'max_delay' has to be a natural number.
% * 'grad_thr': This value is a threshold for limiting the computation time
% of the optimization algorithm and is used to specify the
% 'function tolerance' of the genetic algorithm. For more information on
% this parameter see:
% <http://de.mathworks.com/help/gads/genetic-algorithm-options.html#f8335
% FunctionTolerance>
% * 'path_and_name': Defines the output path and name of the resulting
% sensor fault detector.
% * 'path_detector': Defines the path of the used detector. This path is
% used to search for the detector specific functions
% 'generate_starting_point', 'output_detector' and 'create_detector'.
% * 'evaluation_model': Defines the path and the name of the simulink model 
% used to evaluate the resulting detector in terms of false-negatives and false-positives. 

%% Optional Parameters
% Using a genetic algorithm to design a sensor fault detector can have a
% disadvantage concerning the computation time. Depending on the
% implementation of 'output_detector', which is called for every evaluation
% made by the genetic algorithm, the computation time can increase.
% Therefore it can be beneficial to set parameters of the genetic algorithm
% based on the knowledge about the current type of detector. Hence, an
% optional function 'set_ga_options' can be implemented which is called
% right before starting the genetic algorithm.

%get function handles
[fun_starting_point,fun_config_dependend_output, fun_create, fun_ga_options] = find_functions(path_detector);

%generate starting point for optimisation. This function must be
%implemented by the detector itself.
sd = size(data);
x = feval(fun_starting_point, sd(1,2));

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

            end
            
            FNFP = sum/sf(1,2);
    end

  


%configure genetic algorithm
sx = size(x);
options = gaoptimset('TolFun', grad_thr);
options = gaoptimset(options,'Display', 'iter');
options = gaoptimset(options,'UseParallel', true);

if(sx(1,2) <= 5)
    options = gaoptimset(options,'PopulationSize',25);
else
    options = gaoptimset(options,'PopulationSize',50);
end

%check whether there are detector specific setting for ga-options
if(isempty(fun_ga_options) == 0)
    options = feval(fun_ga_options, options);
end

    
[x,fval,exitflag] = ga(@opt_fun,sx(1,2),[],[],[],[],[],[],[],options);


%create detector as Simulink-Model. This function must be implemented by
%the detector itself.
curr_dir = pwd;
cd(path_detector);
feval(fun_create, x, data, trigger, max_delay, path_and_name);
cd(curr_dir);


%use Evaluation.slx to get final fn/fp-rates.
[path, name] = extract_path(path_and_name);
addpath(path);

out = run_evaluation_model(data, sampletime, name, evaluation_model);
[FN_final, FP_final] = evaluation(trigger, out, max_delay);
 
end

