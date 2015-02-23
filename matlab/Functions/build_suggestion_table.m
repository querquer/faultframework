function [LookupTable] = build_suggestion_table()

LookupTable = [];
failure = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
i = 0;

while(failure(1)==0 || failure(2)==0 || failure(3)==0 || failure(4)==0 || failure(5)==0 || failure(6)==0 || failure(7)==0 || failure(8)==0 || failure(9)==0 || failure(10)==0 || failure(11)==0 || failure(12)==0 || failure(13)==0)
    i = i+1;
    failure = de2bi(i,13);
    LookupTable(i,1).failure_build = failure;
    
    LookupTable(i,2).filter = {'Median_Filter', 'DiscreteFIR_Filter', 'Discrete_Filter', 'None'};
    LookupTable(i,3).filter = {'Median_Filter', 'DiscreteFIR_Filter', 'Discrete_Filter', 'None'};
    LookupTable(i,4).filter = {'Median_Filter', 'DiscreteFIR_Filter', 'Discrete_Filter', 'None'};

    LookupTable(i,2).detector = {'LimitChecking_Average', 'LimitChecking_Gradient', 'LimitChecking_RunningMean', 'NN_Detector', 'TDNN_Outlier', 'TDNN_StuckAt', 'None'};
    LookupTable(i,3).detector = {'LimitChecking_Average', 'LimitChecking_Gradient', 'LimitChecking_RunningMean', 'NN_Detector', 'TDNN_Outlier', 'TDNN_StuckAt', 'None'};
    LookupTable(i,4).detector = {'LimitChecking_Average', 'LimitChecking_Gradient', 'LimitChecking_RunningMean', 'NN_Detector', 'TDNN_Outlier', 'TDNN_StuckAt', 'None'};

end

save('Functions/lookuptable.mat', 'LookupTable'); 

end

