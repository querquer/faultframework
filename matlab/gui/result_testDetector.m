%% result_detector
% Creates a figure with a table which contains the given results from
% design detector


%% Source Code
function result_testDetector(det)

f = figure; 
%set(f, 'Units', 'normalized', 'Position', [0.2, 0.1, 0.7, 0.7]);
      
idy = 1;
for idx=1:length(det)
    idy_old = idy;
    
    mat{idy,1} = det(1,idx).name;       
    for idrate=1:length(det(1,idx).fn_rate)
        mat{idy,2} = det(1,idx).fn_rate(1,idrate).name;
        mat{idy,3} = det(1,idx).fn_rate(1,idrate).fn_rate;
        mat{idy,4} = det(1,idx).fp_rate(1,idrate).fp_rate;
        idy = idy +1;
    end
    mat{idy_old,5} = det(1,idx).row;
    mat{idy_old,6} = det(1,idx).column;
    
end

% Create the column and row names in cell arrays 
cnames = {'Name','Fault','FN-Rate','FP-Rate','Row','Column'};

% Create the uitable
t = uitable(f,'Data',mat,'ColumnName',cnames);    


        
tableextent = get(t,'Extent');
oldposition = get(t,'Position');
newposition = [oldposition(1) oldposition(2) tableextent(3) oldposition(4)];
set(t, 'Position', newposition);