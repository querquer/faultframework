%% dec2bin13 
% This function converts a decimal number into its binary representation
% with 13-digits.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code
function bin = dec2bin13(dec_nr)
   
    %%
    % This part of implementation was published here:
    % <http://www.matrixlab-examples.com/decimal-to-binary.html decimal-to-binary>
    
    i = 1;
    q = floor(dec_nr/2);
    r = rem(dec_nr, 2);
    bin(i) = r(i);
    
    while 2 <= q
        dec_nr = q;
        i = i + 1;
        q = floor(dec_nr/2);
        r = rem(dec_nr, 2);
        bin(i) = r;
    end
    
    bin(i + 1) = q;
    bin = fliplr(bin);

    %%
    % As we want to have exactly 13 digits, we have to add missing zeros
    sb = size(bin);
    if(sb(1,2) < 13)
        bin = [zeros(1,13-sb(1,2)), bin];
    end
    
    %%
    % Now we have to change the order of digits, as the lowest is assumend
    % to be at the first column.
    bin = fliplr(bin);
end

