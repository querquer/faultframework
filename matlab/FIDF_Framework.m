function varargout = FIDF_Framework(varargin)
% FIDF_Framwork MATLAB code for FIDF_Framwork.fig
%      FIDF_Framwork, by itself, creates a new FIDF_Framwork or raises the existing
%      singleton*.
%
%      H = FIDF_Framwork returns the handle to a new FIDF_Framwork or the handle to
%      the existing singleton*.
%
%      FIDF_Framwork('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIDF_Framwork.M with the given input arguments.
%
%      FIDF_Framwork('Property','Value',...) creates a new FIDF_Framwork or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIDF_Framwork_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIDF_Framwork_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIDF_Framwork

% Last Modified by GUIDE v2.5 19-May-2015 14:24:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIDF_Framwork_OpeningFcn, ...
                   'gui_OutputFcn',  @FIDF_Framwork_OutputFcn, ...
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


% --- Executes just before FIDF_Framwork is made visible.
function FIDF_Framwork_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIDF_Framwork (see VARARGIN)

% Choose default command line output for FIDF_Framwork
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIDF_Framwork wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIDF_Framwork_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_setfault.
function pushbutton_setfault_Callback(hObject, eventdata, handles)
assignin('base','handles_main',handles);
gui_faultlist;
% hObject    handle to pushbutton_setfault (see GCBO)
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
SimLength = evalin('base','SimLength');
set(hObject,'string',num2str(SimLength));
% hObject    handle to edit_simlength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sampletime_Callback(hObject, eventdata, handles)
sampletime = str2double(get(hObject,'string'));
assignin('base','SampleTime', sampletime);

try
    PathName_PM = evalin('base','PathName_PM');
    FileName_PM = evalin('base','FileName_PM');
    if(strcmp(PathName_PM,'ProcessModel\'))
        display('Can not set SampleTime! Please select a Processmodel and try again.');
    else
        set_sampletime(PathName_PM,FileName_PM,sampletime);
    end
catch ME
    msgID = 'set_param:SampleTime';
    msg = 'Could not set the sample time in the process model!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end

% hObject    handle to edit_sampletime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sampletime as text
%        str2double(get(hObject,'String')) returns contents of edit_sampletime as a double


% --- Executes during object creation, after setting all properties.
function edit_sampletime_CreateFcn(hObject, eventdata, handles)
SampleTime = evalin('base','SampleTime');
set(hObject,'string',num2str(SampleTime));
% hObject    handle to edit_sampletime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_globalseed_Callback(hObject, eventdata, handles)
assignin('base','GlobalSeed', str2double(get(hObject,'string')));
% hObject    handle to edit_globalseed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_globalseed as text
%        str2double(get(hObject,'String')) returns contents of edit_globalseed as a double


% --- Executes during object creation, after setting all properties.
function edit_globalseed_CreateFcn(hObject, eventdata, handles)
GlobalSeed = evalin('base','GlobalSeed');
set(hObject,'string',num2str(GlobalSeed));
% hObject    handle to edit_globalseed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton_classify.
function pushbutton_classify_Callback(hObject, eventdata, handles)
try  
    method_name = evalin('base','classify_method_name');
    display(['Start function: ' method_name]);
    
    fh = str2func(method_name);
    
    warning off all
    path_and_name_pm = [evalin('base','PathName_PM') evalin('base','FileName_PM')];
    prozess_dynamic = fh(path_and_name_pm,(evalin('base','SimLength')));
    warning on all
    
    display(['Successfully finished: ' method_name]);
    display(['Prcessmodel classified as [' num2str(prozess_dynamic) '] with the funcion [' method_name ']']);
    assignin('base','prozess_dynamic',prozess_dynamic);
catch 
    display('Error: Could not classify the process model!');
end

% hObject    handle to pushbutton_classify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
items = get(hObject,'String');
index_selected = get(hObject,'Value');
item_selected = items{index_selected};
set_detector(item_selected);
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
try
    detector_array = find_models('Detectors');
catch
    detector_array = 'no detector found';
end
set(hObject,'String',detector_array);
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
items = get(hObject,'String');
index_selected = get(hObject,'Value');
item_selected = items{index_selected};
set_filter(item_selected);
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
try
    filter_array = find_models('Filter');
catch
    filter_array = 'no filter found';
end
set(hObject,'String',filter_array);
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_pm.
function popupmenu_pm_Callback(hObject, eventdata, handles)
items = get(hObject,'String');
index_selected = get(hObject,'Value');
item_selected = items{index_selected};
set_processModel(item_selected);
assignin('base','processModelName',item_selected);
if(isunix())
    assignin('base','path_and_name',strcat('ProzessModel/',item_selected));
else
    assignin('base','path_and_name',strcat('ProzessModel\',item_selected));
end

% hObject    handle to popupmenu_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_pm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_pm


% --- Executes during object creation, after setting all properties.
function popupmenu_pm_CreateFcn(hObject, eventdata, handles)
try
    model_array = find_models('ProcessModel');
catch
    model_array = 'no model found';
end
set(hObject,'String',model_array);
% hObject    handle to popupmenu_pm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


        
        tableSelection_filter_name = evalin('base','tableSelection_filter_name');
        [config, quality, dist] = get_config(strcat(tableSelection_filter_name,'.slx'));
        result_filter(config, quality, dist);
        
        state_machine(6, handles);
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

        path_detector_complete = evalin('base','tableSelection_detector_path');

        sa = findstr(path_detector_complete, 'Detector');
        si = size(path_detector_complete);
        if(isempty(sa) == 0)
            path_detector = path_detector_complete(1+sa-1:si(1,2));
        else
            path_detector = path_detector_complete;
        end


        home_path = pwd;
        warning off all
        [fn, fp] = start_designing_detector(data_multifault, data_singlefault, trigger_multifault, trigger_singlefault, SampleTime, path_and_name, path_detector);
        warning on all
        cd(home_path);
        % show results
        result_detector(fn,fp);
        close_system('Designed_Detector_TEMP');
        
        state_machine(6, handles);
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


% --- Executes on button press in pushbutton_sugsol.
function pushbutton_sugsol_Callback(hObject, eventdata, handles)
try
    failures = evalin('base','act_vec');
catch ME
    msgID = 'sugSol:NoActVec';
    msg = 'Could not find variable: act_vec. Please set up a fault konfiguration at first!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end
try  
    fh = str2func(evalin('base','classify_method_name'));
    warning off all 
    path_and_name_pm = [evalin('base','PathName_PM') evalin('base','FileName_PM')];
    prozess_dynamic = fh(path_and_name_pm,(evalin('base','SimLength')));
    warning on all
    assignin('base','prozess_dynamic',prozess_dynamic);
catch 
    display('Error: Could not classify the process model!');
end

try
    display('Start function: suggest_solution');

    warning off all
    [det, fil] = suggest_solution( prozess_dynamic, failures);
    warning on all

    update_tables(det, fil, handles);
  

    state_machine(4, handles);
    
    display('Successfully finished: suggest_solution');
catch ME
    msgID = 'pushbutton:suggest_solution';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end

% hObject    handle to pushbutton_sugsol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes when selected cell(s) is changed in detectorTable.
function detectorTable_CellSelectionCallback(hObject, eventdata, handles)
data = get(hObject,'Data');
indices = eventdata.Indices;
r = indices(:,1);
c = indices(:,2);
linear_index = sub2ind(size(data),r,c);
selected_vals = data(linear_index);
tableSelection_detector_path = data{r,5};
tableSelection_detector_name = data{r,1};
temp = 0;
while(isempty(tableSelection_detector_name) && temp < 50)
    tableSelection_detector_name = data{r-temp,1};
    tableSelection_detector_path = data{r-temp,5};
    temp = temp + 1;
end
assignin('base','tableSelection_detector_path',tableSelection_detector_path);
assignin('base','tableSelection_detector_name',tableSelection_detector_name);
state_machine(5, handles);
%path_detector
%selection_sum = sum(sum(selected_vals))
% hObject    handle to detectorTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in filterTable.
function filterTable_CellSelectionCallback(hObject, eventdata, handles)
data = get(hObject,'Data');
indices = eventdata.Indices;
r = indices(:,1);
c = indices(:,2);
linear_index = sub2ind(size(data),r,c);
selected_vals = data(linear_index);
tableSelection_filter_name = data{r,1};
temp = 0;
while(isempty(tableSelection_filter_name) && temp < 50)
    tableSelection_filter_name = data{r-temp,1};
    temp = temp + 1;
end
assignin('base','tableSelection_filter_name',tableSelection_filter_name);
state_machine(5, handles);
% hObject    handle to filterTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_runPM.
function pushbutton_runPM_Callback(hObject, eventdata, handles)
try
    display('Start function: getModelData');
    
    FileName_PM = evalin('base','FileName_PM');
    simlength = evalin('base','SimLength');
    % set sampletime
    warning off all
    gendata = getModelData(FileName_PM, simlength);
    warning on all
    assignin('base','gendata',gendata);
    
    display('Successfully finished: getModelData');
catch ME
    msgID = 'pushbutton:runPM_Callback';
    msg = 'No data were found. Please run the processmodel at first.';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end
% hObject    handle to pushbutton_runPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in plot_gendata.
function plot_gendata_Callback(hObject, eventdata, handles)
try
    display('Start function: getModelData');
    
    FileName_PM = evalin('base','FileName_PM');
    simlength = evalin('base','SimLength');
    % set sampletime
    warning off all
    gendata = getModelData(FileName_PM, simlength);
    warning on all
    assignin('base','gendata',gendata);
    
    display('Successfully finished: getModelData');
    
    figure();
    plot(evalin('base','gendata'));
catch ME
    msgID = 'pushbutton:gendata_Callback';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end
% hObject    handle to plot_gendata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_addDetctor.
function pushbutton_addDetctor_Callback(hObject, eventdata, handles)

try
    display('Start function: add_detector');

    PathName_Detector = evalin('base','PathName_Detector');

    sa = findstr(PathName_Detector, 'Detector');
    if(isempty(sa) == 0)
        si = size(PathName_Detector);
        path_detector = PathName_Detector(1+sa-1:si(1,2));
        detectors = evalin('base', 'detectors');
        warning off all
        if(isunix())
            add_detector(detectors,[pwd '/Functions/lookuptable.mat']);
        else
            add_detector(detectors,[pwd '\Functions\lookuptable.mat']);
        end
        warning on all
    else
        disp('Please store your detector implementation below the folders matlab/Detectors/');
    end

    display('Successfully finished: add_detector');
catch ME
    msgID = 'pushbutton:testDetector_Callback';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end


% hObject    handle to pushbutton_addDetctor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_addFilter.
function pushbutton_addFilter_Callback(hObject, eventdata, handles)
des = gui_continue();
if(des == 1)
    try
        display('Start function: add_filter');
        
        new_filter_collector = evalin('base','new_filter_collector');
        Path_Data = evalin('base','path_and_name_lookup');

        warning off all
        add_filter(new_filter_collector, [pwd Path_Data]);
        warning on all
        
        display('Successfully finished: add_filter');
    catch ME
        msgID = 'pushbutton:addFilter_Callback';
        msg = 'Process could not being started!';
        baseException = MException(msgID,msg);
        ME = addCause(ME,baseException);
        throw(ME);
    end
end
% hObject    handle to pushbutton_addFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function popupmenu_detector_CreateFcn(hObject, eventdata, handles)
try
    detector_array = find_models('Detectors');
catch
    detector_array = 'no detector found';
end
set(hObject,'String',detector_array);
% hObject    handle to popupmenu_detector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function popupmenu_filter_CreateFcn(hObject, eventdata, handles)
try
    filter_array = find_models('Filter');
catch
    filter_array = 'no filter found';
end
set(hObject,'String',filter_array);
% hObject    handle to popupmenu_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in pushbutton_choosePM.
function pushbutton_choosePM_Callback(hObject, eventdata, handles)
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

% hObject    handle to pushbutton_choosePM (see GCBO)
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
    act_vec = evalin('base','act_vec');
    types = actVec2str(act_vec);
    display('The following fault types are activated:');
    display(types);
    state_machine(3, handles);
    display('Configuration loaded successfully!');
end

% hObject    handle to pushbutton_chooseFaultKonf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_nameDetector_Callback(hObject, eventdata, handles)
assignin('base','FileName_Detector', get(hObject,'string'));
% hObject    handle to edit_nameDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_nameDetector as text
%        str2double(get(hObject,'String')) returns contents of edit_nameDetector as a double


% --- Executes during object creation, after setting all properties.
function edit_nameDetector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_nameDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in pushbutton_classify_method.
function pushbutton_classify_method_Callback(hObject, eventdata, handles)
[FileName_Method,PathName_Method,MethodIndex] = uigetfile('*.m','Classify Method Selector');
if FileName_Method > 0
    si = size(FileName_Method);
    FileName_approved = FileName_Method(1:si(1,2)-2);
    assignin('base','classify_method_name',FileName_approved);
end
% hObject    handle to pushbutton_classify_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton_testDetector.
function pushbutton_testDetector_Callback(hObject, eventdata, handles)
%detectors = testDetector(path_detector, name_detector, path_data)
des = gui_continue();
if(des == 1)
    try
        display('Start function: testDetector');

        FileName_Detector = evalin('base','FileName_Detector');
        PathName_Detector = evalin('base','PathName_Detector');
        Path_Data = evalin('base','Path_Data'); 

        sa = findstr(PathName_Detector, 'Detector');

        si = size(PathName_Detector);
        path_detector = PathName_Detector(1+sa-1:si(1,2));
        warning off all
        detectors = testDetector(path_detector, FileName_Detector,  [pwd Path_Data]);
        warning on all
        result_testDetector(detectors);

        display('Successfully finished: testDetector');
    catch ME
        msgID = 'pushbutton:testDetector_Callback';
        msg = 'Process could not being started!';
        baseException = MException(msgID,msg);
        ME = addCause(ME,baseException);
        throw(ME);

    end
end

% hObject    handle to pushbutton_testDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
state_machine(1, handles);
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton_filteringFilter.
function pushbutton_filteringFilter_Callback(hObject, eventdata, handles)
try
    display('Start function: filterSuggestedFilters');
    
    failures = evalin('base','act_vec');
    dynamic = evalin('base','prozess_dynamic');
    
    names = get(handles.edit_filteringFil_name, 'string');
    quality = get(handles.edit_filteringFil_quality, 'string');
    dist = get(handles.edit_filteringFil_dist, 'string');

    warning off all
    [det, fil] = suggest_solution( dynamic, failures);
    
    fil = filterSuggestedFilters(fil, str2num(quality), str2num(dist), {names});
    warning on all
    
    update_tables(det, fil, handles);

    display('Successfully finished: filterSuggestedFilters');
catch ME
    msgID = 'pushbutton:filterFilter';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
    
end

% hObject    handle to pushbutton_filteringFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_filteringDet_name_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filteringDet_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filteringDet_name as text
%        str2double(get(hObject,'String')) returns contents of edit_filteringDet_name as a double


% --- Executes during object creation, after setting all properties.
function edit_filteringDet_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filteringDet_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_filteringDet_fprate_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filteringDet_fprate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filteringDet_fprate as text
%        str2double(get(hObject,'String')) returns contents of edit_filteringDet_fprate as a double


% --- Executes during object creation, after setting all properties.
function edit_filteringDet_fprate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filteringDet_fprate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_filteringDet_fnrate_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filteringDet_fnrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filteringDet_fnrate as text
%        str2double(get(hObject,'String')) returns contents of edit_filteringDet_fnrate as a double


% --- Executes during object creation, after setting all properties.
function edit_filteringDet_fnrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filteringDet_fnrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function update_tables(det, fil, handles)
try
    
    %% update detector table table
    if(length(det) > 0)
        det_old = '';
        for idx=1:length(det)

            det_new = det(idx).name;
            if(strcmp(det_old,det_new))
                % same detector
                det_cell{idx,1} = '';
                det_cell{idx,2} = det(idx).fp_rate.name;
                det_cell{idx,3} = det(idx).fp_rate.fp_rate;
                det_cell{idx,4} = det(idx).fn_rate.fn_rate;
                det_cell{idx,5} = '';
            else
                % new detector
                det_cell{idx,1} = det(idx).name;
                det_cell{idx,2} = det(idx).fp_rate.name;
                det_cell{idx,3} = det(idx).fp_rate.fp_rate;
                det_cell{idx,4} = det(idx).fn_rate.fn_rate;
                det_cell{idx,5} = det(idx).path;
            end

            det_old = det_new;
        end

        
    else
       det_cell{1,1} = '';
       det_cell{1,2} = ''; 
       det_cell{1,3} = ''; 
       det_cell{1,4} = ''; 
       det_cell{1,5} = ''; 
    end
    set(handles.detectorTable,'data',det_cell);
    %% update filter table
    if(length(fil) > 0)
        for idx=1:length(fil)
            fil_cell{idx,1} = fil(idx).name;
            fil_cell{idx,2} = fil(idx).quality;
            fil_cell{idx,3} = fil(idx).dist;
        end
    else
        fil_cell{1,1} = '';
        fil_cell{1,2} = '';
        fil_cell{1,3} = '';
    end
    set(handles.filterTable,'data',fil_cell);
 
    
catch ME
    msgID = 'function:updateTable';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end

% --- Executes on button press in pushbutton_deleteDetector.
function pushbutton_deleteDetector_Callback(hObject, eventdata, handles)
try
    display('Start function: deleteDetector');
    
    failures = evalin('base','act_vec');
    dynamic = evalin('base','prozess_dynamic');
    path_and_name_lookup = evalin('base','path_and_name_lookup');
    
    names = evalin('base','tableSelection_detector_name');

    delete_detector(names, [pwd path_and_name_lookup]);
    
    warning off all
    [det, fil] = suggest_solution( dynamic, failures);
    warning on all
    
    update_tables(det, fil, handles);
    
    
    display('Successfully finished: deleteDetector');
catch ME
    msgID = 'pushbutton:suggest_solution';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end
% hObject    handle to pushbutton_deleteDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_filteringFil_name_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filteringFil_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filteringFil_name as text
%        str2double(get(hObject,'String')) returns contents of edit_filteringFil_name as a double


% --- Executes during object creation, after setting all properties.
function edit_filteringFil_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filteringFil_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_deleteFilter.
function pushbutton_deleteFilter_Callback(hObject, eventdata, handles)
try
    display('Start function: deleteDetector');
    
    failures = evalin('base','act_vec');
    dynamic = evalin('base','prozess_dynamic');
    path_and_name_lookup = evalin('base','path_and_name_lookup');
    
    names = evalin('base','tableSelection_filter_name');

    delete_filter(names, [pwd path_and_name_lookup]);
    
    warning off all
    [det, fil] = suggest_solution( dynamic, failures);
    warning on all
    
    update_tables(det, fil, handles);
    
    
    display('Successfully finished: deleteDetector');
catch ME
    msgID = 'pushbutton:suggest_solution';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end
% hObject    handle to pushbutton_deleteFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_testFilter.
function pushbutton_testFilter_Callback(hObject, eventdata, handles)
des = gui_continue();
if(des == 1)
    try
        display('Start function: testFilter');
        FileName_Filter = evalin('base','FileName_Filter');
        Path_Data = evalin('base','Path_Data');
        
        warning off all
        new_filter_collector = test_filter_to_add( FileName_Filter, [pwd Path_Data] );
        warning on all
        
        assignin('base','new_filter_collector',new_filter_collector);
        
        %result_testFilter(quality, dist);

        display('Successfully finished: testFilter');
    catch ME
        msgID = 'pushbutton:testFilter_Callback';
        msg = 'Process could not being started!';
        baseException = MException(msgID,msg);
        ME = addCause(ME,baseException);
        throw(ME);
    end
end
% hObject    handle to pushbutton_testFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    


% --- Executes on button press in checkbox_greyOut.
function checkbox_greyOut_Callback(hObject, eventdata, handles)
try
    if (get(hObject,'Value') == get(hObject,'Max'))
        display('All buttons are no more clickable now!');
        hideButtons = 1;
        assignin('base','hideButtons',hideButtons);
        state = evalin('base','state_machine');
        state_machine(state,handles);
    else
        display('All buttons are clickable now!');
        hideButtons = 0;
        assignin('base','hideButtons',hideButtons);
        buttonList = {};
        greyOutButton(buttonList, handles);
    end
catch ME
        msgID = 'checkbox:greyOutButton';
        msg = 'Process could not being started!';
        baseException = MException(msgID,msg);
        ME = addCause(ME,baseException);
        throw(ME);
    end
% hObject    handle to checkbox_greyOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_greyOut



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



function edit_filteringFil_quality_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filteringFil_quality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filteringFil_quality as text
%        str2double(get(hObject,'String')) returns contents of edit_filteringFil_quality as a double


% --- Executes during object creation, after setting all properties.
function edit_filteringFil_quality_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filteringFil_quality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_filteringFil_dist_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filteringFil_dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filteringFil_dist as text
%        str2double(get(hObject,'String')) returns contents of edit_filteringFil_dist as a double


% --- Executes during object creation, after setting all properties.
function edit_filteringFil_dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filteringFil_dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_filteringDetector.
function pushbutton_filteringDetector_Callback(hObject, eventdata, handles)
try
    display('Start function: filterSuggestedDetectors');
    
    failures = evalin('base','act_vec');
    dynamic = evalin('base','prozess_dynamic');
    
    names = get(handles.edit_filteringDet_name, 'string');
    fprate = get(handles.edit_filteringDet_fprate, 'string');
    fnrate = get(handles.edit_filteringDet_fnrate, 'string');

    warning off all
    [det, fil] = suggest_solution( dynamic, failures);
    
    det = filterSuggestedDetectors(det,str2num(fnrate), str2num(fprate), {names});
    warning on all
    
    update_tables(det, fil, handles);

    display('Successfully finished: filterSuggestedDetectors');
catch ME
    msgID = 'pushbutton:filterFilter';
    msg = 'Unable to start process!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
    
end
% hObject    handle to pushbutton_filteringDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
