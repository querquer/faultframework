%% Median Filter
% the median filter takes the last X values, sort them and return the value
% in the middel.
%
% This function tryes to find the best configuration for the Median Filter.
% Therefore an genetic algorithm is used.

%% Return Values
% * *config*:       is the number of the values are used.
% * *quality*:      delivers a quality indication. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>
% * *dist*:         delivers a indication how much differ the faultfree and the filtered
%                   data. Detailed explanation you can find here: <filter_evaluation.html filter_evaluation>

%% Source Code

function [config, quality, dist] = median_filter()

    % define the fitness function for the genetic algorithm
    function fitness = median_fitness(x)
        
        load_system('Filter/Median_Filter.slx');
        set_param('Median_Filter/Constant/', 'Value', num2str(x));
        close_system('Filter/Median_Filter.slx',1);
        
        [fitness, ~] = filter_evaluation;
    end

% define the options for the genetic algorithm
options = gaoptimset('TolFun', 0.005);
options = gaoptimset(options,'StallGenLimit', 5);
options = gaoptimset(options,'Display', 'iter');
options = gaoptimset(options,'UseParallel', false);
options = gaoptimset(options,'PopulationSize',15);
options = gaoptimset(options,'Generations',40);

% IntInput gives the index of the inputvalues of the fitness function, wich
% should be integer.
IntInput = [1];

% run the genetic algorithm
config = ga(@median_fitness,1,[],[],[],[],1,100,[],IntInput,options);

% set the best config and return the quality and distance
load_system('Filter/Median_Filter.slx');
set_param('Median_Filter/Constant/', 'Value', num2str(config));
close_system('Filter/Median_Filter.slx',1);

[quality, dist] = filter_evaluation;

end

