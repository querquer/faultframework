function options = set_ga_options_hmm(options)
%SET_GA_OPTIONS_HMM Summary of this function goes here
%   Detailed explanation goes here
options = gaoptimset(options,'TolFun', 0.05);
options = gaoptimset(options,'PopulationSize', 5);
options = gaoptimset(options,'StallGenLimit', 10);

end

