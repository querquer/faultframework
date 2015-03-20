function [x0, IntCon, LB, UB, ConstraintFunction] = generate_starting_point_lc()
%GENERATE_STARTING_POINT_LC This function returns a starting point for a
%optimisation-algorithm. 
%   The automated designing of a sensorfaultdetector is done by applying a
%   optimisation-algorithm. This needs a starting-point. 


%Parameters of a sensorfaultdetection based on limit checking.

%threshold
x0(1) = rand * 10;

%function
x0(2) = rand * 3;

%window size if needed
x0(3) = rand * 5;

%% Integer values
% The used function for feature extraction and the window size are integer values
IntCon = [2,3];

%% Lower bounds
LB = [-Inf, 1, 1];

%% Upper bounds
UB = [Inf, 3, 100 ];

%% Nonlinear constraints
ConstraintFunction = [];
end

