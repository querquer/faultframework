%% Discrete FIR Filter
% This function tryes to find the best configuration for the Discrete FIR Filter.
% Therefore an genetic algorithm is used.

%% Return Values
% * *config*:       the configuration values.
% * *quality*:      delivers a quality indication. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>
% * *dist*:         delivers a indication how much differ the faultfree and the filtered
%                   data. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>

%% Source Code

function [config_string, quality, dist] = discretefir_filter()

    function fitness = discreteFIR_fitness(x)

        new_param_string = sprintf('[%.1f %.1f]', x(1), x(2));
        
        load_system('Filter/DiscreteFIR_Filter.slx');
        set_param('DiscreteFIR_Filter/Discrete FIR Filter/', 'Coefficients', new_param_string);
        close_system('Filter/DiscreteFIR_Filter.slx',1);
        
        disp(x);
        
        % evaluate with this configuration
        [quality_value, dist_value] = filter_evaluation;
        fitness = quality_value + dist_value;
    end

% define the options for the genetic algorithm
options = gaoptimset('TolFun', 0.005);
options = gaoptimset(options,'StallGenLimit', 5);
options = gaoptimset(options,'Display', 'iter');
options = gaoptimset(options,'UseParallel', false);
options = gaoptimset(options,'PopulationSize',30);
options = gaoptimset(options,'Generations',40);

% run the genetic algorithm
config = ga(@discreteFIR_fitness,2,[],[],[],[],[0,0],[1,1],[],options);

% set the best configuration
config_string = sprintf('[%.1f %.1f]', config(1), config(2));

load_system('Filter/DiscreteFIR_Filter.slx');
set_param('DiscreteFIR_Filter/Discrete FIR Filter/', 'Coefficients', config_string);
close_system('Filter/DiscreteFIR_Filter.slx',1);

[quality, dist] = filter_evaluation;

end

