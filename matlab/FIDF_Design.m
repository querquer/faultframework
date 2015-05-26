function varargout = FIDF_Design(varargin)
% FIDF_DESIGN MATLAB code for FIDF_Design.fig
%      FIDF_DESIGN, by itself, creates a new FIDF_DESIGN or raises the existing
%      singleton*.
%
%      H = FIDF_DESIGN returns the handle to a new FIDF_DESIGN or the handle to
%      the existing singleton*.
%
%      FIDF_DESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIDF_DESIGN.M with the given input arguments.
%
%      FIDF_DESIGN('Property','Value',...) creates a new FIDF_DESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIDF_Design_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIDF_Design_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIDF_Design

% Last Modified by GUIDE v2.5 26-May-2015 13:48:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIDF_Design_OpeningFcn, ...
                   'gui_OutputFcn',  @FIDF_Design_OutputFcn, ...
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

default_settings;
% End initialization code - DO NOT EDIT


% --- Executes just before FIDF_Design is made visible.
function FIDF_Design_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIDF_Design (see VARARGIN)

% Choose default command line output for FIDF_Design
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIDF_Design wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIDF_Design_OutputFcn(hObject, eventdata, handles) 
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
des = gui_continue();
if(des == 1)
    try
        display('Start function: start_designing_detector');

        runScheduleModeFromGenData;
        display('Faulty data were successfuly generated!');

 
        convertFaultyData;
        display('Converting faulty data was successful!');  

        data_multifault = evalin('base','data_multifault');
        data_singlefault = evalin('base','data_singlefault');
        trigger_multifault = evalin('base','trigger_multifault');
        trigger_singlefault = evalin('base','trigger_singlefault');
        SampleTime = evalin('base','SampleTime');

        warning off all
        if(isunix()) 
            if exist('/Output/Designed_Detector_TEMP','file') > 0
                delete('/Output/Designed_Detector_TEMP');
            end
            path_and_name = strcat(pwd,'/Output/Designed_Detector_TEMP');

        else
            if exist('\Output\Designed_Detector_TEMP','file') > 0
                delete('\Output\Designed_Detector_TEMP');
            end
            path_and_name = strcat(pwd,'\Output\Designed_Detector_TEMP');
        end
        warning on all

        PathName_Detector = evalin('base','PathName_Detector');

        sa = findstr(PathName_Detector, 'Detector');
        si = size(PathName_Detector);
        if(isempty(sa) == 0)
            path_detector = PathName_Detector(1+sa-1:si(1,2));
        else
            path_detector = PathName_Detector;
        end


        home_path = pwd;
        warning off all
        [fn, fp] = start_designing_detector(data_multifault, data_singlefault, trigger_multifault, trigger_singlefault, SampleTime, path_and_name, path_detector);
        warning on all
        cd(home_path);
        % show results
        result_detector(fn,fp);
        close_system('Designed_Detector_TEMP');
        
        display('Successfully finished: start_designing_detector');
    catch ME
        msgID = 'pushbutton:desdet_Callback';
        msg = 'Process could not being started!';
        baseException = MException(msgID,msg);
        ME = addCause(ME,baseException);
        throw(ME);
    end
end
% hObject    handle to pushbutton_desdet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_desfil.
function pushbutton_desfil_Callback(hObject, eventdata, handles)
des = gui_continue();
if(des == 1)
    try
        display('Start function: start_designing_filter');
        
        runScheduleModeFromGenData;
        display('Faulty data were successfuly generated!');

        convertFaultyData;
        display('Converting faulty data was successful!');  


        FileName_Filter = evalin('base','FileName_Filter');
        [config, quality, dist] = get_config(FileName_Filter);
        result_filter(config, quality, dist);

        display('Successfully finished: start_designing_filter');
    catch ME
        msgID = 'pushbutton:desfil_Callback';
        msg = 'Process could not being started!';
        baseException = MException(msgID,msg);
        ME = addCause(ME,baseException);
        throw(ME);
    end
end
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



function edit_simlength_Callback(hObject, eventdata, handles)
assignin('base','SimLength', str2double(get(hObject,'string')));
% hObject    handle to edit_simlength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_simlength as text
%        str2double(get(hObject,'String')) returns contents of edit_simlength as a double


% --- Executes during object creation, after setting all properties.
function edit_simlength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_simlength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sampletime_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sampletime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sampletime as text
%        str2double(get(hObject,'String')) returns contents of edit_sampletime as a double


% --- Executes during object creation, after setting all properties.
function edit_sampletime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sampletime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
