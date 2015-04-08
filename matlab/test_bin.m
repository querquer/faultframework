
disp('starting');
for i = 0:8191

    a = bin2dec13(dec2bin13(i));
    if(a ~= i)
        disp('Something went wrong!');
        disp(a);
        disp(i);
        break;
    end
end

disp('finished');