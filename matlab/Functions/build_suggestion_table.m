function [LookupTable] = build_suggestion_table()
%BUILD_SUGGESTION_TABLE make a new LookupTable. Executing this function can
%take several hours!(spaeter mal ;)
%   Return value
%   LookupTable:    matrix of structures. The column gives the dynamic. The
%   line gives the enabled failures. Every field contains a struct with an
%   filter array and an detector array. it is an sorted list, were the
%   first should be the best and the last the worst.

LookupTable = [];
failure = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
i = 0;

%   build the table until every error is enabled
while(failure(1)==0 || failure(2)==0 || failure(3)==0 || failure(4)==0 || failure(5)==0 || failure(6)==0 || failure(7)==0 || failure(8)==0 || failure(9)==0 || failure(10)==0 || failure(11)==0 || failure(12)==0 || failure(13)==0)
    i = i+1;
    failure = de2bi(i,13);                      % make an binary row vector wich specify the enabled failures
    LookupTable(i,1).failure_build = failure;
    LookupTable(i,2).failure_build = failure;
    LookupTable(i,3).failure_build = failure;
    
    LookupTable(i,1).filter = {'Median_Filter', 'DiscreteFIR_Filter', 'Discrete_Filter', 'None'};
    LookupTable(i,2).filter = {'Median_Filter', 'DiscreteFIR_Filter', 'Discrete_Filter', 'None'};
    LookupTable(i,3).filter = {'Median_Filter', 'DiscreteFIR_Filter', 'Discrete_Filter', 'None'};

    LookupTable(i,1).detector = {'LimitChecking_Average', 'LimitChecking_Gradient', 'LimitChecking_RunningMean', 'NN_Detector', 'TDNN_Outlier', 'TDNN_StuckAt', 'None'};
    LookupTable(i,2).detector = {'LimitChecking_Average', 'LimitChecking_Gradient', 'LimitChecking_RunningMean', 'NN_Detector', 'TDNN_Outlier', 'TDNN_StuckAt', 'None'};
    LookupTable(i,3).detector = {'LimitChecking_Average', 'LimitChecking_Gradient', 'LimitChecking_RunningMean', 'NN_Detector', 'TDNN_Outlier', 'TDNN_StuckAt', 'None'};

end
%   save the table
save('Functions/lookuptable.mat', 'LookupTable');

end
