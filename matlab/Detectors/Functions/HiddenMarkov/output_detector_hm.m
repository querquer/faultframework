function out = output_detector_hm( x, data, trigger )
%OUTPUT_DETECTOR_HM Summary of this function goes here
%   Detailed explanation goes here

    out.name = data.name;
    out.data = output_single_hmm(x,data.data,trigger.data);

end

