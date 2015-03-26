function plotFaultyData()
%% Read the faults data and plot them
figure();
faulty_data = load('faulty_data_TEMP.mat');
plot(faulty_data(1).faulty_data);