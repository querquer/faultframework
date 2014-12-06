function [ output_args ] = Median( data, order )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_args = medfilt1(data, order);

end

