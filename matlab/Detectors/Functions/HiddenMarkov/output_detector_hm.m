function out = output_detector_hm( x, data, trigger )
%OUTPUT_DETECTOR_HM Summary of this function goes here
%   Detailed explanation goes here

sd = size(data);
sx = size(x);
nx = sx(1,2)/sd(1,2);

for i=1:sd(1,2)
    out(i).name = data(i).name;
    out(i).data = output_single_hmm(x((i-1)*nx+1:i*nx),data(i).data,trigger(i).data);
end

end

