%% DESIGN_DETECTOR 
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
% Using a genetic algorithm to design a sensor fault detector can have
% disadvantages concerning the computation time. Depending on the
% implementation of 'output_detector', which is called for every evaluation
% made by the genetic algorithm, the computation time can increase.
% Therefore it can be beneficial to set parameters of the genetic algorithm
% based on the knowledge about the current type of detector. Hence, an
% optional function 'set_ga_options' can be implemented which is called
% right before starting the genetic algorithm.

%% Implementation

function [x_list, fval, exitflag, FN_final, FP_final] = design_detector(data, trigger, sampletime, grad_thr, path_and_name, path_detector, evaluation_model)

%% TODO 
% Implement checking of all input-values in order to be correct formated.

%get function handles
[fun_starting_point,fun_config_dependend_output, fun_create, fun_ga_options] = find_functions(path_detector);

%%
% try to open a parallelisation pool in order to enable possible
% sub-routines to make use of it.
use_parallel = true;

try
    if(use_parallel)
        pool = parpool();
    end
catch err
end

%%
% Definition of fitness-function
    function FNFP = opt_fun(x)
          
            % get detection results for test data. This function must be
            % implemented by the detector itself.
            % det has to match to the format of 'trigger'
            det = feval(fun_config_dependend_output, x ,data(i), trigger(i));
            % calculate false-positve and false-negative rate
            [FN, FP] = evaluate_FNFP(trigger(i).data, det.data);
            
            % determine one value measuring the performance of the system in
            % order to avoid multi-objectiv optimisation. Possible
            % future-work: use multi-objectiv optimisation here!
            
            % Another possibility would be to use F-Score here.
            FNFP = (FN+FP)/2;
    end

sd = size(data);
%%
% generate starting point for optimisation. This function must be
% implemented by the detector itself.
for i = 1:sd(1,2)
    
    disp_dbg(['Start designing detector for fault type ' data(i).name ]);
    [x, IntCon, LB, UB, ConstraintFunction] = feval(fun_starting_point);
  

    %%
    % configure genetic algorithm
    sx = size(x);
    options = gaoptimset('TolFun', grad_thr);
    options = gaoptimset(options,'Display', 'iter');
    options = gaoptimset(options,'UseParallel', use_parallel);

    if(sx(1,2) <= 5)
        options = gaoptimset(options,'PopulationSize',25);
    else
        options = gaoptimset(options,'PopulationSize',50);
    end

    % check whether there are detector specific setting for ga-options
    if(isempty(fun_ga_options) == 0)
        options = feval(fun_ga_options, options);
    end

    %%
    % Start optimization with respect to defined options.

    [x,fval,exitflag] = ga(@opt_fun,sx(1,2),[],[],[],[],LB,UB,ConstraintFunction,IntCon,options);
    x_list{i} = x;
end

%%
% create detector as Simulink-Model. This function must be implemented by
% the detector itself.
curr_dir = pwd;
cd(path_detector);
feval(fun_create, x_list, data, trigger, path_and_name);
cd(curr_dir);

%%
% use Evaluation.slx to get final fn/fp-rates.
[path, name] = extract_path(path_and_name);
addpath(path);

out = run_evaluation_model(data, sampletime, name, evaluation_model);
[FN_final, FP_final] = evaluation(trigger, out);
 
end

