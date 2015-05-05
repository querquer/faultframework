%% Fault framework


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
% Therefore the design process can be time consuming. To reduce this effort
% this framework provides algorithms for analyzing the given process model,
% suggesting appropriate filters and detectors and designing these.
% Futhermore, a faultinjection module is used to inject sensor faults based
% on specified parameters like the occurence probability, amplitude and
% several others. 

%% How to use this framework
% --> insert workflow diagramm: Maik

%% Detectors
% After choosing your process model, classifying it and specifying the 
% expected fault types, the 'Suggest
% Solution' button will provide you with a list of detectors and filters.
% This table contains the names of the methods on which the detector is
% based on as well as some performance values, namely false-positives
% rates and false-negatives rates. If you have choosen multiple faults,
% every detector will be listed multiple times, each time describing the
% performance concerning a different fault type. The listed values are
% only a first gues on how a specific detector could performe on your
% provided process model. By marking one cell of an
% detector and using the button 'Design Detector' the framework will start
% to design the detector for the given process model. This is done by a
% optimization algorithm and can take some time. At the end a window will
% show up, displaying the performance of the resulting detector. If the
% results are appropriate, one can export the designed detector as a
% Simulink-Model by clicking the button 'Export'. 

  
%% Filter
% The provided filter table contains the name of the filter with a quality
% value and a distance value. How this values are calculated is described 
% <filter_quality_check_simple.html here>. The listed values are
% only a first gues on how a specific filter could performe on your
% provided process model. By marking one cell of an
% filter and using the button 'Design Filter' the framework will start
% to design the filter for the given process model. This is done by a
% optimization algorithm and can take some time. At the end a window will
% show up, displaying the performance of the resulting filter. If the
% results are appropriate, one can export the designed filter as a
% Simulink-Model by clicking the button 'Export'.

%% Functions
