% def init
% cd('C:/Users/Maik/SkyDrive/Simulink/FI_Framework/occ_fcn');  
def = legacy_code('initialize');
def.SourceFiles = {'occ_fcn.cpp'};
def.HeaderFiles = {'occ_fcn.hpp'};
def.OutputFcnSpec = 'double y1 = occ_fcn(single u1, single u2)';
def.SFunctionName = 'ex_sfun_occfcn';
def.Options.language = 'C++';
legacy_code('sfcn_cmex_generate', def);
legacy_code('compile', def);
legacy_code('slblock_generate', def);