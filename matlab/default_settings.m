%% load default setting into workspace

try
    x = evalin('base','isInit');
catch
    % init state machine
    state_machine = 1;
    assignin('base','state_machine',state_machine);
    
    % classify method
    classify_method_name = 'classify_processmodel';
    assignin('base','classify_method_name',classify_method_name);
    
    % global parameter
    SimLength = 10.0;
    assignin('base','SimLength',SimLength);
    SampleTime = 0.01;
    assignin('base','SampleTime',SampleTime);
    GlobalSeed = 10.0;
    assignin('base','GlobalSeed',GlobalSeed);


    % Choose elements
    if(isunix())
        PathName_Filter = 'Filter/';
        PathName_Detector = 'Detector/';
        PathName_FaultKonf = 'Faultinjection/XML/';
        PathName_PM = 'ProcessModel/';
    else
        PathName_Filter = 'Filter\';
        PathName_Detector = 'Detector\';
        PathName_FaultKonf = 'Faultinjection\XML\';
        PathName_PM = 'ProcessModel\';
    end
    
    FileName_Filter = 'Filter';
    assignin('base','FileName_Filter',FileName_Filter);
    assignin('base','PathName_Filter',PathName_Filter);

    FileName_Detector = 'Detector';
    assignin('base','FileName_Detector',FileName_Detector);
    assignin('base','PathName_Detector',PathName_Detector);

    
    FileName_FaultKonf = 'faultKonf_nofaults.xml';
    assignin('base','FileName_FaultKonf',FileName_FaultKonf);
    assignin('base','PathName_FaultKonf',PathName_FaultKonf);

    FileName_PM = 'middle_new.slx';
    assignin('base','FileName_PM',FileName_PM);
    assignin('base','PathName_PM',PathName_PM);

    % data ordner
    if(isunix())
        Path_Data = '/Data/03';
    else

        Path_Data = '\Data\03';
    end
    assignin('base','Path_Data',Path_Data);
    
    % lookup table
    if(isunix())
        path_and_name_lookup = '/Functions/lookuptable';
    else

        path_and_name_lookup = '\Functions\lookuptable';
    end
    assignin('base','path_and_name_lookup',path_and_name_lookup);
    
    % other

    prozess_dynamic = 2;
    assignin('base','prozess_dynamic',prozess_dynamic);

    num_faults = 0;
    assignin('base','num_faults',num_faults);

    act_vec = [0 0 0 0 0 1 1 0 0 0 0 0 0];
    assignin('base','act_vec',act_vec);
    
    TriggerBus = load('TriggerBus.mat');
    assignin('base','TriggerBus',TriggerBus(1).TriggerBus);

    isInit = 1;
    assignin('base','isInit',isInit);
end
