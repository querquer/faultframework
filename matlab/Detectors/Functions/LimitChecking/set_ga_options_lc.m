%% Example implementation of 'set_ga_options*.m'
% This function enables the user to specifie parameters of the underlying
% genetic algorithm. See also Matlab Documentation for all options on
% genetic algorithmes.


%% set_ga_options_lc
% As the computation time of the evaluation function of this type of
% detectors is not very high, we can increase the population size as well
% as the stall generation and the 'TolFun' value. By doing this, the
% genetic algorithm will evaluate solutions with a higher diverity on the
% one hand and will try to optimize good solutions for a longer time on the
% other hand.
function options = set_ga_options_lc(options)

options = gaoptimset(options,'TolFun', 0.005);
options = gaoptimset(options,'PopulationSize', 50);
options = gaoptimset(options,'StallGenLimit', 25);

end

