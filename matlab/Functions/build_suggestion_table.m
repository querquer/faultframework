%% LookupTable / build_suggestion_table
% 
%% LookupTable
% If you have to calculate, wich detector and filter is the best for your
% problem, it takes much time. Therefor the FaultFramework contain a
% lookuptable. 
%
% In this table the collums are the dynamic of the
% processmodel. The dynamic is low, middel or high. 
% 
% The lines are defined by the activ faults. In the Framework the activ
% faults are represented by an 1x13 row vector. This can also seen as an
% binary number. We can convert the line number to a binary number and so
% we get the activ faults for the line.
% 
% A cell contain a struct with:
% 
% * *failure_build*:    The 1x13 row vector witch represent the activated faults.
% * *filter*:           Contain an array of structs. One struct is an filter with a name, a quality value(quality) and the average distant(dist) between the filtered data and the unfiltered data.
% * *detector*:         Contain an array of structs. One struct is an detector with a name, a false-negativ-rate(fn_rate), false-positiv-rate(fp_rate) and the path, where the detector is to find.
%
% the initial lookuptable is build by the function build_suggestion_table.
% With the function add_filter respectiv add_detector you can add new
% content.
%

%% activated faults
% We often use in this project a binary representation of the activated
% faults. It is sometimes a 1x13 row vector, a timeseries with 13 datasets,
% integrated in a filename or similar. But the coding is everytime the same. The
% first position is one if the "value correlated offset" is activated. Else
% it is zero. The second value stand for "time correlated offset" and so on. 
% Here is the complete list:
% 
% #     value correlated offset
% #     time correlated offset
% #     value correlated noise
% #     time correlated noise
% #     const offset
% #     const noise
% #     outlier
% #     spike
% #     stuck at zero
% #     stuck at X
% #     saturation
% #     const delay
% #     time correlated delay
% 

%% build_suggestion_table
% This function build the initial lookuptable. The table is filled up with
% dummy values.
% 

%% Related Functions
% * <dec2bin13.html dec2bin13>
%

%% Source Code

function [LookupTable] = build_suggestion_table()
%BUILD_SUGGESTION_TABLE make a new LookupTable.
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
    failure = dec2bin13(i);                      % make an binary row vector wich specify the enabled failures
    LookupTable(i,1).failure_build = failure;
    LookupTable(i,2).failure_build = failure;
    LookupTable(i,3).failure_build = failure;
    
    filter.name = 'donNotUseThisFilter';
    filter.quality = 99;
    filter.dist = 99;
    
    LookupTable(i,1).filter(1) = filter;
    LookupTable(i,2).filter(1) = filter;
    LookupTable(i,3).filter(1) = filter;

    % Default detector
    detector.name = 'None';
    detector.fn_rate.name = 'None';
    detector.fp_rate.name = 'None';
    detector.fn_rate.fn_rate = 1;
    detector.fp_rate.fp_rate = 1;
    detector.path = 'No_Path';

    LookupTable(i,1).detector(1) = detector;
    LookupTable(i,2).detector(1) = detector;
    LookupTable(i,3).detector(1) = detector;

end
%   save the table
save('Functions/lookuptable.mat', 'LookupTable');

end

