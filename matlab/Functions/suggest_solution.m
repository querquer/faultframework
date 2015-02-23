function [ detectors, filters ] = suggest_solution( dynamic, failures )
%dynamic muss 1,2 oder 3 sein (1 Hoche dynamic, 3 niedrige)
%failures muss ein row vector sein, der 1 und 0 enthält. der erste wert
%gibt an ob der erste fehlertyp vorkommt oder nicht.
LookupTable = load('Functions/lookuptable.mat');

line = bi2de(failures);
dynamic = dynamic+1;
detectors = LookupTable.LookupTable(line,dynamic).detector;
filters = LookupTable.LookupTable(line,dynamic).filter;

end

