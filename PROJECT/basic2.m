function varargout = basic2(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @basic2_OpeningFcn, ...
                   'gui_OutputFcn',  @basic2_OutputFcn, ...
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


% --- Executes just before basic2 is made visible.
function basic2_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to basic2 (see VARARGIN)
c = varargin{1};
setappdata(0,'conn',c);
% Choose default command line output for basic2
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes basic2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = basic2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Image_Callback(hObject, eventdata, handles)
% hObject    handle to Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Image as text
%        str2double(get(hObject,'String')) returns contents of Image as a double


% --- Executes during object creation, after setting all properties.
function Image_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function roll_no_Callback(hObject, eventdata, handles)
x=(get(handles.roll_no,'String'));
x=str2num(x);
setappdata(0,'reg_no',x);
% hObject    handle to roll_no (see GCBO)
%set(handles.roll_no,'string',num2str(handles.roll_no_parameter));
%guidata(hObject,handles);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of roll_no as text
%        str2double(get(hObject,'String')) returns contents of roll_no as a double


% --- Executes during object creation, after setting all properties.
function roll_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to roll_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function attendance_Callback(hObject, eventdata, handles)
% hObject    handle to attendance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of attendance as text
%        str2double(get(hObject,'String')) returns contents of attendance as a double


% --- Executes during object creation, after setting all properties.
function attendance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to attendance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','green');
end


% --- Executes on button press in show_attendance.
function show_attendance_Callback(hObject, eventdata, handles)
y=getappdata(0,'reg_no');
no = y;
con = getappdata(0,'conn');
curs = exec(con,'SELECT * FROM students');
curs = fetch(curs);
an=curs.Data;
y=num2str(y);
if(isempty(str2num(y)))
    set(handles.roll_no,'string','');
    warndlg('Input must be numerical');
     set(handles.showstaticpercentage,'String','');
else
   % set(handles.showstaticpercentage,'String',y);
    c(1,:) = an(no,4:end);
    clen = size(c);
    clencol=clen(2);
   % disp(clencol);
    query = sprintf('SELECT c1 From Students WHERE Number = %d',no);
    curs = exec(con,query);
    curs = fetch(curs);
    A=curs.Data;
    %total = 0;
    total = sum([c{1:end}]);
    %disp(total);
   % for i=1;i<=clencol;i=i+1
    %    total = total+c(1:i);
    %end
    %disp(total);
    percentage = round((total/clencol)*100,2);
    %disp(float(percentage,2));
    percentage = sprintf('%0.1f %%',percentage);
    %query = sprintf('SELECT c1 From Students WHERE Number = %d',no);
    set(handles.showstaticpercentage,'String',percentage);
    %sqlquery = 'ALTER TABLE students ADD Attendance2 varchar(30)';
       %ADD A COLUMN NAMES PERCENTAGE AND AFTER EVERY ENTRY OF A NEW COLUMN
       %THAT IS ATTENDANCE AT PARTICULAR TIME CALCULATE THE ATTENDANCE PERCENTAGE AND STORE IT IN DATABASE IT SELF
    %curs = exec(con,sqlquery);
    query = sprintf('SELECT Image From Students WHERE Number = %d',no);
    curs = exec(con,query);
    curs = fetch(curs);
    im = curs.Data;
    url = sprintf('%s',im{1});
    im =imread(url);   
    %disp(im);
    %im = imread('C:\Users\Kallu\Desktop\PROJECT\1.jpg');
    imshow(im);
   %from database extract percentage
end
%set(handles.showpercentage,'String',b);
% hObject    handle to show_attendance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in EXIT.
function EXIT_Callback(hObject, eventdata, handles)
close;
% hObject    handle to EXIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in complete_attendance.
function complete_attendance_Callback(hObject, eventdata, handles)
con = getappdata(0,'conn');
curs = exec(con,'SELECT * FROM students');
curs = fetch(curs);
an=curs.Data;
%setappdata(0,'an',curs.Data);
completeattendance(an);

% hObject    handle to complete_attendance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function showpercentage_Callback(hObject, eventdata, handles)
% hObject    handle to showpercentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of showpercentage as text
%        str2double(get(hObject,'String')) returns contents of showpercentage as a double


% --- Executes during object creation, after setting all properties.
function showpercentage_CreateFcn(hObject, eventdata, handles)

% hObject    handle to showpercentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function showstaticpercentage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to showstaticpercentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
