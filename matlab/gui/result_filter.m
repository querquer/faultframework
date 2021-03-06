%% result_filter
% Creates a figure with a table which contains the given results from
% design filter


%% Source Code
function result_filter(config, quality, dist)

f = figure('Position',[440 500 461 146]);
      

mat{1,1} = config;
mat{1,2} = quality;
mat{1,3} = dist;
  
   


% Create the column and row names in cell arrays 
cnames = {'Config','Quality','Dist'};

% Create the uitable
t = uitable(f,'Data',mat,...
            'ColumnName',cnames);    
        
        
tableextent = get(t,'Extent');
oldposition = get(t,'Position');
newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)];
set(t, 'Position', newposition);