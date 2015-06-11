function class = classify_processmodel_fourier( path_and_name, StopTime )

data = getModelData(path_and_name, StopTime);

%assignin('base', 'Y', data);

out = abs(fft(data));

%assignin('base', 'X', out);

maxis = findpeaks(out);
sMaxis = size(maxis);

%assignin('base', 'X_maxis_A', maxis);
i = 1;
while(i <= sMaxis(1,2))
   if(maxis(i) < 200)
       maxis(i) = [];
       sMaxis = size(maxis);
       i = i-1;
   end
   i = i+1;
end

%assignin('base', 'X_size', sMaxis(1,2));

if(sMaxis(1,2) <= 2)
    class = 1;
elseif(sMaxis(1,2) <= 4)
    class = 2;
else
    class = 3;
end

end