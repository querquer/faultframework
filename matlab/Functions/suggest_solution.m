%% suggest_solution
% This function returns one array for the detecors and one for the
% filters. The information is taken from the <build_suggestion_table.html
% lookuptable>, based on the determined dynamic of the process model and the failures specified by the user.
% 
% * *Detectors* are sorted based on the false-positive rate at first. If two
% detectors have the same false-positive rate, they are ranked based on the
% false-negative rate. 
% 
% * *Filters* are sorted based on the quality at first. If two filters have
% the same quality, they are ranked based on the distance
%

%% Input Values
% * *dynamic*: 1, 2 or 3. 1 classifies the dynamic of the process model as high, while 3 encodes a 
% low dynamic. 
% * *failures*: must be an 1x13 Array (row vector). It is filld up with 1 or 0. 1
%   means that the failure type is enabled and 0 disabled. The order is the
%   same like in the fault-trigger-bus. a0 is failure(1), and a12 is
%   failure(13). If someday a new failure type is implemented, the array can be larger.
%% Related Functions
% * <bin2dec13.html bin2dec13>

%% Source Code
% 
function [ detectors, filters ] = suggest_solution( dynamic, failures )
%SUGGEST_SOLUTION Returns a list of filters and detectors you can use for
%your problem.

LookupTable = load('Functions/lookuptable.mat');            % load the lookupTable

line = bin2dec13(failures);                                 % returns a decimal number of the failures array to get the correct line
detectors = LookupTable.LookupTable(line,dynamic).detector; % get the detector list
filters = LookupTable.LookupTable(line,dynamic).filter;     % get the filter list

%% sort detectors
% Detectors are sorted based on the false-negative rate at first. If two
% detectors have the same false-negative rate, they are ranked based on the
% false-positive rate.
sd = size(detectors);

for i = 1:sd(1,2)
    if(i==1)
        sorted_detectors = detectors(i);
        % calculate overall fn/fp rate
        sfp = size(sorted_detectors.fp_rate);
        sumfp = 0;
        sumfn = 0;
        for k = 1:sfp(1,2)
            sumfp = sorted_detectors.fp_rate(k).fp_rate + sumfp;
            sumfn = sorted_detectors.fn_rate(k).fn_rate + sumfn;
        end
        
        sorted_detectors.fp_rate = sumfp/sfp(1,2);
        sorted_detectors.fn_rate = sumfn/sfp(1,2);
        
    else
        ssorted = size(sorted_detectors);
        for j = 1:ssorted(1,2)
           
            % Calculate overall fn/fp rate for detector(i);
            det_i = detectors(i);
            sfp = size(det_i.fp_rate);
            sumfp = 0;
            sumfn = 0;
            for k = 1:sfp(1,2)
                sumfp = det_i.fp_rate(k).fp_rate + sumfp;
                sumfn = det_i.fn_rate(k).fn_rate + sumfn;
            end
        
            det_i.fp_rate = sumfp/sfp(1,2);
            det_i.fn_rate = sumfn/sfp(1,2);
            
            % Compare false-positive rate
            if(sorted_detectors(j).fn_rate > det_i.fn_rate)
                part1 = sorted_detectors(1:j-1);
                part2 = sorted_detectors(j:ssorted(1,2));
                
                sorted_detectors = [part1, det_i, part2];
                break;
            else
                % Compare false-positive rate, if both are equal in
                % false-negative rates
                if(sorted_detectors(j).fn_rate == det_i.fn_rate)
                    if(sorted_detectors(j).fp_rate > det_i.fp_rate)
                        part1 = sorted_detectors(1:j-1);
                        part2 = sorted_detectors(j:ssorted(1,2));
                
                        sorted_detectors = [part1, det_i, part2];
                        break;
                    end
                end
            end
        end
    end
end

% Expand array of detectors for every fault type
ssorted = size(sorted_detectors);
for i=1:ssorted(1,2)
    sd = size(detectors);
    for j = 1:sd(1,2);
        % find matching detector
        if(strcmp(detectors(j).name,sorted_detectors(i).name) == 1)
            d = detectors(j);
            break;
        end
    end
    
    sized = size(d.fp_rate);
    for k=1:sized(1,2);
        if(i==1 && k==1)
            det.name = d.name;
            det.fp_rate = d.fp_rate(k);
            det.fn_rate = d.fn_rate(k);
            det.path = d.path;
        else
            new.name = d.name;
            new.fp_rate = d.fp_rate(k);
            new.fn_rate = d.fn_rate(k);
            new.path = d.path;
            det = [det new];
        end
    end
end

detectors = det;

%% sort filters
% Filters are sorted by the quality. If the quality of two filters is equal
% the decision is made by the average distance (dist). 
% The sorting algorithm is a bubblesort.

sf = size(filters);
for m = 1:sf(1,2)
    for n = 1:(sf(1,2)-1)
        if filters(n).quality > filters(n+1).quality
            % swap
            anna = filters(n);
            filters(n) = filters(n+1);
            filters(n+1) = anna;
        elseif filters(n).quality == filters(n+1).quality
            if filters(n).dist > filters(n+1).dist
                % swap
                anna = filters(n);
                filters(n) = filters(n+1);
                filters(n+1) = anna;
            end
        end
    end
end

end

