function out = output_detector_hm( x, data, trigger )
%OUTPUT_DETECTOR_HM Summary of this function goes here
%   Detailed explanation goes here

sd = size(data);

for i=1:sd(1,2)
    out(i).name = data(i).name;
    out(i).data = output_single_hmm(x((i-1)*3+1:i*3),data(i).data,trigger(i).data);
end

end

