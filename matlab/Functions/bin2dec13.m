%% bin2dec13
% This function converts a 1x13 binary row vector to a decimal number

%% Source Code
function [ dec_number ] = bin2dec13( bin_number )
%BIN2DEC13 converts a binary row vector to a decimal number
dec_number = 0;

for i=0:12
    if(bin_number(i+1) == 1)
        dec_number = dec_number+2^i;
    end
end

end
