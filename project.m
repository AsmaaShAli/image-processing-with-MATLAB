function varargout = project(varargin)
% PROJECT M-file for project.fig
%      PROJECT, by itself, creates a newmenu PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a newmenu PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a newmenu PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 24-Dec-2010 09:27:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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



% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project

% variables and setting====================================================
handles.output = hObject;

% Disactive ===============================================================
%logo================
% img=imread('open2.jpg');
% axes(handles.axes3);
% imshow(img);
%====================
%resize
global panel4; %%%%%%%%%%%
panel4= handles.uipanel4;
global B1; % resize %%%%%%%%%
B1=handles.pushbutton1;
global E1; % resize %%%%%%%%%
E1=handles.edit1;
global E2; % resize
E2=handles.edit2;

resizeDisActive(B1,E1,E2);
%==========
%gamma &retinex
global panel5;
panel5=handles.uipanel5;
global t8;
t8=handles.text8;
global B4;
B4=handles.pushbutton4;
global E7;
E7=handles.edit7;

GammaDisActive(B4,E7);
%=========
%filtersmenu
global panel6;
panel6=handles.uipanel6;
global B2;
B2=handles.pushbutton2;
global E8;
E8=handles.edit8;
global E9;
E9=handles.edit9;
global t9;
t9=handles.text9;
global t10;
t10=handles.text10;
set(t10,'visible','off');
set(E9,'visible','off');

filterDisActive(B2,E8,E9);
%=========
%Quantization
global panel11;
panel11=handles.uipanel11;
global B3;
B3=handles.pushbutton3;
global E10;
E10=handles.edit10;

QuantizationDisActive(B3,E10);

%=========
%image
global Image;
Image = getimage(handles.axes1);
%=========
%=========
%figure options 
% global B5;
% global panel13;
% panel13=handles.uipanel13;
% B5=handles.pushbutton5;
% set(B5,'Enable','off');

%=========
%menu
global ImageMenu;
global IlluminationMenu;
global FiltersMenu;
global NewMenu;
global Save_As_Menu;
global uipushtool1;
global uipushtool3;
global uitoggletool1;
global uitoggletool2; 
global uitoggletool3;
global uipushtool4;
ImageMenu=handles.ImageMenu;
IlluminationMenu=handles.IlluminationMenu;
FiltersMenu=handles.FiltersMenu;
NewMenu=handles.NewMenu;
Save_As_Menu=handles.Save_As_Menu;

uipushtool1=handles.uipushtool1;
uipushtool3=handles.uipushtool3;
uitoggletool1=handles.uitoggletool1;
uitoggletool2=handles.uitoggletool2;
uitoggletool3=handles.uitoggletool3;
uipushtool4=handles.uipushtool4;
%=========
%convert
global Convert_to_Spat;
global Convert_to_Ferq;
Convert_to_Spat=handles.Convert_to_Spatial;
Convert_to_Ferq=handles.Convert_to_Ferquency;
set(Convert_to_Spat,'Enable','off');
set(Convert_to_Ferq,'Enable','on');

%=========
%figure
global flag_new_figure;

if (flag_new_figure == 1)
    
Image = getappdata(0,'Image_gui2');
axes(handles.axes1);
imshow(Image);

elseif ( flag_new_figure == 2 )
    Image = getappdata(0,'Image_gui3');
    axes(handles.axes1);
    imshow(Image);
    
elseif ( flag_new_figure == 3 ) 
    Image = getappdata(0,'Image_gui4');
    axes(handles.axes1);
    imshow(Image);
    
end

%======
%======================================================================
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);





% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
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
global Image;
Image = getimage(handles.axes1);

Im=imread('image.jpg');
axes(handles.axes1);
hold(handles.axes1,'on');
imshow(Im);
hold(handles.axes1,'off');
global E1; E1=handles.edit1;
global E2;
global resize_flag ;

W=get(handles.edit1,'string');
H=get(handles.edit2,'string');

W=str2num(W);
H=str2num(H);

if (resize_flag == 1)
    if (W == H )
        new = imresize(Image,[W H ],'nearest');
        Image=new;
        axes(handles.axes1);
        hold(handles.axes1,'on');
        imshow(Image);
        hold(handles.axes1,'off');
        set(E1,'String','');
        set(E2,'String','');
        resize_flag = 0;
    end
elseif (resize_flag == 2 )
  new = imresize(Image,[W H ],'bilinear');
Image=new;
axes(handles.axes1);
hold(handles.axes1,'on');
imshow(Image);
hold(handles.axes1,'off');
set(E1,'String','');
set(E2,'String','');
resize_flag= 0;

elseif (resize_flag == 3 )
new=reverse(W,H,Image);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'on');
imshow(Image);
hold(handles.axes1,'off');
set(E1,'String','');
set(E2,'String','');
resize_flag = 0;
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

global Image;
Image = getimage(handles.axes1);
[ro cu n]=size(Image);
if (get(hObject,'Value') == get(hObject,'Max'))
    if(n==3)
        set(handles.checkbox4,'Value',0);
        redPlane = imhist(Image(:, :, 1));
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
              greenPlane = imhist(Image(:, :, 2));
              axes(handles.axes2);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
        
        if(get(handles.checkbox3,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image(:, :, 3));
              axes(handles.axes2);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end

end

global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
% global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

% set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global Image;
Image = getimage(handles.axes1);
[ro cu n]=size(Image);
if (get(hObject,'Value') == get(hObject,'Max'))    
      if(n==3)
        set(handles.checkbox4,'Value',0);
        greenPlane = imhist(Image(:, :, 2));
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
              redPlane = imhist(Image(:, :, 1));
              axes(handles.axes2);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end
        
        if(get(handles.checkbox3,'Value')==1)
            if(n==3)
              bluePlane = imhist(Image(:, :, 3));
              axes(handles.axes2);
              stem(bluePlane,'fill','.b');
              hold on;
            end
        end
end


global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
% global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

% set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global Image;
Image = getimage(handles.axes1);
[ro cu n]=size(Image);
if (get(hObject,'Value') == get(hObject,'Max'))
       if(n==3)
        set(handles.checkbox4,'Value',0);
        bluePlane = imhist(Image(:, :, 3));
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
              redPlane = imhist(Image(:, :, 1));
              axes(handles.axes2);
              stem(redPlane,'fill','.r');
              hold on;
            end
        end

        if(get(handles.checkbox2,'Value')==1)
            if(n==3)
              greenPlane = imhist(Image(:, :, 2));
              axes(handles.axes2);
              stem(greenPlane,'fill','.g');
              hold on;
            end
        end
end


global B1;B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
% global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

% set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
global Image;
Image = getimage(handles.axes1);
[ro cu n]=size(Image);
if (get(hObject,'Value') == get(hObject,'Max'))
    % set all chexkbox is 0
set(handles.checkbox1,'Value',0);
set(handles.checkbox2,'Value',0);
set(handles.checkbox3,'Value',0);

    hold (handles.axes2,'off');
    for l=1:n
        axes(handles.axes2);
        h = imhist(Image(:, :,l));
        h = stem(h,'fill','d');%'d' is default to type of draw shape,may by(*,--,...) 
        set(h, 'color', [0.5 0.5 0.5]);% fill gray color
        hold on;
    end
    hold (handles.axes2,'off');
elseif (get(hObject,'Value') == get(hObject,'Min'))
     cla(handles.axes2);
end

global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
global E8;
global E9;

global Flag;
if (Flag==1)
Image = getimage(handles.axes1);
mask=get(handles.edit8,'string');
mask=str2num(mask);
new=Box_filter(Image,mask);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');

elseif(Flag==2)
Image = getimage(handles.axes1);
maskSize=get(handles.edit8,'string');
maskSize=str2num(maskSize);
mask=Weighted_Gaussian(maskSize);
new=linear_filter(Image,mask);
Image=uint8(new);
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif (Flag==3)
Image = getimage(handles.axes1);
mask=get(handles.edit8,'string');
mask=str2num(mask);
new=Max_filter(Image,mask);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif (Flag==4)
Image = getimage(handles.axes1);
mask=get(handles.edit8,'string');
mask=str2num(mask);
new=Min_filter(Image,mask);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif (Flag==5)
Image = getimage(handles.axes1);
mask=get(handles.edit8,'string');
mask=str2num(mask);
new=Median_filter(Image,mask);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif(Flag==6)
Image = getimage(handles.axes1);
D0=get(handles.edit8,'string');
D0=str2num(D0);
new=L_Gaussian(Image,D0);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif(Flag==7)
Image = getimage(handles.axes1);
D0=get(handles.edit8,'string');
D0=str2num(D0);
N=get(handles.edit9,'string');
N=str2num(N);
new=L_butterworth(D0,N,Image);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');

elseif(Flag==8)
Image = getimage(handles.axes1);
D0=get(handles.edit8,'string');
D0=str2num(D0);

new=L_Ideal(D0,Image);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif(Flag==9)
Image = getimage(handles.axes1);
D0=get(handles.edit8,'string');
D0=str2num(D0);

new=H_Gaussian(D0,Image);
axes(handles.axes1);
Image=new;
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif(Flag==10)
Image = getimage(handles.axes1);
D0=get(handles.edit8,'string');
D0=str2num(D0);
N=get(handles.edit9,'string');
N=str2num(N);
new=H_butterworth(D0,N,Image);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif(Flag==11)
Image = getimage(handles.axes1);
masksize=get(handles.edit8,'string');
masksize=str2num(masksize);

new=Geomtric_filter(Image,masksize);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif(Flag==12)
Image = getimage(handles.axes1);
D0=get(handles.edit8,'string');
D0=str2num(D0);

new=H_Ideal(D0,Image);
Image=new;
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');
elseif(Flag==13)
Image = getimage(handles.axes1);
masksize=get(handles.edit8,'string');
masksize=str2num(masksize);

new=Mid_Point(Image,masksize);
axes(handles.axes1);
Image=new;
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Image);
%hold(handles.axes1,'off');
Flag=0;
set(E8,'String','');
set(E9,'String','');


end

% --------------------------------------------------------------------
function NewMenu_Callback(hObject, eventdata, handles)
% hObject    handle to NewMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ImageMenu;
global IlluminationMenu;
global FiltersMenu;
global NewMenu;
global Save_As_Menu;
global uipushtool1;
global uipushtool3;
global uitoggletool1;
global uitoggletool2; 
global uitoggletool3;
global uipushtool4;

%axes(handles.axes1);
%hold(handles.axes1,'off');
Im=imread('image.jpg');
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(Im);
%hold(handles.axes1,'off');
axes(handles.axes3);
%hold(handles.axes3,'on');
hold(handles.axes3,'off');
imshow(Im);
%hold(handles.axes3,'off');
menuDisActive(ImageMenu,IlluminationMenu,FiltersMenu,NewMenu,Save_As_Menu,uipushtool1,uipushtool3,uitoggletool1,uitoggletool2,uitoggletool3,uipushtool4);
global B1;B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName;
global path;
global ImageMenu;
global IlluminationMenu;
global FiltersMenu;
global NewMenu;
global Save_As_Menu;
global uipushtool1;
global uipushtool3;
global uitoggletool1;
global uitoggletool2; 
global uitoggletool3;
global uipushtool4;

[FileName,path]=uigetfile('*.*','Open Image');

%if(FileName == '*.*')
axes(handles.axes1);
hold(handles.axes1,'off');
%hold(handles.axes1,'on');
imshow(fullfile(path,FileName));
%hold(handles.axes1,'off');
axes(handles.axes3);
%hold(handles.axes3,'on');
hold(handles.axes3,'off');
imshow(fullfile(path,FileName));
%%hold(handles.axes3,'off');
menuActive(ImageMenu,IlluminationMenu,FiltersMenu,NewMenu,Save_As_Menu,uipushtool1,uipushtool3,uitoggletool1,uitoggletool2,uitoggletool3,uipushtool4);
%end

global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function SaveMenu_Callback(hObject, eventdata, handles)
% hObject    handle to SaveMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global impath;
% global FileName;
% global path;
% impath= String.Concat(path,FileName);
% imwrite(impath,'jpg');
% --------------------------------------------------------------------
function Save_As_Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Save_As_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imsave(handles.axes1);

global B1;B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --------------------------------------------------------------------
function About_Program_Callback(hObject, eventdata, handles)
% hObject    handle to About_Program (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('This package is a an image editor where you can apply many functions on your image and save the result The package was designed by Open-minded team  year 2010  Faculty of Computers and Information Fayoum University','About Program','help','modal')
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
% --------------------------------------------------------------------
function About_Us_Callback(hObject, eventdata, handles)
% hObject    handle to About_Us (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('Open-Minded team, 4th year, 2010 contact us at : www.open-minded.com','About Us','help','modal')
global B1;  B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Histogram_Matching_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram_Matching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B1; B1=handles.pushbutton1; 
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%global panel13;
global Image;
global gui;
gui=4;
Image = getimage(handles.axes1);
%setappdata(0,'Image_gui1',getimage(handles.axes1));
%set(0,'CurrentFigure',HistogramMatching);

%set(panel13,'Title','Histogram Matching');
%set(B5,'Enable','on');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

global flag_new_figure;
flag_new_figure = 3;
HistogramMatching;

% --------------------------------------------------------------------
function Equalization_Callback(hObject, eventdata, handles)
% hObject    handle to Equalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);

round = Equalization(Image);
[r,c,n]=size(Image);
for l=1:n
for i=1:r
    for j=1:c
        new(i,j,l) = round(1,(Image(i,j,l)+1));
    end
end
end
Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function gamma_Correction_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_Correction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel5;
global t8;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
global Flag;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
set(panel5,'title','Gamma Options');
set(t8,'String','Gamma');
Flag=6;
%set(B5,'Enable','off');
GammaActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Log_Callback(hObject, eventdata, handles)
% hObject    handle to Log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);
new=logfun(Image);
Image=new;
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
% --------------------------------------------------------------------
function Calculations_Callback(hObject, eventdata, handles)
% hObject    handle to Calculations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B1;  B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global panel13;
global Image;
global gui;
gui=3;
Image = getimage(handles.axes1);
setappdata(0,'Image_gui1',getimage(handles.axes1));
set(0,'CurrentFigure',Callculations);

%set(panel13,'Title','Calculations');
%set(B5,'Enable','on');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

global flag_new_figure;
flag_new_figure = 2;

Callculations;

% --------------------------------------------------------------------
function Quantization_Callback(hObject, eventdata, handles)
% hObject    handle to Quantization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global B3;
global E10;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7; 
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
%global B5; B5=handles.pushbutton5;

%set(B5,'Enable','off');
QuantizationActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);
filterDisActive(B2,E8,E9);

% --------------------------------------------------------------------
function B_C_Callback(hObject, eventdata, handles)
% hObject    handle to B_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1; 
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global panel13;
global Image;
global gui;
gui=2;

Image = getimage(handles.axes1);
setappdata(0,'Image_gui1',getimage(handles.axes1));
set(0,'CurrentFigure',BrightnessContrast);

%set(panel13,'Title','Brightness/Contrast');
%set(B5,'Enable','on');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

global flag_new_figure;
flag_new_figure = 1;
BrightnessContrast;
% --------------------------------------------------------------------
function Negative_Callback(hObject, eventdata, handles)
% hObject    handle to Negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);
new=negative(Image);
Image=new;
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1; 
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function G_S_Callback(hObject, eventdata, handles)
% hObject    handle to G_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);
new=Gray(Image);
Image=new;
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1; 
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Single_Callback(hObject, eventdata, handles)
% hObject    handle to Single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel5;
global t8;
global Flag;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7; 
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;

set(panel5,'title','Single Retinex Options');
set(t8,'String','Segma');
Flag=7;

%set(B5,'Enable','off');
GammaActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
% --------------------------------------------------------------------
function Multi_Callback(hObject, eventdata, handles)
% hObject    handle to Multi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel5;
global t8;
global Flag;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7; 
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
set(panel5,'title','Multi Retinex Options');
set(t8,'String','Num of Segma');
Flag=8;

%set(B5,'Enable','off');
GammaActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Convert_to_Ferquency_Callback(hObject, eventdata, handles)
% hObject    handle to Convert_to_Ferquency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);
global I;
global R;

[new,R,I]=Convert_to_Ferquency(Image);
Image=new;
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1;  B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
global Convert_to_Spat;
global Convert_to_Ferq;
Convert_to_Spat=handles.Convert_to_Spatial;
Convert_to_Ferq=handles.Convert_to_Ferquency;
set(Convert_to_Spat,'Enable','on');
set(Convert_to_Ferq,'Enable','off');

% --------------------------------------------------------------------
function Convert_to_Spatial_Callback(hObject, eventdata, handles)
% hObject    handle to Convert_to_Spatial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
global R;
ft=ifftshift(R +i*I);
ft2=ifft2(ft);
Image=uint8(ft2);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

global Convert_to_Spat;
global Convert_to_Ferq;
Convert_to_Spat=handles.Convert_to_Spatial;
Convert_to_Ferq=handles.Convert_to_Ferquency;
set(Convert_to_Spat,'Enable','off');
set(Convert_to_Ferq,'Enable','on');

% --------------------------------------------------------------------
function Max_Callback(hObject, eventdata, handles)
% hObject    handle to Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6;
global t9;
global t10;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=3;
set(panel6,'title','Maximum Mask Options');
set(t9,'String','Mask Size');
set(t10,'visible','off');
set(E9,'visible','off');
%set(B5,'Enable','off');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);
% --------------------------------------------------------------------
function Min_Callback(hObject, eventdata, handles)
% hObject    handle to Min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global t10;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=4;

set(panel6,'title','Minimum Mask Options');
set(t9,'String','Mask Size');
set(t10,'visible','off');
set(E9,'visible','off');
%set(B5,'Enable','off');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function Median_Callback(hObject, eventdata, handles)
% hObject    handle to Median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6;
global t9;
global t10;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1; B1=handles.pushbutton1; 
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=5;
set(panel6,'title','Median Mask Options');
set(t9,'String','Mask Size');
set(t10,'visible','off');
set(E9,'visible','off');
%set(B5,'Enable','off');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function E_Horizontal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to E_Horizontal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);


hor_mask=[ 1 2 1; 0 0 0 ;-1 -2 -1];
new=linear_filter(Image,hor_mask);
new=norm(new);

Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);


% --------------------------------------------------------------------
function E_Vertical_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to E_Vertical_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Image;
Image = getimage(handles.axes1);

ver_mask=[1 0 -1;2 0 2; 1 0 -1];
new=linear_filter(Image,ver_mask);
new=norm(new);

Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');

global B1; B1=handles.pushbutton1; 
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function E_Right_Diagonal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to E_Right_Diagonal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);

posDio_mask=[2 1 0; 1 0 -1 ;0 -1 -2];
new=linear_filter(Image,posDio_mask);
new=norm(new);

axes(handles.axes1);
Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');

global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function E_Left_Diagonal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to E_Left_Diagonal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Image;
Image = getimage(handles.axes1);

negDio_mask=[0 1 2; -1 0 1; -2 -1 0];
new=linear_filter(Image,negDio_mask);
new=norm(new);

Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function S_Horizontal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to S_Horizontal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);


hor_mask=[0 1 0; 0 1 0; 0 -1 0];
new=linear_filter(Image,hor_mask);
new=norm(new);

Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function S_Vertical_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to S_Vertical_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);


ver_mask=[0 0 0; 1 1 -1 ; 0 0 0];
new=linear_filter(Image,ver_mask);
new=norm(new);

Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function S_Right_Diagonal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to S_Right_Diagonal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);

posDio_mask=[1 0 0; 0 1 0; 0 0 -1];
new=linear_filter(Image,posDio_mask);
new=norm(new);

axes(handles.axes1);
Image=uint8(new);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function S_Left_Diagonal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to S_Left_Diagonal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Image;
Image = getimage(handles.axes1);

negDio_mask=[0 0 1; 0 1 0; -1 0 0];
new=linear_filter(Image,negDio_mask);
new=norm(new);

Image=uint8(new);
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Box_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Box_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global t10;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=1;
set(panel6,'title','Box Mask Options');
set(t9,'String','Mask Size');
set(t10,'visible','off');
set(E9,'visible','off');
%set(B5,'Enable','off');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function Weighted_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Weighted_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t10;
global t9;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=2;
%set(B5,'Enable','off');
set(panel6,'title','Weighted Mask Options');
set(t10,'visible','off');
set(E9,'visible','off');
set(t9,'String','Segma');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);
% --------------------------------------------------------------------
function Mid_Point_Callback(hObject, eventdata, handles)
% hObject    handle to Mid_Point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10; 
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=13;
set(panel6,'title','Mid-point Mask Options');
set(t9,'String','Mask Size');
%set(B5,'Enable','off');
filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function Salt_And_Pepper_Callback(hObject, eventdata, handles)
% hObject    handle to Salt_And_Pepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);
noiseImg= imnoise(Image,'salt & pepper');
Image=noiseImg;
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Gaussian_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
Image = getimage(handles.axes1);
noiseImg= imnoise(Image,'gaussian',0.02);
Image=noiseImg;
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function Uniform_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Uniform_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Periodic_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Periodic_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Gamma_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Gamma_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Exponential_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Exponential_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Rayleigh_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Rayleigh_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function R_M_One_Order_Callback(hObject, eventdata, handles)
% hObject    handle to R_M_One_Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel4; panel4= handles.uipanel4;
global B1;  B1=handles.pushbutton1; % resize 
global E1;  E1=handles.edit1; % resize
global E2; % resize
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5;
global resize_flag ;
resize_flag = 3;
set(panel4,'title','Reverse.Map.(One-Order)');
resizeActive(B1,E1,E2);
%set(B5,'Enable','off');
GammaDisActive(B4,E7);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function By_Factor_Callback(hObject, eventdata, handles)
% hObject    handle to By_Factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global panel4; panel4= handles.uipanel4;
global B1;  B1=handles.pushbutton1; % resize
global E1;  E1=handles.edit1;% resize
global E2; % resize
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5;
global resize_flag ;
resize_flag = 1 ;
set(panel4,'title','Direct.Map.(By Factor)');
resizeActive(B1,E1,E2);
%set(B5,'Enable','off');
GammaDisActive(B4,E7);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);


% --------------------------------------------------------------------
function D_M_One_Order_Callback(hObject, eventdata, handles)
% hObject    handle to D_M_One_Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel4; panel4= handles.uipanel4;
global B1;  B1=handles.pushbutton1;% resize
global E1;  E1=handles.edit1;% resize
global E2; % resize
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5;
global resize_flag ;
resize_flag = 2 ;
set(panel4,'title','Direct.Map.(One-Order)');
resizeActive(B1,E1,E2);
%set(B5,'Enable','off');
GammaDisActive(B4,E7);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function H_Gaussian_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to H_Gaussian_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=9;
%set(B5,'Enable','off');
set(panel6,'title','Gaussian Options');
set(t9,'String','D0');
set(t10,'visible','off');
set(E9,'visible','off');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function H_Butter_Worth_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to H_Butter_Worth_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global Flag;
global t10;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10; 
global B1;  B1=handles.pushbutton1;
global E1;  E1=handles.edit1; 
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=10;
%set(B5,'Enable','off');
set(panel6,'title','Butter worth Filter Options');
set(t9,'String','D0');
set(t10,'visible','on');
set(E9,'visible','on');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);


% --------------------------------------------------------------------
function Geomtric_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Geomtric_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6;
global t9;
global t10;
global B2;
global E8;
global E9;
global Flag;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10; 
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
%set(B5,'Enable','off');
set(t9,'String','Mask Size');
set(t10,'visible','off');
set(panel6,'title','Geometric Mask Options');
set(E9,'visible','off');
Flag=11;

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);
% --------------------------------------------------------------------
function L_Gaussian_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to L_Gaussian_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=6;
%set(B5,'Enable','off');
set(panel6,'title','Gaussian Options');
set(t9,'String','D0');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function L_Butter_Worth_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to L_Butter_Worth_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global t10;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1;  B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=7;
%set(B5,'Enable','off');
set(panel6,'title','Butter worth Filter Options');
set(t9,'String','D0');
set(t10,'visible','on');
set(E9,'visible','on');

filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function H_Ideal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to H_Ideal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global panel6; 
global t9;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1;  B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=12;
set(panel6,'title','Ideal Filter Options');
set(t9,'String','D0');
%set(B5,'Enable','off');
filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --------------------------------------------------------------------
function L_Ideal_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to L_Ideal_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global panel6; 
global t9;
global Flag;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
global B1;  B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;
%global B5; B5=handles.pushbutton5;
Flag=8;
set(panel6,'title','Ideal Filter Options');
set(t9,'String','D0');
%set(B5,'Enable','off');
filterActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
resizeDisActive(B1,E1,E2);
GammaDisActive(B4,E7);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
global E10;
Image = getimage(handles.axes1);
Bit=get(handles.edit10,'string');
Bit=str2num(Bit);
new=Quant(Image,Bit);
axes(handles.axes1);
Image=new;
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Image);
%hold(handles.axes1,'off');
set(E10,'String','');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
global E7;

Image = getimage(handles.axes1);

global Flag;
if(Flag==6) 
    G=get(handles.edit7,'string');
    G=str2num(G);
    new=Gamma(Image,G);
    axes(handles.axes1);
    Image=new;
    axes(handles.axes1);
    %hold(handles.axes1,'on');
    hold(handles.axes1,'off');
    imshow(Image);
    %hold(handles.axes1,'off');
    set(E7,'String','');
elseif(Flag==7)
    Segma=get(handles.edit7,'string');
    Segma=str2num(Segma);
    new=SSR(Image,Segma);
    Image=uint8(new);
    axes(handles.axes1);
    %hold(handles.axes1,'on');
    hold(handles.axes1,'off');
    imshow(Image);
    %hold(handles.axes1,'off');
    set(E7,'String','');
elseif(Flag==8)
    N=get(handles.edit7,'string');
    N=str2num(N);
    new=MSR(Image,N);
    Image=uint8(new);
    axes(handles.axes1);
    %hold(handles.axes1,'on');
    hold(handles.axes1,'off');
    imshow(Image);
    %hold(handles.axes1,'off');
    set(E7,'String','');

end

% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ImageMenu;
global IlluminationMenu;
global FiltersMenu;
global NewMenu;
global Save_As_Menu;
global uipushtool1;
global uipushtool3;
global uitoggletool1;
global uitoggletool2; 
global uitoggletool3;
global uipushtool4;

Im=imread('image.jpg');
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(Im);
%hold(handles.axes1,'off');
axes(handles.axes3);
%hold(handles.axes3,'on');
hold(handles.axes3,'off');
imshow(Im);
%hold(handles.axes3,'off');
menuDisActive(ImageMenu,IlluminationMenu,FiltersMenu,NewMenu,Save_As_Menu,uipushtool1,uipushtool3,uitoggletool1,uitoggletool2,uitoggletool3,uipushtool4);
global B1;B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);
% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FileName;
global path;
global ImageMenu;
global IlluminationMenu;
global FiltersMenu;
global NewMenu;
global Save_As_Menu;
global uipushtool1;
global uipushtool3;
global uitoggletool1;
global uitoggletool2; 
global uitoggletool3;
global uipushtool4;

[FileName,path]=uigetfile('*.*','Open Image');

%if(FileName == '*.*')
axes(handles.axes1);
%hold(handles.axes1,'on');
hold(handles.axes1,'off');
imshow(fullfile(path,FileName));
%hold(handles.axes1,'off');
axes(handles.axes3);
%hold(handles.axes3,'on');
hold(handles.axes3,'off');
imshow(fullfile(path,FileName));
%hold(handles.axes3,'off');
menuActive(ImageMenu,IlluminationMenu,FiltersMenu,NewMenu,Save_As_Menu,uipushtool1,uipushtool3,uitoggletool1,uitoggletool2,uitoggletool3,uipushtool4);
%end


global B1; B1=handles.pushbutton1;
global E1; E1=handles.edit1;
global E2; E2=handles.edit2;
global B2; B2=handles.pushbutton2;
global E8; E8=handles.edit8;
global E9; E9=handles.edit9;
global B3; B3=handles.pushbutton3;
global E10;E10=handles.edit10;
%global B5; B5=handles.pushbutton5;
global B4; B4=handles.pushbutton4;
global E7; E7=handles.edit7;

%set(B5,'Enable','off');
GammaDisActive(B4,E7);
resizeDisActive(B1,E1,E2);
filterDisActive(B2,E8,E9);
QuantizationDisActive(B3,E10);

% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imsave(handles.axes1);
% --------------------------------------------------------------------
function uipushtool4_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('This package is a an image editor where you can apply many functions on your image and save the result The package was designed by Open-minded team  year 2010  Faculty of Computers and Information Fayoum University','About Program','help','modal')


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image;
global gui;
switch gui
    case 2
Image= getappdata(0,'Image_gui2');
axes(handles.axes1);
imshow(Image);
    case 3
Image= getappdata(0,'Image_gui3');
axes(handles.axes1);
imshow(Image);
    case 4
Image= getappdata(0,'Image_gui4');
axes(handles.axes1);
imshow(Image);
        
        
end


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ImageMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ImageMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function IlluminationMenu_Callback(hObject, eventdata, handles)
% hObject    handle to IlluminationMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function FiltersMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FiltersMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Adjustment_Callback(hObject, eventdata, handles)
% hObject    handle to Adjustment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Resize_Callback(hObject, eventdata, handles)
% hObject    handle to Resize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function D_Mapping_Callback(hObject, eventdata, handles)
% hObject    handle to D_Mapping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function R_Mapping_Callback(hObject, eventdata, handles)
% hObject    handle to R_Mapping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function retinex_Callback(hObject, eventdata, handles)
% hObject    handle to retinex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Spatial_Domain_Callback(hObject, eventdata, handles)
% hObject    handle to Spatial_Domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Frequency_Domain_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency_Domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function S_Bluring_Callback(hObject, eventdata, handles)
% hObject    handle to S_Bluring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function S_Sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to S_Sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Edge_Detection_Callback(hObject, eventdata, handles)
% hObject    handle to Edge_Detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function S_Non_Linear_Masks_Callback(hObject, eventdata, handles)
% hObject    handle to S_Non_Linear_Masks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Add_Noise_Callback(hObject, eventdata, handles)
% hObject    handle to Add_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function F_Bluring_Callback(hObject, eventdata, handles)
% hObject    handle to F_Bluring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function B_Low_Pass_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to B_Low_Pass_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function B_High_Pass_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to B_High_Pass_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function F_Sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to F_Sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sh_Low_Pass_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Sh_Low_Pass_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Sh_High_Pass_Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Sh_High_Pass_Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function F_Non_Linear_Masks_Callback(hObject, eventdata, handles)
% hObject    handle to F_Non_Linear_Masks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


