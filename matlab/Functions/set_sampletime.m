function set_sampletime(path,name,sampletime)
%set_sampletime(PathName_PM,FileName_PM,SampleTime)

path_and_name = strcat(path,name);

%Load system into matlab workspace
load_system(path_and_name);

%set the parameter or the model reference block
si = size(name);
name_approved = name(1:si(1,2)-4);

set_param(name_approved ,'FixedStep', 'SampleTime');
%set_param(name_approved ,'FixedStep', num2str(sampletime));

%save the changed system
close_system(path_and_name,1);

end