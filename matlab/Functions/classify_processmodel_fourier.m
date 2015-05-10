function class = classify_processmodel_fourier( path_and_name, StopTime )

data = getModelData(path_and_name, StopTime);

assignin('base', 'Y', data);

out = abs(fft(data));

assignin('base', 'X', out);

class = 1;


end

