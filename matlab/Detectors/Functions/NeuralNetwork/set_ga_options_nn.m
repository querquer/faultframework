%% Set_ga_options_nn
% This function set some specific parameters of the applied genetic
% algorithm in order to reduce computation time.

%% Related Functions
%%
% There are no sub-functions implemented by ourself.

%% Source Code
function options = set_ga_options_nn(options)
%SET_GA_OPTIONS_HMM Summary of this function goes here
%   Detailed explanation goes here
options = gaoptimset(options,'TolFun', 0.05);
options = gaoptimset(options,'PopulationSize', 50);
options = gaoptimset(options,'StallGenLimit', 10);

end

