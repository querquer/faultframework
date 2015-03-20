function [x0, IntCon, LB, UB, ConstraintFunction] = generate_starting_point_hm()
%GENERATE_STARTING_POINT Generates a first configuration of a Hidden Markov
%Model

%% Configuration 'x' of an Hidden Markov Model
% x will describe the partition of the range of sensor observations in order
% to get a discrete representation. Maybe there are areas which are more
% important then other ones. Therefore the genetic algorithm will adapt x to
% get the best partition.

% Number of thresholds
x0(1) = 25;

%Window size
x0(2) = 5;

%% Lower bounds
LB = [1, 1];

%% Upper bounds
UB = [500, 100];

%% Integer values
IntCon = [1,2];

%% Constraint function
ConstraintFunction = [];
end

