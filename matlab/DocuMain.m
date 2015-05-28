%% Fault Processing Framework


%% Introduction
% Designing filters and detectors appropriate for a given process model
% needs to:

%%
% * analyze the process model
% * find a appropriate filter method
% * find appropriate parameters for this filter
% * find a appropriate detector method
% * find appropriate parameters for this detector.

%%
% Therefore, the design process can be time consuming. To reduce this effort
% this framework provides algorithms for analyzing the given process model,
% suggesting appropriate filters and detectors and designing these.
% Futhermore, a faultinjection module is used to inject sensor faults based
% on specified parameters like the occurence probability, amplitude and
% several others. 

%% How to use this framework
% The framework supports two different workflows. At the one hand, we
% assume a situation, where a specific process model as well as a fault
% model is given and one wants to test a specific detector or filter to
% determine its performance for this setup. This scenario is support by the
% graphical user interface <FIDF_Design.html FIDF Design>.
% 
% At the other hand, it is a repeating task to design filters and detectors
% for different process models. Therefore, one has to find appropriate
% parameters for filters and detectors specific to a given process model,
% while the implementation of both does not change. The second workflow,
% which was in main focus while developing this framework, supports the
% reuse of implementations of filters and detectors. The GUI
% <gui_docu.html FIDF Framework> encapsulates this workflow.
