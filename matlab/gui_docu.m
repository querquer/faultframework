%% Documentation Graphical User Interface
%
%

% Picture Main Frame
% <<FILENAME.PNG>>



%%% Panel: Process Model

% Elemtent: *Choose Process Model*
% Funktion: Get the file name and path of the processmodel with uigetfile()
% and call set_processModel() with the given informations

% Elemtent: *Clasify Process Model*
% Funktion: Calls classify_processmodel() and write the result to the
% workspace as _prozess_dynamic_

% Elemtent: *Run Process Model*
% Funktion: Calls getModelData() and write the generated data to the
% workspace as _gendata_

% Elemtent: *Plot Process Model Data*
% Funktion: Calls plot() wich _gendata_



%%% Panel: Global Konfiguration

% Elemtent: *Simulation Length*
% Funktion: Get the consigned data from the field and write it as
% _SimLength_ to the workspace

% Elemtent: *Sample Time*
% Funktion: Get the consigned data from the field and write it as
% _SampleTime_ to the workspace

% Elemtent: *Global Seed*
% Funktion: Get the consigned data from the field and write it as
% _GlobalSeed_ to the workspace



%%% Panel: Import/Export

% Elemtent: *Detector Name*
% Funktion: Get the consigned data from the field and write it as
% _FileName_Detector_ to the workspace

% Elemtent: *Choose Detector*
% Funktion: Get the path of the detector with uigetfile()
% and write it as _FilePath_Detector_ to the workspace

% Elemtent: *Choose Filter*
% Funktion: Get the name and the path of the filter with uigetfile()
% and write them as _FileName_Filter_ and _FilePath_Filter_ to the workspace

% Elemtent: *Add Detector*
% Funktion: Calls add_detector() with the given data from the previous
% elements

% Elemtent: *Add Filter*
% Funktion: Calls add_detector() with the given data from the previous
% elements

% Elemtent: *Export*
% Funktion: no function yet



%%% Panel: Fault Injection Modul

% Elemtent: *Choose Fault Injection Configuration*
% Funktion: Get the name and the path of the fault configuration file with
% uigetfile() and calls loadFaultKonf() and countFaults()

% Elemtent: *Set up Faults*
% Funktion: Calls gui_faultlist which open a new window

% Elemtent: *Generate Test Data*
% Funktion: Calls runScheduleMode() with the given fault configuration file
% and also calls convertFaultyData() to provide a proper representation of
% the results

% Elemtent: *Suggest Solution*
% Funktion: Calls suggest_solution() which fills the detector/filter table
% with the data of filter/detector from the LookUp-Table. These data are
% fitted to the actual process model dynamic and fault activation.



%%% Panel: Fault Detection Modul

% Elemtent: *Detection Table*
% Funktion: See Suggest Solution

% Elemtent: *Filter Table*
% Funktion: See Suggest Solution

% Elemtent: *Design Detector*
% Funktion: Calls start_designing_detector()

% Elemtent: *Design Filter*
% Funktion: Calls set_filter(sel_filter)



% Picture Fault Injection Konfiguration Set Up
% <<FILENAME.PNG>>

%%% Panel: Process Model
% Elemtent: *Choose Process Model*
% Funktion:



%%% Documentation Fault Parameter Window

% Picture Fault Parameter Window
% <<FILENAME.PNG>>

%%% Panel: Process Model
% Elemtent: *Choose Process Model*
% Funktion:
