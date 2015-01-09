function [fun_starting_point, fun_output, fun_create] = find_functions(path)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%add path and all subpathes to search path of matlab
addpath(genpath(path));

%search for functions
file = rec_search(path, 'generate_starting_point*.m');
if(isempty(file))
    msgID = 'find_functions:generate_starting_point';
    msg = 'Could not find function "generate_starting_point*.m" of choosen detector!';
    baseException = MException(msgID,msg);
    throw(baseException);
else
    sf = size(file);
    fun_starting_point = str2func(file(1:sf(1,2)-2));
end

file = rec_search(path, 'output_detector*.m');
if(isempty(file))
    msgID = 'find_functions:output_detector';
    msg = 'Could not find function "output_detector*.m" of choosen detector!';
    baseException = MException(msgID,msg);
    throw(baseException);
else
    sf = size(file);
    fun_output = str2func(file(1:sf(1,2)-2));
end

file = rec_search(path, 'create_detector*.m');
if(isempty(file))
    msgID = 'find_functions:create_detector';
    msg = 'Could not find function "create_detector*.m" of choosen detector!';
    baseException = MException(msgID,msg);
    throw(baseException);
else
    sf = size(file);
    fun_create = str2func(file(1:sf(1,2)-2));
end
end

