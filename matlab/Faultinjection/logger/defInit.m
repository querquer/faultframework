% def init
% cd('C:/Users/Maik/SkyDrive/Simulink/SVN_FI/logger');  
def = legacy_code('initialize');
def.SourceFiles = {'logger.cpp'};
def.HeaderFiles = {'logger.hpp'};
def.OutputFcnSpec = 'single y1 = logger(single u1, double u2, double u3, double u4[], double u5[])';
def.SFunctionName = 'ex_sfun_logger';
def.Options.language = 'C++';
legacy_code('sfcn_cmex_generate', def);
legacy_code('compile', def);
legacy_code('slblock_generate', def);