%% The Graphical User Interface to Test and Design new Filters and Detectors
%

%% How to use this Graphical User Interface 'FIDF_Design'
% This GUI supports the user by designing and testing of filters and
% detectors on a given process model. 
% 
% The first step is to choos a Process Model with the "Choose Process Model
%" Button. The model should be a Simulink model with exactly one output. It
%represent the sensor observations.
% 
% The second step is to specify the expected fault types and their
% parameters. This can be done by choosing a save fault configuration with
% the button "Choose Fault Konf.".
% 
% Now you can choose a filter or detector by pushing the corresponding
% button. When choosing a detector, you have to select the folder containing
% all necessary functions (see also <design_detector.html design_detector>,
% section 'Specifying a detector type'). If you choose a filter, you have to
% select the Simulink model of the filter (see also <get_config.html
% get_config> section 'Add New Filter').
% 
% You can now design your detector or filter by pushing the corresponding
% button. This will start a time consuming process. During this process, 
% the detector/filter will be tested for the given process model with the 
% given fault configuration. At the end, the performance of the detector/filter
% is displayed. If the results are satisfying, one can export the
% detector/filter to a specified folder by using the button 'Export Detector' 
% or 'Export Filter'.