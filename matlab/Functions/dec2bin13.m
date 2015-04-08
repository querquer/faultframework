function bin = dec2bin13(dec_nr)
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

    sb = size(bin);
    if(sb(1,2) < 13)
        bin = [zeros(1,13-sb(1,2)), bin];
    end
    
    bin = fliplr(bin);
end

