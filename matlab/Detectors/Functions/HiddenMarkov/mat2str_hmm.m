function str = mat2str( data )
%MAT2STR Summary of this function goes here
%   Detailed explanation goes here

%construct matrix-string
str = '[';
st = size(data);
for i = 1:st(1,1)
    for j = 1:st(1,2)
        if(i==1 & j==1)
            str = [str num2str(data(i,j))];
        else
            if(i > 1 & j == 1)
                str = [str ';' num2str(data(i,j))];
            else
                str = [str ',' num2str(data(i,j))];
            end
        end        
    end
end

str = [str ']'];
end

