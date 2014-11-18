% def init
%cd('C:/Users/Maik/SkyDrive/Simulink/FI_Framework/expr_parser');  
def = legacy_code('initialize');
def.SourceFiles = {'pars_distr.cpp'};
def.HeaderFiles = {'pars_distr.hpp'};
def.OutputFcnSpec = 'double y1 = pars_distr(single u1, single u2, double u3)';
def.SFunctionName = 'ex_sfun_parsdistr';
def.Options.language = 'C++';
legacy_code('sfcn_cmex_generate', def);
legacy_code('compile', def);
legacy_code('slblock_generate', def);