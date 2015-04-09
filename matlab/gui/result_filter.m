%% result_filter
% Creates a figure with a table which contains the given results from
% design filter


%% Source Code
function result_filter(config, quality)

f = figure('Position',[440 500 461 146]);
      
for idx=1:length(fn)
    mat{idx,1} = fn(idx).name;
    mat{idx,2} = fn(idx).fn_rate;
    mat{idx,3} = fp(idx).fp_rate;
end       
   


% Create the column and row names in cell arrays 
cnames = {'Name','FP-Rate','FN-Rate'};

% Create the uitable
t = uitable(f,'Data',mat,...
            'ColumnName',cnames);    
        
        
tableextent = get(t,'Extent');
oldposition = get(t,'Position');
newposition = [oldposition(1) oldposition(2) tableextent(3) tableextent(4)];
set(t, 'Position', newposition);