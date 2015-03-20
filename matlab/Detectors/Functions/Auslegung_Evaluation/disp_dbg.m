function output_args = disp_dbg(str)
%DISP_DBG Summary of this function goes here
%   Detailed explanation goes here
c = clock;
c = fix(c);
str = ['[' date '_' num2str(c(1,4)) '_' num2str(c(1,5)) '_' num2str(c(1,6)) ']' char(str)];
disp(str);

end

