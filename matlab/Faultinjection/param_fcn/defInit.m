% def init
% cd('C:/Users/Maik/SkyDrive/Simulink/FI_Framework/param_fcn');  
def = legacy_code('initialize');
def.SourceFiles = {'param_fcn.cpp'};
def.HeaderFiles = {'param_fcn.hpp'};
def.OutputFcnSpec = 'double y1 = param_fcn(single u1, single u2, single u3)';
def.SFunctionName = 'ex_sfun_paramfcn';
def.Options.language = 'C++';
legacy_code('sfcn_cmex_generate', def);
legacy_code('compile', def);
legacy_code('slblock_generate', def);