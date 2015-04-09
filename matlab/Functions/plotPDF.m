%% plotPDF
% Generate a new gui window and plot the given function in the given scope


%% Source Code
function plotPDF(pdf,max,min)

figure();
fun = strcat ('@(x) ',pdf);
fplot(str2num(fun),[str2double(min),str2double(max)]);