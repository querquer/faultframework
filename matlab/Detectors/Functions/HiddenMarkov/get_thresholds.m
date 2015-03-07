function y = get_thresholds( x,a,b, min, max)
%GET_THRESHOLDS Summary of this function goes here
%   Detailed explanation goes here

%function
%mapping x into [-1,1]
x = -1 + 2 * x;
y = exp(-1*a*exp(-1*b*x));
%mapping y to [min,max]
y = min + (max-min)*y;

end

