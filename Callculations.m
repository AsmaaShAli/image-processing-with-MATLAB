function varargout = Callculations(varargin)
% CALLCULATIONS M-file for Callculations.fig
%      CALLCULATIONS, by itself, creates a new CALLCULATIONS or raises the existing
%      singleton*.
%
%      H = CALLCULATIONS returns the handle to a new CALLCULATIONS or the handle to
%      the existing singleton*.
%
%      CALLCULATIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALLCULATIONS.M with the given input arguments.
%
%      CALLCULATIONS('Property','Value',...) creates a new CALLCULATIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Callculations_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Callculations_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Callculations

% Last Modified by GUIDE v2.5 25-Dec-2010 18:25:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Callculations_OpeningFcn, ...
                   'gui_OutputFcn',  @Callculations_OutputFcn, ...
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


% --- Executes just before Callculations is made visible.
function Callculations_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Callculations (see VARARGIN)

% Choose default command line output for Callculations
handles.output = hObject;

global Image1;
Image1= getappdata(0,'Image_gui1');
axes(handles.axes1);
imshow(Image1);


% Update handles structure
guidata(hObject, handles);
%========================= Variables======================
global B1;    B1=handles.pushbutton1;
global B3;    B3=handles.pushbutton3;
global P1;    P1=handles.popupmenu1;
set(B1,'Enable','off');
set(B3,'Enable','off');
set(P1,'Enable','off');

%========================= End Variables==================

% UIWAIT makes Callculations wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Callculations_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag;
switch get(handles.popupmenu1,'Value')
    case 2
        Flag=1;
      
    case 3
        Flag=2;
      
end

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag;
global Image1; global Image2; 
Image1= getimage(handles.axes1);
Image2= getimage(handles.axes2);


switch Flag
    case 1
       newadd= AddFun(Image1,Image2);
       axes(handles.axes3);
       hold(handles.axes3,'off');
       imshow(newadd);
       %setappdata(0,'Image_gui3',getimage(handles.axes3));
    case 2
      newsub= SubFun(Image1,Image2);
      axes(handles.axes3);
      hold(handles.axes3,'off');
      imshow(newsub);
     % setappdata(0,'Image_gui3',getimage(handles.axes3));
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,path]=uigetfile('*.*','Open Image');

axes(handles.axes2);
hold(handles.axes1,'off');
imshow(FileName);

global B1;    B1=handles.pushbutton1;
global B3;    B3=handles.pushbutton3;
global P1;    P1=handles.popupmenu1;
set(B1,'Enable','on');
set(B3,'Enable','on');
set(P1,'Enable','on');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setappdata(0,'Image_gui3',getimage(handles.axes3));
set(0,'CurrentFigure',project);
