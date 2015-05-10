%% Discrete FIR Filter
% This function tryes to find the best configuration for the Median Filter.
% Therefore an genetic algorithm is used.

%% Return Values
% * *config*:       the configuration values.
% * *quality*:      delivers a quality indication. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>
% * *dist*:         delivers a indication how much differ the faultfree and the filtered
%                   data. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>

%% Source Code

function [config, quality, dist] = discretefir_filter()

    function fitness = discreteFIR_fitness(x,y)

        new_param_string = sprintf('[%.1f %.1f]', x, y);
        
        load_system('Filter/DiscreteFIR_Filter.slx');
        set_param('DiscreteFIR_Filter/Discrete FIR Filter/', 'Coefficients', new_param_string);
        close_system('Filter/DiscreteFIR_Filter.slx',1);
    
        % evaluate with this configuration
        [fitness, ~] = filter_evaluation;
    end

% define the options for the genetic algorithm
options = gaoptimset('Display', 'iter');
options = gaoptimset(options,'UseParallel', false);
options = gaoptimset(options,'PopulationSize',30);
options = gaoptimset(options,'Generations',20);

% run the genetic algorithm
config = ga(@discreteFIR_fitness,2,[],[],[],[],0,1,[],options);

% set the best configuration
load_system('Filter/DiscreteFIR_Filter.slx');
set_param('DiscreteFIR_Filter/Discrete FIR Filter/', 'Coefficients', param_string);
close_system('Filter/DiscreteFIR_Filter.slx',1);

[quality, dist] = filter_evaluation;

end

