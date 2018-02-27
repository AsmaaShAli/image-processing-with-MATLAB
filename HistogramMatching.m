function varargout = HistogramMatching(varargin)
% HISTOGRAMMATCHING M-file for HistogramMatching.fig
%      HISTOGRAMMATCHING, by itself, creates a new HISTOGRAMMATCHING or raises the existing
%      singleton*.
%
%      H = HISTOGRAMMATCHING returns the handle to a new HISTOGRAMMATCHING or the handle to
%      the existing singleton*.
%
%      HISTOGRAMMATCHING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTOGRAMMATCHING.M with the given input arguments.
%
%      HISTOGRAMMATCHING('Property','Value',...) creates a new HISTOGRAMMATCHING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HistogramMatching_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HistogramMatching_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HistogramMatching

% Last Modified by GUIDE v2.5 25-Dec-2010 18:29:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HistogramMatching_OpeningFcn, ...
                   'gui_OutputFcn',  @HistogramMatching_OutputFcn, ...
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


% --- Executes just before HistogramMatching is made visible.
function HistogramMatching_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HistogramMatching (see VARARGIN)

% Choose default command line output for HistogramMatching
handles.output = hObject;
global Image1;
Image1= getappdata(0,'Image_gui1');
axes(handles.axes1);
imshow(Image1);
guidata(hObject, handles);
% Update handles structure
%====================================== variables==================
global C5;   C5=handles.checkbox5;
global C6;   C6=handles.checkbox6;
global C7;   C7=handles.checkbox7;
global C8;   C8=handles.checkbox8;
global C9;   C9=handles.checkbox9;
global C10;  C10=handles.checkbox10;
global C11;  C11=handles.checkbox11;
global C12;  C12=handles.checkbox12;
global B2;   B2=handles.pushbutton2;
global B3;   B3=handles.pushbutton3;

set(C5,'Enable','off');
set(C6,'Enable','off');
set(C7,'Enable','off');
set(C8,'Enable','off');
set(C9,'Enable','off');
set(C10,'Enable','off');
set(C11,'Enable','off');
set(C12,'Enable','off');
set(B2,'Enable','off');
set(B3,'Enable','off');

%============================ end Variables ========================
% UIWAIT makes HistogramMatching wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = HistogramMatching_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FileName,path]=uigetfile('*.*','Open Image');
axes(handles.axes3);
hold(handles.axes1,'off');
imshow(FileName);

global C5;   C5=handles.checkbox5;
global C6;   C6=handles.checkbox6;
global C7;   C7=handles.checkbox7;
global C8;   C8=handles.checkbox8;
global B2;   B2=handles.pushbutton2;

set(C5,'Enable','on');
set(C6,'Enable','on');
set(C7,'Enable','on');
set(C8,'Enable','on');
set(B2,'Enable','on');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Image1; global Image2; 
Image1= getimage(handles.axes1);
Image2= getimage(handles.axes3);

new=HG_Matching(Image1,Image2);
      axes(handles.axes5);
      hold(handles.axes5,'off');
      imshow(new);
      %setappdata(0,'Image_gui4',getimage(handles.axes5));
      
global C9;   C9=handles.checkbox9;
global C10;  C10=handles.checkbox10;
global C11;  C11=handles.checkbox11;
global C12;  C12=handles.checkbox12;
global B2;   B2=handles.pushbutton2;
global B3;   B3=handles.pushbutton3;

set(C9,'Enable','on');
set(C10,'Enable','on');
set(C11,'Enable','on');
set(C12,'Enable','on');
set(B2,'Enable','off');
set(B3,'Enable','on');      

% --- Executes on button press in checkbox2.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image1;
Image1 = getimage(handles.axes1);
[ro cu n]=size(Image1);
if (get(hObject,'Value') == get(hObject,'Max'))
    if(n==3)
        set(handles.checkbox4,'Value',0);
        redPlane = imhist(Image1(:, :, 1));
        axes(handles.axes2);
        stem(redPlane,'fill','.r');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox1,'Value',0);
    end
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes2);

        if(get(handles.checkbox2,'Value')==1)
            if(n==3)
              greenPlane = imhist(Image1(:, :, 2));
              axes(handles.axes2);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
        
        if(get(handles.checkbox3,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image1(:, :, 3));
              axes(handles.axes2);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end

end
% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox1.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image1;
Image1 = getimage(handles.axes1);
[ro cu n]=size(Image1);
if (get(hObject,'Value') == get(hObject,'Max'))    
      if(n==3)
        set(handles.checkbox4,'Value',0);
        greenPlane = imhist(Image1(:, :, 2));
        axes(handles.axes2);
        stem(greenPlane,'fill','.g');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox2,'Value',0);
    end
    
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes2);
       
        if(get(handles.checkbox1,'Value')==1)
            if(n==3)
              redPlane = imhist(Image1(:, :, 1));
              axes(handles.axes2);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end
        
        if(get(handles.checkbox3,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image1(:, :, 3));
              axes(handles.axes2);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end
end
% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image1;
Image1 = getimage(handles.axes1);
[ro cu n]=size(Image1);

if (get(hObject,'Value') == get(hObject,'Max'))
       if(n==3)
        set(handles.checkbox4,'Value',0);
        bluePlane = imhist(Image1(:, :, 3));
        axes(handles.axes2);
        stem(bluePlane,'fill','.b');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox3,'Value',0);
    end
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes2);
     
        if(get(handles.checkbox1,'Value')==1)
            if(n==3)
              redPlane = imhist(Image1(:, :, 1));
              axes(handles.axes2);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end

        if(get(handles.checkbox2,'Value')==1)
            if(n==3)
              greenPlane = imhist(Image1(:, :, 2));
              axes(handles.axes2);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
end
% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox2.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image1;
Image1 = getimage(handles.axes1);
[ro cu n]=size(Image1);
if (get(hObject,'Value') == get(hObject,'Max'))
    % set all chexkbox is 0
set(handles.checkbox1,'Value',0);
set(handles.checkbox2,'Value',0);
set(handles.checkbox3,'Value',0);

    hold (handles.axes2,'off');
    for l=1:n
        axes(handles.axes2);
        h = imhist(Image1(:, :,l));
        h = stem(h,'fill','d');%'d' is default to type of draw shape,may by(*,--,...) 
        set(h, 'color', [0.5 0.5 0.5]);% fill gray color
        hold on;
    end
    hold (handles.axes2,'off');
elseif (get(hObject,'Value') == get(hObject,'Min'))
     cla(handles.axes2);
end
% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox6.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image2;
Image2 = getimage(handles.axes3);
[ro cu n]=size(Image2);
if (get(hObject,'Value') == get(hObject,'Max'))
    if(n==3)
        set(handles.checkbox4,'Value',0);
        redPlane = imhist(Image2(:, :, 1));
        axes(handles.axes4);
        stem(redPlane,'fill','.r');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox1,'Value',0);
    end
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes4);

        if(get(handles.checkbox2,'Value')==1)
            if(n==3)
              greenPlane = imhist(Image2(:, :, 2));
              axes(handles.axes4);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
        
        if(get(handles.checkbox3,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image2(:, :, 3));
              axes(handles.axes4);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end

end
% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox5.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image2;
Image2 = getimage(handles.axes3);
[ro cu n]=size(Image2);
if (get(hObject,'Value') == get(hObject,'Max'))    
      if(n==3)
        set(handles.checkbox8,'Value',0);
        greenPlane = imhist(Image2(:, :, 2));
        axes(handles.axes4);
        stem(greenPlane,'fill','.g');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox6,'Value',0);
    end
    
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes4);
       
        if(get(handles.checkbox5,'Value')==1)
            if(n==3)
              redPlane = imhist(Image2(:, :, 1));
              axes(handles.axes4);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end
        
        if(get(handles.checkbox7,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image2(:, :, 3));
              axes(handles.axes4);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end
end
% Hint: get
% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image2;
Image2 = getimage(handles.axes3);
[ro cu n]=size(Image2);
if (get(hObject,'Value') == get(hObject,'Max'))
       if(n==3)
        set(handles.checkbox8,'Value',0);
        bluePlane = imhist(Image2(:, :, 3));
        axes(handles.axes4);
        stem(bluePlane,'fill','.b');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox7,'Value',0);
    end
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes4);
     
        if(get(handles.checkbox5,'Value')==1)
            if(n==3)
              redPlane = imhist(Image2(:, :, 1));
              axes(handles.axes4);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end

        if(get(handles.checkbox6,'Value')==1)
            if(n==3)
              greenPlane = imhist(Image2(:, :, 2));
              axes(handles.axes2);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
end
% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox6.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image2;
Image2= getimage(handles.axes3);
[ro cu n]=size(Image2);
if (get(hObject,'Value') == get(hObject,'Max'))
    % set all chexkbox is 0
set(handles.checkbox5,'Value',0);
set(handles.checkbox6,'Value',0);
set(handles.checkbox7,'Value',0);

    hold (handles.axes4,'off');
    for l=1:n
        axes(handles.axes4);
        h = imhist(Image2(:, :,l));
        h = stem(h,'fill','d');%'d' is default to type of draw shape,may by(*,--,...) 
        set(h, 'color', [0.5 0.5 0.5]);% fill gray color
        hold on;
    end
    hold (handles.axes4,'off');
elseif (get(hObject,'Value') == get(hObject,'Min'))
     cla(handles.axes4);
end
% Hint: get(hObject,'Value') returns toggle state of checkbox6

% --- Executes on button press in checkbox10.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image3;
Image3 = getimage(handles.axes5);
[ro cu n]=size(Image3);
if (get(hObject,'Value') == get(hObject,'Max'))
    if(n==3)
        set(handles.checkbox4,'Value',0);
        redPlane = imhist(Image3(:, :, 1));
        axes(handles.axes6);
        stem(redPlane,'fill','.r');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox9,'Value',0);
    end
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes6);

        if(get(handles.checkbox10,'Value')==1)
            if(n==3)
              greenPlane = imhist(Image3(:, :, 2));
              axes(handles.axes6);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
        
        if(get(handles.checkbox11,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image3(:, :, 3));
              axes(handles.axes6);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end

end

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox9.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image3;
Image3 = getimage(handles.axes5);
[ro cu n]=size(Image3);
if (get(hObject,'Value') == get(hObject,'Max'))    
      if(n==3)
        set(handles.checkbox12,'Value',0);
        greenPlane = imhist(Image3(:, :, 2));
        axes(handles.axes6);
        stem(greenPlane,'fill','.g');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox10,'Value',0);
    end
    
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes6);
       
        if(get(handles.checkbox9,'Value')==1)
            if(n==3)
              redPlane = imhist(Image3(:, :, 1));
              axes(handles.axes6);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end
        
        if(get(handles.checkbox11,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image3(:, :, 3));
              axes(handles.axes6);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end
end
% Hint: get
% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image3;
Image3 = getimage(handles.axes5);
[ro cu n]=size(Image3);
if (get(hObject,'Value') == get(hObject,'Max'))
       if(n==3)
        set(handles.checkbox12,'Value',0);
        bluePlane = imhist(Image3(:, :, 3));
        axes(handles.axes6);
        stem(bluePlane,'fill','.b');
        hold on;
    else
        errordlg('The image is gray ,not color','Action Error');
        set(handles.checkbox11,'Value',0);
    end
elseif (get(hObject,'Value') == get(hObject,'Min'))
        cla(handles.axes6);
     
        if(get(handles.checkbox9,'Value')==1)
            if(n==3)
              redPlane = imhist(Image3(:, :, 1));
              axes(handles.axes6);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end

        if(get(handles.checkbox10,'Value')==1)
            if(n==3)
              greenPlane = imhist(Image3(:, :, 2));
              axes(handles.axes6);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
end
% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox10.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image3;
Image3 = getimage(handles.axes5);
[ro cu n]=size(Image3);
if (get(hObject,'Value') == get(hObject,'Max'))
    % set all chexkbox is 0
set(handles.checkbox9,'Value',0);
set(handles.checkbox10,'Value',0);
set(handles.checkbox11,'Value',0);

    hold (handles.axes6,'off');
    for l=1:n
        axes(handles.axes6);
        h = imhist(Image3(:, :,l));
        h = stem(h,'fill','d');%'d' is default to type of draw shape,may by(*,--,...) 
        set(h, 'color', [0.5 0.5 0.5]);% fill gray color
        hold on;
    end
    hold (handles.axes6,'off');
elseif (get(hObject,'Value') == get(hObject,'Min'))
     cla(handles.axes6);
end
% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)S
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'Image_gui4',getimage(handles.axes3));
set(0,'CurrentFigure',project);


