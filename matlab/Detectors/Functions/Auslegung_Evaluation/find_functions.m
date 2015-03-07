function [fun_starting_point, fun_output, fun_create, fun_ga_options] = find_functions(path)
%FIND_FUNCTIONS Finds detector specific functions by looking up 'path'
%recursively.
%   We consider the implementation of a specific detector to be placed
%   inside a folder. The functions 'generate_starting_point*.m',
%   'output_detector*.m' and 'create_detector*.m' have to be placed somewhere
%   inside this folder. Furthermore a function to set options unsed by the
%   genetic algorithm can be implemented and has to be named as
%   'set_ga_options*.m'.

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

file = rec_search(path, 'set_ga_options*.m');
if(isempty(file))
   fun_ga_options = [];
else
    sf = size(file);
    fun_ga_options = str2func(file(1:sf(1,2)-2));
end
end

