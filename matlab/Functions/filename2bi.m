%% filename2bi
% This function searches for a binary number between two '_' in the
% file-name given by 'str'. Then it transforms it to an binary number.

%% Related Functions

%%
% There are no sub-functions implemented by ourself.

%% Source Code

function bi = filename2bi( str )
%STR2BI Summary of this function goes here
%   Detailed explanation goes here

% find binary numer in string --> _*_
ind = strfind(str, '_');
str_num = str(ind(1,1)+1:ind(1,2)-1);
% insert ',' after every number to convert to binary
% afterwards
sstr = size(str_num);
for k=1:sstr(1,2)-1
    if(k==1)
        new_str = [str_num(k) ','];
    else
        new_str = [new_str str_num(k) ','];
    end
end
new_str = [new_str str_num(sstr(1,2))];
bi = str2num(new_str);

end

