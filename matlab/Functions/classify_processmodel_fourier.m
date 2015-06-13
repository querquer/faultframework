%% Classify Processmodel with Fourier Analysis
% This function makes a fourier analysis of the given process model. The
% classification is calculated by the number of local maximas of the
% fourier analysis. If there are less than 2 maximas the dynamic is
% classified as low. For 2-4 maximas the dynamic is middel. If there are 
% more than 4 maximas the dynamic is high.

%% Return Value
% * *class*:    1 for a low dynamic of the given process model, 2 for
% middel and 3 for a high dynamic.

%% Source Code

function class = classify_processmodel_fourier( path_and_name, StopTime )

data = getModelData(path_and_name, StopTime);
out = abs(fft(data));

maxis = findpeaks(out);
sMaxis = size(maxis);

i = 1;
while(i <= sMaxis(1,2))
   if(maxis(i) < 200)
       maxis(i) = [];
       sMaxis = size(maxis);
       i = i-1;
   end
   i = i+1;
end

if(sMaxis(1,2) <= 2)
    class = 1;
elseif(sMaxis(1,2) <= 4)
    class = 2;
else
    class = 3;
end

end