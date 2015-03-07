function options = set_ga_options_hmm(options)
%SET_GA_OPTIONS_HMM Summary of this function goes here
%   Detailed explanation goes here
options = gaoptimset(options,'TolFun', 0.005);
options = gaoptimset(options,'PopulationSize', 500);
options = gaoptimset(options,'StallGenLimit', 100);

end

