%% load default setting into workspace

try
    evalin('base','isInit');
catch

    % global parameter
    SimLength = 10.0;
    assignin('base','SimLength',SimLength);
    SampleTime = 0.01;
    assignin('base','SimLength',SimLength);
    GlobalSeed = 10.0;
    assignin('base','SimLength',SimLength);


    % Choose elements
    FileName_Filter = 'Filter.slx';
    PathName_Filter = 'Filter/';
    assignin('base','FileName_Filter',FileName_Filter);
    assignin('base','PathName_Filter',PathName_Filter);

    FileName_Detector = 'Detector.slx';
    PathName_Detector = 'Detector/';
    assignin('base','FileName_Detector',FileName_Detector);
    assignin('base','PathName_Detector',PathName_Detector);

    FileName_FaultKonf = 'faultKonf_nofaults.xml';
    PathName_FaultKonf = 'Faultinjection/XML/';
    assignin('base','FileName_FaultKonf',FileName_FaultKonf);
    assignin('base','PathName_FaultKonf',PathName_FaultKonf);

    FileName_PM = 'middle_nuw.slx';
    PathName_PM = 'ProcessModel/';
    assignin('base','FileName_PM',FileName_PM);
    assignin('base','PathName_PM',PathName_PM);

    % other

    prozess_dynamic = 2;
    assignin('base','prozess_dynamic',prozess_dynamic);

    num_faults = 0;
    assignin('base','num_faults',num_faults);

    TriggerBus = load('TriggerBus.mat');
    assignin('base','TriggerBus',TriggerBus(1).TriggerBus);

    isInit = 1;
    assignin('base','isInit',isInit);
end
