function varargout = basic(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @basic_OpeningFcn, ...
                   'gui_OutputFcn',  @basic_OutputFcn, ...
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


% --- Executes just before basic is made visible.
function basic_OpeningFcn(hObject, eventdata, handles, varargin)

conn = database('students_details','root','root');
setappdata(0,'con',conn);

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to basic (see VARARGIN)

% Choose default command line output for basic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes basic wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = basic_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
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


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in Attendance.
function Attendance_Callback(hObject, eventdata, handles)
c=getappdata(0,'con');
basic2(c);
% hObject    handle to Attendance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%{
% --- Executes on button press in Emotions.
function Emotions_Callback(hObject, eventdata, handles)
d  =   getappdata(0,'con');
curs = exec(d,'SELECT * FROM student_report');
curs = fetch(curs);
an=curs.Data;
Emo(an);
%}
% hObject    handle to Emotions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%main();

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
close basic;
close;
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Attendance.
function Attendance_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Attendance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start_monitoring.
function start_monitoring_Callback(hObject, eventdata, handles)
%%------------------TIME FILE FOR COLUMN NAMES IN DAtABASE--------------------%%
rmdir('C:\Users\Wazeed\Desktop\fix\PROJECT\test','s')
mkdir('C:\Users\Wazeed\Desktop\fix\PROJECT\test')
try 
    load timedb.mat;
    time = timedb;
    disp(time);
catch
    time = 1;
    save timedb.mat time;
end
if (strcmp(handles.start_monitoring.String,'Start Monitoring') == 1)
    handles.start_monitoring.String = 'Stop Monitoring';
    msgbox('Monitoring....');
    conn = database('students_details','root','root');
   %%---------------looping------------
    for loop = time:time%+2
         time = loop +1;
         save timedb.mat time;
    DETECTFACE(conn,loop);
    pause(10);
    if (strcmp(handles.start_monitoring.String,'Start Monitoring') == 1)
    handles.start_monitoring.String = 'Start Monitoring';
    break;
    
    end
    end
    handles.start_monitoring.String = 'Start Monitoring';
   
   
else 
    handles.start_monitoring.String = 'Start Monitoring';
   
end
% hObject    handle to start_monitoring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%{
% --- Executes on button press in training.
function training_Callback(hObject, eventdata, handles)
% hObject    handle to training (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
module_1_training();
%}
