% def init
% cd('C:/Users/Maik/SkyDrive/Simulink/FI_Framework/global_occ');  
def = legacy_code('initialize');
def.SourceFiles = {'global_occ.cpp'};
def.HeaderFiles = {'global_occ.hpp'};
def.OutputFcnSpec = 'double y1 = global_occ(single u1)';
def.SFunctionName = 'ex_sfun_globalocc';
def.Options.language = 'C++';
legacy_code('sfcn_cmex_generate', def);
legacy_code('compile', def);
legacy_code('slblock_generate', def);