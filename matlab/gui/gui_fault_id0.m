function varargout = gui_fault_id0(varargin)
% GUI_FAULT_ID0 MATLAB code for gui_fault_id0.fig
%      GUI_FAULT_ID0, by itself, creates a new GUI_FAULT_ID0 or raises the existing
%      singleton*.
%
%      H = GUI_FAULT_ID0 returns the handle to a new GUI_FAULT_ID0 or the handle to
%      the existing singleton*.
%
%      GUI_FAULT_ID0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FAULT_ID0.M with the given input arguments.
%
%      GUI_FAULT_ID0('Property','Value',...) creates a new GUI_FAULT_ID0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_fault_id0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_fault_id0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_fault_id0

% Last Modified by GUIDE v2.5 22-Mar-2015 20:53:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_fault_id0_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_fault_id0_OutputFcn, ...
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


% --- Executes just before gui_fault_id0 is made visible.
function gui_fault_id0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_fault_id0 (see VARARGIN)

% Choose default command line output for gui_fault_id0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_fault_id0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_fault_id0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
assignin('base','id0factor', get(hObject,'String'));
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
	assignin('base','id0permanent', 1);
else
    assignin('base','id0permanent', 0);
end
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
