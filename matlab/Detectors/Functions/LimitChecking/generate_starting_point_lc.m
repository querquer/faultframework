function x0 = generate_starting_point_lc(num_faults)
%GENERATE_STARTING_POINT_LC This function returns a starting point for a
%optimisation-algorithm. 
%   The automated designing of a sensorfaultdetector is done by applying a
%   optimisation-algorithm. This needs a starting-point. 


%Parameters of a sensorfaultdetection based on limit checking.

%threshold
x0(1) = rand * 10;

x0(2) = rand * 3;

%window size if needed
x0(3) = rand * 5;
%extend for all fault types
x = x0;
for i = 1:13
    x = [x, x0];
end

x0 = x;
end

