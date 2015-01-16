function x0 = generate_starting_point_lc()
%GENERATE_STARTING_POINT_LC This function returns a starting point for a
%optimisation-algorithm. 
%   The automated designing of a sensorfaultdetector is done by applying a
%   optimisation-algorithm. This needs a starting-point. 


%Parameters of a sensorfaultdetection based on limit checking.

%threshold
x0(1) = rand * 10;

%As we can not apply a feater extraction without knowledge about the
%data/the faults, we need to approximate the feature extraction by a
%universell function approximator --> newton interpolation with a
%polynomial
%of 3-th order. --> 7 parameters per dimension.

%maybe its sufficient to use a polynomial of second order
%a0 - a3 --> x0
x0(2) = rand;
x0(3) = rand;
x0(4) = rand;
x0(5) = 0;

%b0-b3
x0(6) = rand;
x0(7) = rand;
x0(8) = rand;
x0(9) = 0;

%c0-c3
x0(10) = rand;
x0(11) = rand;
x0(12) = rand;
x0(13) = 0;

%wa0-wa2
x0(14) = rand;
x0(15) = rand;
x0(16) = rand;

%wb0-wb2
x0(17) = rand;
x0(18) = rand;
x0(19) = rand;

%wc0-wc2
x0(20) = rand;
x0(21) = rand;
x0(22) = rand;


%k0-k2
x0(23) = rand;
x0(24) = rand;
x0(25) = rand;

%extend for all fault types
for i = 1:14
    x = [x, x0];
end

x0 = x;
end

