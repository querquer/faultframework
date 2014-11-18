% def init
% cd('./spike_fcn');  
def = legacy_code('initialize');
def.SourceFiles = {'spike_fcn.cpp'};
def.HeaderFiles = {'spike_fcn.hpp'};
def.OutputFcnSpec = 'double y1 = spike_fcn(single u1, single u2, double u3, double u4)';
def.SFunctionName = 'ex_sfun_spikefcn';
def.Options.language = 'C++';
legacy_code('sfcn_cmex_generate', def);
legacy_code('compile', def);
legacy_code('slblock_generate', def);