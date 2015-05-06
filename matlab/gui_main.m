function varargout = main_gui(varargin)
% MAIN_GUI MATLAB code for main_gui.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_gui

% Last Modified by GUIDE v2.5 06-May-2015 18:01:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @main_gui_OutputFcn, ...
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


% --- Executes just before main_gui is made visible.
function main_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_gui (see VARARGIN)

% Choose default command line output for main_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_setfault.
function pushbutton_setfault_Callback(hObject, eventdata, handles)
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
    set_sampletime(PathName_PM,FileName_PM,sampletime);
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
    display('Start function: classify process model');
    
    fh = str2func(method_name);
    
    warning off all
    prozess_dynamic = fh(evalin('base','FileName_PM'),(evalin('base','SimLength')));
    warning on all
    
    display('Successfully finished: classify process model');
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
        
        popuptext = findobj(gcf,'Tag','popuptext_fil');
        set(popuptext,'Visible','Off');


        runScheduleModeFromGenData;
        display('Faulty data were successfuly generated!');


        convertFaultyData2;
        display('Converting faulty data was successful!');  


        
        sel_filter = evalin('base','sel_filter');
        [config, quality, dist] = get_config(strcat(sel_filter,'.slx'));
        result_filter(config, quality, dist);
        
        state_machine(4);
        
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
        
        popuptext = findobj(gcf,'Tag','popuptext_det');
        set(popuptext,'Visible','Off');


        runScheduleModeFromGenData;
        display('Faulty data were successfuly generated!');

 
        convertFaultyData2;
        display('Converting faulty data was successful!');  

        data_multifault = evalin('base','data_multifault');
        data_singlefault = evalin('base','data_singlefault');
        trigger_multifault = evalin('base','trigger_multifault');
        trigger_singlefault = evalin('base','trigger_singlefault');
        SampleTime = evalin('base','SampleTime');

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


        path_detector_complete = evalin('base','path_detector');

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
        state_machine(4);
        
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
    dynamic = evalin('base','prozess_dynamic');
catch ME
    msgID = 'sugSol:NoDynamic';
    msg = 'Could not find variable: prozess_dynamic. Please run classify processmodel at first!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
end
try  
    fh = str2func(evalin('base','classify_method_name'));
    warning off all 
    prozess_dynamic = fh(evalin('base','FileName_PM'),(evalin('base','SimLength')));
    warning on all
    assignin('base','prozess_dynamic',prozess_dynamic);
catch 
    display('Error: Could not classify the process model!');
end

try
    display('Start function: suggest_solution');
    
    warning off all
    [det, fil] = suggest_solution( dynamic, failures);
    warning on all

    %% update detector table table
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

    set(handles.detectorTable,'data',det_cell);

    %% update filter table

    for idx=1:length(fil)
        fil_cell{idx,1} = fil(idx).name;
        fil_cell{idx,2} = fil(idx).quality;
        fil_cell{idx,3} = fil(idx).dist;
    end

    set(handles.filterTable,'data',fil_cell);

    set(handles.popuptext_det,'Visible','On');
    set(handles.popuptext_fil,'Visible','On');
    state_machine(4);
    
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
path_detector = data{r,5};
assignin('base','path_detector',path_detector);
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
sel_filter = data{r,1};
assignin('base','sel_filter',sel_filter);
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
des = gui_continue();
if(des == 1)
    try
        display('Start function: add_detector');
        
        PathName_Detector = evalin('base','PathName_Detector');

        sa = findstr(PathName_Detector, 'Detector');
        if(isempty(sa) == 0)
            si = size(PathName_Detector);
            path_detector = PathName_Detector(1+sa-1:si(1,2));

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
        
        FileName_Filter = evalin('base','FileName_Filter');
        PathName_Filter = evalin('base','PathName_Filter');

        si = size(FileName_Filter);
        name = FileName_Filter;
        warning off all
        if(isunix())
            add_filter(name, [pwd '/Data/02']);
        else
            add_filter(name, [pwd '\Data/02']);
        end
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
    state_machine(2);
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
    state_machine(3);
    display('Fault configuration were successfully loaded!');
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


% --- Executes during object creation, after setting all properties.
function state_pic_CreateFcn(hObject, eventdata, handles)   
state_machine(1);
% hObject    handle to state_pic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate state_pic

% state machine to represent the actual state of process
% Input: 0 ->  keep state, do imshow
% Input: 1 ->  next state, do imshow
% Input: -1 -> back state, do imshow
function state_machine(state)
handles = guihandles;
state_Tag = get(handles.state_pic, 'Tag');

if(isunix())
    s0 = imread('gui/pic_state0.png');
    s1 = imread('gui/pic_state1.png');
    s2 = imread('gui/pic_state2.png');
    s3 = imread('gui/pic_state3.png');
    s4 = imread('gui/pic_state4.png');
else
    s0 = imread('gui\pic_state0.png');
    s1 = imread('gui\pic_state1.png');
    s2 = imread('gui\pic_state2.png');
    s3 = imread('gui\pic_state3.png');
    s4 = imread('gui\pic_state4.png');
end


switch state
    case 1
        % process model have to be picked
        imshow(s1,'Parent',handles.state_pic)
        % button ausgrauen
    case 2
        % fault configuration have to be picked
        imshow(s2,'Parent',handles.state_pic)
    case 3
        % suggest solution have to be klicked
        imshow(s3,'Parent',handles.state_pic)
    case 4
        % design have to be clicked
        imshow(s4,'Parent',handles.state_pic)
    otherwise
        imshow(s0,'Parent',handles.state_pic)
end
assignin('base','state_machine',state);
set(handles.state_pic, 'Tag', state_Tag);


% --- Executes on button press in pushbutton_testDetector.
function pushbutton_testDetector_Callback(hObject, eventdata, handles)
%detectors = testDetector(path_detector, name_detector, path_data)
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
    assignin('base','detectors',detectors);
    
    display('Successfully finished: testDetector');
catch ME
    msgID = 'pushbutton:testDetector_Callback';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
    
end


% hObject    handle to pushbutton_testDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
state_machine(1);
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton_filteringDetector.
function pushbutton_filteringDetector_Callback(hObject, eventdata, handles)
try
    display('Start function: filterDetector');
    
    failures = evalin('base','act_vec');
    dynamic = evalin('base','prozess_dynamic');
    
    names = get(handles.edit_filteringDet_name, 'string')
    fprate = get(handles.edit_filteringDet_fprate, 'string')
    fnrate = get(handles.edit_filteringDet_fnrate, 'string')

    
    
    [det, fil] = suggest_solution( dynamic, failures);
    

    det = filterSuggestedDetectors(det, str2num(fnrate), str2num(fprate), names)
    
    

    %% update detector table table
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
    display('Successfully finished: filterDetector');
catch ME
    msgID = 'pushbutton:filterDetectors';
    msg = 'Process could not being started!';
    baseException = MException(msgID,msg);
    ME = addCause(ME,baseException);
    throw(ME);
    
end

% hObject    handle to pushbutton_filteringDetector (see GCBO)
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


% --- Executes on button press in pushbutton_deleteDetector.
function pushbutton_deleteDetector_Callback(hObject, eventdata, handles)
try
    display('Start function: deleteDetector');
    failures = evalin('base','act_vec');
    dynamic = evalin('base','prozess_dynamic');
    path_and_name_lookup = evalin('base','path_and_name_lookup');
    
    names = get(handles.edit_filteringDet_name, 'string')

    delete_detector(names, path_and_name_lookup);
    
    [det, fil] = suggest_solution( dynamic, failures);
    
    %% update detector table table
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
