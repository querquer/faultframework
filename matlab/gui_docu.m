%% Documentation Graphical User Interface
%
%%

%% Image of the graphical user interface
% <<gui_main.png>>

%% Related Functions

%%
% * <set_processModel.html set_processModel>
% * <getModelData.html getModelData>
% * <add_detector.html add_detector>
% * <add_filter.html add_filter>
% * <export_filter.html export_filter>
% * <loadFaultKonf.html loadFaultKonf>
% * <countFaults.html countFaults>
% * <runScheduleMode.html runScheduleMode>
% * <convertFaultyData.html convertFaultyData>
% * <suggest_solution.html suggest_solution>
% * <start_designing_detector.html start_designing_detector>
% * <set_filter.html set_filter>
% * <state_machine.html state_machine>
% * <greyOutButton.html greyOutButton>

%% Related Graphical User Interfaces

%%
% * <gui_faultlist_docu.html GUI-Faultlist>



%%% Panel: Process Model

% Element: *Choose Process Model*
% Function: Get the file name and path of the processmodel with uigetfile()
% and call set_processModel() with the given informations

% Element: *Clasify Process Model*
% Function: Calls classify_processmodel() and write the result to the
% workspace as _prozess_dynamic_

% Element: *Run Process Model*
% Function: Calls getModelData() and write the generated data to the
% workspace as _gendata_

% Element: *Plot Process Model Data*
% Function: Calls plot() wich _gendata_



%%% Panel: Global Konfiguration

% Element: *Simulation Length*
% Function: Get the consigned data from the field and write it as
% _SimLength_ to the workspace

% Element: *Sample Time*
% Function: Get the consigned data from the field and write it as
% _SampleTime_ to the workspace

% Element: *Global Seed*
% Function: Get the consigned data from the field and write it as
% _GlobalSeed_ to the workspace



%%% Panel: Import/Export

% Element: *Detector Name*
% Function: Get the consigned data from the field and write it as
% _FileName_Detector_ to the workspace

% Element: *Choose Detector*
% Function: Get the path of the detector with uigetfile()
% and write it as _FilePath_Detector_ to the workspace

% Element: *Choose Filter*
% Function: Get the name and the path of the filter with uigetfile()
% and write them as _FileName_Filter_ and _FilePath_Filter_ to the workspace

% Element: *Add Detector*
% Function: Calls add_detector() with the given data from the previous
% elements

% Element: *Add Filter*
% Function: Calls add_filter() with the given data from the previous
% elements

% Element: *Export*
% Function: no function yet



%%% Panel: Fault Injection Modul

% Element: *Choose Fault Injection Configuration*
% Function: Get the name and the path of the fault configuration file with
% uigetfile() and calls loadFaultKonf() and countFaults()

% Element: *Set up Faults*
% Function: Calls the GUI-Faultlist

% Element: *Generate Test Data*
% Function: Calls runScheduleMode() with the given fault configuration file
% and also calls convertFaultyData() to provide a proper representation of
% the results

% Element: *Suggest Solution*
% Function: Calls suggest_solution() which fills the detector/filter table
% with the data of filter/detector from the LookUp-Table. These data are
% fitted to the actual process model dynamic and fault activation.



%%% Panel: Fault Detection Modul

% Element: *Detection Table*
% Function: Filled with the data of detector from the LookUp-Table. These data are
% fitted to the actual process model dynamic and fault activation. Elements
% can be selected to choose a detector for the design detector process.

% Element: *Design Detector*
% Function: Calls start_designing_detector()



%%% Panel: Fault Filter Modul

% Element: *Filter Table*
% Function: Filled with the data of filter from the LookUp-Table. These data are
% fitted to the actual process model dynamic and fault activation. Elements
% can be selected to choose a filter for the design filter process.

% Element: *Design Filter*
% Function: Calls set_filter()

