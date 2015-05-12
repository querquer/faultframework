%% Discrete Filter
% This function tryes to find the best configuration for the Discrete Filter.
% Therefore an genetic algorithm is used.

%% Return Values
% * *config*:       the configuration values.
% * *quality*:      delivers a quality indication. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>
% * *dist*:         delivers a indication how much differ the faultfree and the filtered
%                   data. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>

%% Source Code

function [config_string, quality, dist] = discrete_filter()

    function fitness = discrete_fitness(x)

        new_param_string = sprintf('[%.1f %.1f]', x(1), x(2));
        
        load_system('Filter/Discrete_Filter.slx');
        set_param('Discrete_Filter/Discrete Filter/', 'Denominator', new_param_string);
        close_system('Filter/Discrete_Filter.slx',1);
    
        % evaluate with this configuration
        [fitness, ~] = filter_evaluation;
    end

% define the options for the genetic algorithm
options = gaoptimset('Display', 'iter');
options = gaoptimset(options,'UseParallel', false);
options = gaoptimset(options,'PopulationSize',30);
options = gaoptimset(options,'Generations',20);

% run the genetic algorithm
config = ga(@discrete_fitness,2,[],[],[],[],[0,0],[1,1],[],options);

% set the best configuration
config_string = sprintf('[%.1f %.1f]', config(1), config(2));

load_system('Filter/Discrete_Filter.slx');
set_param('Discrete_Filter/Discrete Filter/', 'Denominator', config_string);
close_system('Filter/Discrete_Filter.slx',1);

[quality, dist] = filter_evaluation;

end