%% Set_ga_options_hmm
% This function sets some options of the used genetic algorithm in order to
% reduce the computation time.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
function options = set_ga_options_hmm(options)
%SET_GA_OPTIONS_HMM Summary of this function goes here
%   Detailed explanation goes here
options = gaoptimset(options,'TolFun', 0.05);
options = gaoptimset(options,'PopulationSize', 5);
options = gaoptimset(options,'StallGenLimit', 10);

end

