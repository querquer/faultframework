function out = newton_polynom(x, data)
%NEWTON_POLYNOM Summary of this function goes here
%   Detailed explanation goes here

sd = size(data);

for i = 1: sd(1,2) - 2;
    y1 = x(2) + x(3)*(data(i)-x(14)) + x(4) * (data(i) - x(14))*(data(i) - x(15)) + x(5) * (data(i) - x(14))*(data(i) -x(15)) * (data(i) - x(16));
    y2 = x(6) + x(7)*(data(i+1)-x(17)) + x(8) * (data(i+1) - x(17))*(data(i+1) - x(18)) + x(9) * (data(i+1) - x(17))*(data(i+1) -x(18)) * (data(i+1) - x(19));
    y3 = x(10) + x(11)*(data(i+2)-x(20)) + x(12) * (data(i+2) - x(20))*(data(i+2) - x(21)) + x(13) * (data(i+2) - x(20))*(data(i+2) -x(21)) * (data(i+2) - x(22));

    out(i) = x(23)*y1 + x(24)*y2 + x(25)*y3;
end
end

