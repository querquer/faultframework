%% Display-Function for debugging
% This function extends the original Matlab function 'disp' by adding a
% string which contains the current date and time.

function output_args = disp_dbg(str)
% Get current date and tim
c = clock;
c = fix(c);

% Build up string
str = ['[' date '_' num2str(c(1,4)) '_' num2str(c(1,5)) '_' num2str(c(1,6)) ']' char(str)];

% Display
disp(str);

end

