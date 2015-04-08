function [ dec_number ] = bin2dec13( bin_number )
%BIN2DEC Summary of this function goes here
%   Detailed explanation goes here
dec_number = 0;

for i=0:12
    if(bin_number(i+1) == 1)
        dec_number = dec_number+2^i;
    end
end

end