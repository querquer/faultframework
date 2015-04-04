%% Output_detector_hm
% This function calculates the configuration-based output of a sensor fault detector based on a
% Hidden Markov Model.

%% Related Functions

%%
% * <output_single_hmm.html output_single_hmm>

%% Source Code
function out = output_detector_hm( x, data, trigger )
%OUTPUT_DETECTOR_HM Summary of this function goes here
%   Detailed explanation goes here

    out.name = data.name;
    out.data = output_single_hmm(x,data.data,trigger.data);

end

