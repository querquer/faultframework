function [ detectors, filters ] = suggest_solution( dynamic, failures )
%SUGGEST_SOLUTION gives a list of filters and detectors you can use for
%your problem.
%   Input values
%   dynamic:    1, 2 or 3. 1 is an high dynamic of the input model. 3 is a
%   low dynamic.
%   
%   failures:   must be an 1x13 Array (row vector). It is filld up with 1 or 0. 1
%   means that the failuretype is enabled and 0 disabled. The order is the
%   same like in the fault-trigger-bus. a0 is failures(1), and a12 is
%   failures(13). if sometime a new failuretyp is the array ccan be larger.

LookupTable = load('Functions/lookuptable.mat');            % laod the lookupTable

line = bi2de(failures);                                     % gives a decimal number of the failures array to get the correct line
detectors = LookupTable.LookupTable(line,dynamic).detector; % get the detector list
filters = LookupTable.LookupTable(line,dynamic).filter;     % get the filter list

% sort filters and detectors

% sort detectors
sd = size(detectors);
for i = 1:sd(1,2)
    
end

% sort filters
sf = size(filters);
for i = 1:sf(1,2)
    
end

end

