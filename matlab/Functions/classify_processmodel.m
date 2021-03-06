%% classify_processmodel
% This function produces a sample output of the specified process model in
% order to determine the class to which it belong. 


%% Related Functions

%%
% * <getModelData.html getModelData>
% * <mean_of_squared_gradient.html mean_of_squared_gradient>

%% Source Code
function class = classify_processmodel( path_and_name, StopTime )

% Generate sample output
data = getModelData(path_and_name, StopTime);

% Calculate a value to classify the model
mean = mean_of_squared_gradient(data);

% Determine correct class
% Low dynamic
if(mean <= 2.912689602196207e-06)
    class = 3;
end

% Middle dynamic
if((mean > 2.912689602196207e-06) && (mean < 6.882559712570934e-04))
    class = 2;
end

% High dynamic
if(mean >= 6.882559712570934e-04)
    class = 1;
end

end

