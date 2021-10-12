function varargout = completeattendance(varargin)
% COMPLETEATTENDANCE MATLAB code for completeattendance.fig
%      COMPLETEATTENDANCE, by itself, creates a new COMPLETEATTENDANCE or raises the existing
%      singleton*.
%
%      H = COMPLETEATTENDANCE returns the handle to a new COMPLETEATTENDANCE or the handle to
%      the existing singleton*.
%
%      COMPLETEATTENDANCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPLETEATTENDANCE.M with the given input arguments.
%
%      COMPLETEATTENDANCE('Property','Value',...) creates a new COMPLETEATTENDANCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before completeattendance_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to completeattendance_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help completeattendance

% Last Modified by GUIDE v2.5 23-Apr-2018 19:24:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @completeattendance_OpeningFcn, ...
                   'gui_OutputFcn',  @completeattendance_OutputFcn, ...
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


% --- Executes just before completeattendance is made visible.
function completeattendance_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to completeattendance (see VARARGIN)

% Choose default command line output for completeattendance
handles.output = hObject;
an=varargin{1};

%conn = database('project','root','Komal123');
%curs = exec(conn,'SELECT * FROM students');
%curs = fetch(curs);
%an=curs.Data;
%handles.data = varargin{1};
%f = figure('Position', [100 100 752 250]);
%t = uitable('Parent', f, 'Position', [25 50 700 200], 'Data',an );
%t.Data = {};
%x = get(handles.uitable1,'Data');
y(:,:) = an(:,:);
set(handles.uitable1,'Data',y(:,:));
setappdata(0,'report',y);

%values = {'1','2','3','4','5','6','7'};
%valuesAsCell = mat2cell(values ,1,[1,6]);
%set(handles.uitable1,'Data',valuesAsCell{:,:});
%t.ColumnName = {'Roll Number', 'Name', 'Attendance','asd'};
%conn = database('project','root','Komal123');
%curs = exec(conn,'SELECT * FROM students');
%curs = fetch(curs);
%curs.Data;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes completeattendance wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = completeattendance_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
%f = figure('Position', [100 100 752 250]);
%t = uitable('Parent', f, 'Position', [25 50 700 200], 'Data', magic(10))


% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in download.
function download_Callback(hObject, eventdata, handles)
% hObject    handle to download (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
an=getappdata(0,'report');
y(:,:) = an(:,:);
xlswrite('Report.xlsx',y);
set(handles.uitable1,'Data',y(:,:));