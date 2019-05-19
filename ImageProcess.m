function varargout = ImageProcess(varargin)
% IMAGEPROCESS MATLAB code for ImageProcess.fig
%      IMAGEPROCESS, by itself, creates a new IMAGEPROCESS or raises the existing
%      singleton*.
%
%      H = IMAGEPROCESS returns the handle to a new IMAGEPROCESS or the handle to
%      the existing singleton*.
%
%      IMAGEPROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEPROCESS.M with the given input arguments.
%
%      IMAGEPROCESS('Property','Value',...) creates a new IMAGEPROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageProcess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageProcess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageProcess

% Last Modified by GUIDE v2.5 19-May-2019 16:50:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageProcess_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageProcess_OutputFcn, ...
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


% --- Executes just before ImageProcess is made visible.
function ImageProcess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageProcess (see VARARGIN)

% Choose default command line output for ImageProcess
handles.output = hObject;
set(handles.axes1,'visible','off');
set(handles.axes2,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageProcess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageProcess_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function filt_Callback(hObject, eventdata, handles)
% hObject    handle to filt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
axes(handles.axes2);
I=rgb2gray(im);
k1=filter2(fspecial('average',3),I)/255;          %����3*3ģ��ƽ���˲�
imshow(k1);

% --------------------------------------------------------------------
function medfilt_Callback(hObject, eventdata, handles)
% hObject    handle to medfilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
axes(handles.axes2);
I=rgb2gray(im);
k1=medfilt2(I); 
imshow(k1);


% --------------------------------------------------------------------
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
axes(handles.axes2);
I=rgb2gray(im);
I1=imbinarize(I);
H=fspecial('sobel');     %ѡ��sobel���� 
J=filter2(H,I1);            %�������
imshow(J);

% --------------------------------------------------------------------
function image_reversion_Callback(hObject, eventdata, handles)
% hObject    handle to image_reversion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
J=double(im);
J=-J+(256-1);                 %ͼ��ת���Ա任
H=uint8(J);
axes(handles.axes2);
imshow(H);	

% --------------------------------------------------------------------
function Linear_transform_Callback(hObject, eventdata, handles)
% hObject    handle to Linear_transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
I1=rgb2gray(im);
J=imadjust(I1,[0.1 0.5],[]); %�ֲ����죬��[0.1 0.5]�ڵĻҶ�����Ϊ[0 1]
axes(handles.axes2);
imshow(J);	

% --------------------------------------------------------------------
function imhist_Callback(hObject, eventdata, handles)
% hObject    handle to imhist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
I1=rgb2gray(im);
imhist(I1);
J=histeq(I1);
axes(handles.axes2);
imshow(J);


% --------------------------------------------------------------------
function file_open_Callback(hObject, eventdata, handles)
% hObject    handle to file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'ѡ��ͼ��');
str=[pathname filename];
global im
im = imread(str);  
imshow(im);	


% --------------------------------------------------------------------
function file_save_Callback(hObject, eventdata, handles)
% hObject    handle to file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.gif','GIF(*.gif)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes2);
    imwrite(h.cdata,[PathName,FileName]);
end;

