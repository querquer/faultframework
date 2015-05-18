%% DESIGN_DETECTOR 
% This function represents the core of the automated configuration of a
% sensor fault detector. The algorithm is based on an optimization
% algorithm, namely a genetic algorithm. Beside the optimization of a good 
% configuration, another challenge is to cope with various capabilites of 
% different detector types. Therefore the current implementation finds a single
% configuration for every fault type and constructs a separate detector for each of them.
% At the end, all detectors are placed into one simulink model, where the 
% maximum of their outputs is found. This is used as the detection result. 

%% Specifying a detector type
% The user will chose one type out of severals. In order to support as much 
% detector types as possible, one can extend it by implementing new detectors. 
% This can be done by simple specifying at least three functions: 
%% 
% * 'generate_starting_point*.m' (Examples:
% <generate_starting_point_lc.html generate_starting_point_lc> , <generate_starting_point_nn.html generate_starting_point_nn> , <generate_starting_point_hm.html generate_starting_point_hm>),
% * 'output_detector*.m' (Examples: <output_detector_lc.html output_detector_lc> , <output_detector_nn.html output_detector_nn> , <output_detector_hm.html output_detector_hm>) and 
% * 'create_detector*.m'(Examples: <create_detector_lc.html create_detector_lc> , <create_detector_nn.html create_detector_nn> , <create_detector_hm.html create_detector_hm> ). 
% * Optional: 'set_ga_options*.m'. (Examples <set_ga_options_lc.html set_ga_options_lc> , <set_ga_options_nn.html set_ga_options_nn> , <set_ga_options_hmm.html set_ga_options_hm>)

%%
% The star '*' is symbolic and is meant to add a concret name. Using this
% functions implemented by an expert allows
% the optimization algorithm to determine the best configuration 'x' of the
% specified type of sensor fault detectors. The function
% 'generate_starting_point' returns an initial configuration 'x'. Based on
% such a configuration, 'output_detector' produces a sample output, which
% is evaluated in terms of false-positives and false-negatives. Both values
% are used for assesing configurations. The function 'create_detector' is 
% used to generate a specific simulink model containing a configured detector 
% with respect to a given configuration 'x'. Due to the nature of genetic 
% algorithms and based on the implementation of the detector dependend functions
% ('generate_starting_point', 'output_detecotr', 'create_detector') the run
% time of this function can increase up to several hours. In order to
% enable the expert to take an effect on the genetic algorithm, the
% function 'set_ga_options*' can be implemented. There one can change
% options of the genetic algorithm.

%% Input Parameters
% * 'data_multifaule': Array of sensor observations where multiple fault types where injected.
% * 'data_singlefault': Array of structures with field 'name' specifying the fault type
% represented by this sample data and field 'data' which contains the
% sample data. Every entry represents a different fault type. 
% * 'trigger_multifault': Array of structures with field 'name specifying the fault
% type represented by this sample data and field 'trigger' which is another
% array consisting of zeros (sample data at the same index in 'data' is not
% faulty) and ones (sample data at the same index in 'data' is faulty). The
% trigger singlas are corresponding to the sensor observations in
% 'data_multifault'.
% * 'trigger_singlefault': The same structure as 'trigger_multifault', but
% containing data corresponding to the sensor observations in
% 'data_singlefault'.
% * 'sampletime': The resulting Simulink model representing the designed
% detector will have this Sample Time. 
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

%% Related Functions

%%
% * <find_functions.html find_functions>
% * <calculate_fnfp.html calculate_fnfp>
% * <generate_starting_point_lc.html fun_starting_point> (Example implementation of a generate_starting_point*.m-File)
% * <output_detector_lc.html fun_config_dependend_output> (Example
% implementation of a output_detector*.m-File)
% * <create_detector_lc.html fun_create> (Example implementation of a
% create_detector*.m-File)
% * <set_ga_options_lc.html fun_ga_options> (Example implementation of a
% set_ga_options*.m-File)
% * <extract_path.html extract_path>
% * <run_evaluation_model.html run_evaluation_model>
% * <evaluation.html evaluation>


%% Source Code

function [x_list, fval, exitflag, FN_final, FP_final] = design_detector(data_multifault, data_eval_multifault, data_singlefault, trigger_multifault, trigger_eval_multifault, trigger_singlefault, sampletime, grad_thr, path_and_name, path_detector, evaluation_model)

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
            det = feval(fun_config_dependend_output, x ,data_multifault(i), trigger_multifault(i));
            % calculate false-positve and false-negative rate
            [FN, FP] = calculate_fnfp(trigger_multifault(i).data, det.data);
            
            % determine one value measuring the performance of the system in
            % order to avoid multi-objectiv optimisation. Possible
            % future-work: use multi-objectiv optimisation here!
            
            % Another possibility would be to use F-Score here.
            FNFP = (FN+FP)/2;
    end

sd = size(data_multifault);
%%
% generate starting point for optimisation. This function must be
% implemented by the detector itself.
for i = 1:sd(1,2)
    
    disp_dbg(['Start designing detector for fault type ' data_multifault(i).name ]);
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
feval(fun_create, x_list, data_multifault, trigger_multifault, path_and_name);
cd(curr_dir);

%%
% use Evaluation.slx to get final fn/fp-rates.
[path, name] = extract_path(path_and_name);
addpath(path);

data = data_singlefault;
sd = size(data);
data(sd(1,2)+1).data = data_eval_multifault.data;
data(sd(1,2)+1).name = data_eval_multifault.name;

trigger = trigger_singlefault;
st = size(trigger);
trigger(st(1,2) + 1).data = trigger_eval_multifault.data;
trigger(st(1,2) + 1).name = trigger_eval_multifault.name;
out = run_evaluation_model(data, sampletime, name, evaluation_model);
[FN_final, FP_final] = evaluation(trigger, out);
 
sfn = size(FN_final);
for k=1:sfn(1,2)
    disp_dbg(FN_final(k).name);
    disp_dbg(['fn-rate: ' num2str(FN_final(k).fn_rate)]);
    disp_dbg(['fp-rate: ' num2str(FP_final(k).fp_rate)]);
end

end

