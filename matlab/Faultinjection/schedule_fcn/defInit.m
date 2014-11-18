% def init
% cd('./schedule_fcn');  
def = legacy_code('initialize');
def.SourceFiles = {'schedule_fcn.cpp'};
def.HeaderFiles = {'schedule_fcn.hpp'};
def.OutputFcnSpec = 'single y1 = schedule_fcn(double u1, double u2, single u3, single u4)';
def.SFunctionName = 'ex_sfun_schedulefcn';
def.Options.language = 'C++';
legacy_code('sfcn_cmex_generate', def);
legacy_code('compile', def);
legacy_code('slblock_generate', def);