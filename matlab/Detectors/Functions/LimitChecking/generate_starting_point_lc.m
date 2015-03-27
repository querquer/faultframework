%% Example implementation of 'generate_starting_point*.m'

%% generate_starting_point_lc
% This function returns a starting point for a optimization-algorithm. Hence, 
% all parameters describing the detector based on 'Limit Checking' has 
% to be defined here. 

function [x0, IntCon, LB, UB, ConstraintFunction] = generate_starting_point_lc()
% Parameters of a sensorfaultdetection based on limit checking.

% Threshold
x0(1) = rand * 10;

% Function
x0(2) = rand * 3;

% Window size if needed
x0(3) = rand * 5;

%% Integer values
% The used function for feature extraction and the window size are integer
% values. Here we can define, that the optimization will only produce
% integer values for the second and third parameter in 'x0'.

IntCon = [2,3];

%% Lower bounds
% Sometimes parameters are only allowed to vary inside a specific range.
% Ths lower bound of this range can be defined here. The threshold is not
% limited to any values, therefore we assign a '-Inf' to its lower bound.
% As we only provide some function to chose from, the parameter 'Function'
% should not be lower then 1, likewise the window size.
LB = [-30, 1, 1];

%% Upper bounds
% In order to specifie the upper bounds of each parameter, we can define
% the array 'UB' like we did before. The threshold should not be limited to
% any value, therefore we assign a 'Inf'. The function parameter is limited
% up to 3 and the window size should not be greater then 100.
UB = [30, 3, 100 ];

%% Nonlinear constraints
% We do not have any nonlinear constraints here. For an example on this,
% please see function 'generate_starting_point_nn'.
ConstraintFunction = [];
end

