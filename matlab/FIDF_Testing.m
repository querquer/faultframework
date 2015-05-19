function varargout = FIDF_Testing(varargin)
% FIDF_TESTING MATLAB code for FIDF_Testing.fig
%      FIDF_TESTING, by itself, creates a new FIDF_TESTING or raises the existing
%      singleton*.
%
%      H = FIDF_TESTING returns the handle to a new FIDF_TESTING or the handle to
%      the existing singleton*.
%
%      FIDF_TESTING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIDF_TESTING.M with the given input arguments.
%
%      FIDF_TESTING('Property','Value',...) creates a new FIDF_TESTING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIDF_Testing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIDF_Testing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIDF_Testing

% Last Modified by GUIDE v2.5 19-May-2015 15:57:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIDF_Testing_OpeningFcn, ...
                   'gui_OutputFcn',  @FIDF_Testing_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FIDF_Testing is made visible.
function FIDF_Testing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIDF_Testing (see VARARGIN)

% Choose default command line output for FIDF_Testing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIDF_Testing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIDF_Testing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_chooseDetector.
function pushbutton_chooseDetector_Callback(hObject, eventdata, handles)
currentFolder = pwd;
PathName_Detector = uigetdir(pwd);
if PathName_Detector > 0
    assignin('base','PathName_Detector',PathName_Detector);
end
% hObject    handle to pushbutton_chooseDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_chooseFilter.
function pushbutton_chooseFilter_Callback(hObject, eventdata, handles)
[FileName_Filter,PathName_Filter,FilterIndex] = uigetfile('*.slx','File Selector');
if FileName_Filter > 0
    assignin('base','FileName_Filter',FileName_Filter);
    assignin('base','PathName_Filter',PathName_Filter);
end
% hObject    handle to pushbutton_chooseFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_desdet.
function pushbutton_desdet_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_desdet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_desfil.
function pushbutton_desfil_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_desfil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_ChooseProcessModel.
function pushbutton_ChooseProcessModel_Callback(hObject, eventdata, handles)
[FileName_PM,PathName_PM,FilterIndex] = uigetfile({'*.slx';'*.m';'*.mat';'*.*'},'File Selector',strcat(pwd,'/ProcessModel'));
if FileName_PM > 0
    set_processModel(FileName_PM);
    assignin('base','FileName_PM',FileName_PM);
    assignin('base','PathName_PM',PathName_PM);
    try 
        sampletime = evalin('base','SampleTime');
        set_sampletime(PathName_PM,FileName_PM,sampletime);
    catch ME
        msgID = 'set_param:SampleTime';
        msg = 'Could not set the sample time in the process model!';
        baseException = MException(msgID,msg);
        ME = addCause(ME,baseException);
        throw(ME);
    end
    state_machine(2, handles);
end
% hObject    handle to pushbutton_ChooseProcessModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_chooseFaultKonf.
function pushbutton_chooseFaultKonf_Callback(hObject, eventdata, handles)
[FileName_FaultKonf,PathName_FaultKonf] = uigetfile('*.xml','File Selector',strcat(pwd,'/Faultinjection/XML'));
if FileName_FaultKonf > 0
    assignin('base','FileName_FaultKonf',FileName_FaultKonf);
    assignin('base','PathName_FaultKonf',PathName_FaultKonf);
    loadFaultKonf(FileName_FaultKonf);
    countFaults(FileName_FaultKonf);
    state_machine(3, handles);
    display('Fault configuration were successfully loaded!');
end
% hObject    handle to pushbutton_chooseFaultKonf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_export_detector.
function pushbutton_export_detector_Callback(hObject, eventdata, handles)
[FileName,PathName] = uiputfile('*.slx','Save Detector');
display(strcat(PathName,FileName));
if PathName > 0
    if(isunix())
        movefile('Output/Designed_Detector_TEMP.slx',strcat(PathName,FileName));
    else
        movefile('Output\Designed_Detector_TEMP.slx',strcat(PathName,FileName));
    end
    
end
% hObject    handle to pushbutton_export_detector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_export_filter.
function pushbutton_export_filter_Callback(hObject, eventdata, handles)
currentFolder = pwd;
PathName_Filter = uigetdir(pwd);
if PathName_Filter > 0
    export_filter(PathName_Filter);
end
% hObject    handle to pushbutton_export_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
