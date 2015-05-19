function varargout = gui_second(varargin)
% GUI_SECOND MATLAB code for gui_second.fig
%      GUI_SECOND, by itself, creates a new GUI_SECOND or raises the existing
%      singleton*.
%
%      H = GUI_SECOND returns the handle to a new GUI_SECOND or the handle to
%      the existing singleton*.
%
%      GUI_SECOND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SECOND.M with the given input arguments.
%
%      GUI_SECOND('Property','Value',...) creates a new GUI_SECOND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_second_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_second_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_second

% Last Modified by GUIDE v2.5 19-May-2015 12:57:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_second_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_second_OutputFcn, ...
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


% --- Executes just before gui_second is made visible.
function gui_second_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_second (see VARARGIN)

% Choose default command line output for gui_second
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_second wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_second_OutputFcn(hObject, eventdata, handles) 
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
