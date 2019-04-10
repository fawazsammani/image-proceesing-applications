function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 29-Apr-2018 22:57:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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
global I_rgb;
[filename pathname]=uigetfile({'*.jpg'; '*.png'}, 'Browse File');
fullpath=strcat(pathname,filename);
I_rgb=imread(fullpath);
axes(handles.axes1)
imshow(I_rgb);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_rgb I_gray
I_gray=rgb2gray(I_rgb);
axes(handles.axes2)
imshow(I_gray);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_gray I_bw
I_bw=im2bw(I_gray, graythresh(I_gray));
axes(handles.axes3)
imshow(I_bw);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_gray I_histeq
I_histeq=histeq(I_gray);
axes(handles.axes4)
imshow(I_histeq)

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_gray
axes(handles.axes5)
imhist(I_gray);



% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_histeq
axes(handles.axes6)
imhist(I_histeq)



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_gray 
ocrResult=ocr(I_gray);
OCRtext=ocrResult.Text;
set(handles.text2, 'String', OCRtext)

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global squarese
squarese=get(hObject, 'Value');

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global diskse
diskse=get(hObject, 'Value');

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global diamondse
diamondse=get(hObject, 'Value');

% --- Executes on selection change in pop1.
function pop1_Callback(hObject, eventdata, handles)
% hObject    handle to pop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop1
global sesize
sesize=get(handles.pop1, 'value');

% --- Executes during object creation, after setting all properties.
function pop1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sesize squarese diskse diamondse I_gray
if squarese==1 && sesize==2
    se=strel('square', 3);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
elseif squarese==1 && sesize==3
    se=strel('square', 4);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
elseif squarese==1 && sesize==4
    se=strel('square', 5);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
elseif diskse==1 && sesize==2
    se=strel('disk', 3);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
elseif diskse==1 && sesize==3
    se=strel('disk', 4);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
elseif diskse==1 && sesize==4
    se=strel('disk', 5);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
elseif diamondse==1 && sesize==2
    se=strel('diamond', 3);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
 elseif diamondse==1 && sesize==3
    se=strel('diamond', 4);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
    elseif diamondse==1 && sesize==4
    se=strel('diamond', 5);
    I_erosion=imerode(I_gray, se);
    axes(handles.axes7)
    imshow(I_erosion)
end
       
% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sesize squarese diskse diamondse I_gray
if squarese==1 && sesize==2
    se=strel('square', 3);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
elseif squarese==1 && sesize==3
    se=strel('square', 4);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
elseif squarese==1 && sesize==4
    se=strel('square', 5);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
elseif diskse==1 && sesize==2
    se=strel('disk', 3);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
elseif diskse==1 && sesize==3
    se=strel('disk', 4);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
elseif diskse==1 && sesize==4
    se=strel('disk', 5);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
elseif diamondse==1 && sesize==2
    se=strel('diamond', 3);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
 elseif diamondse==1 && sesize==3
    se=strel('diamond', 4);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
    elseif diamondse==1 && sesize==4
    se=strel('diamond', 5);
    I_dilation=imdilate(I_gray, se);
    axes(handles.axes8)
    imshow(I_dilation)
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sesize squarese diskse diamondse I_gray
if squarese==1 && sesize==2
    se=strel('square', 3);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
elseif squarese==1 && sesize==3
    se=strel('square', 4);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
elseif squarese==1 && sesize==4
    se=strel('square', 5);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
elseif diskse==1 && sesize==2
    se=strel('disk', 3);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
elseif diskse==1 && sesize==3
    se=strel('disk', 4);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
elseif diskse==1 && sesize==4
    se=strel('disk', 5);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
elseif diamondse==1 && sesize==2
    se=strel('diamond', 3);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
 elseif diamondse==1 && sesize==3
    se=strel('diamond', 4);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
    elseif diamondse==1 && sesize==4
    se=strel('diamond', 5);
    I_open=imopen(I_gray, se);
    axes(handles.axes9)
    imshow(I_open)
end

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sesize squarese diskse diamondse I_gray
if squarese==1 && sesize==2
    se=strel('square', 3);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
elseif squarese==1 && sesize==3
    se=strel('square', 4);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
elseif squarese==1 && sesize==4
    se=strel('square', 5);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
elseif diskse==1 && sesize==2
    se=strel('disk', 3);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
elseif diskse==1 && sesize==3
    se=strel('disk', 4);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
elseif diskse==1 && sesize==4
    se=strel('disk', 5);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
elseif diamondse==1 && sesize==2
    se=strel('diamond', 3);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
 elseif diamondse==1 && sesize==3
    se=strel('diamond', 4);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
    elseif diamondse==1 && sesize==4
    se=strel('diamond', 5);
    I_close=imclose(I_gray, se);
    axes(handles.axes10)
    imshow(I_close)
end

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_bw
I3=imcomplement(I_bw);
L = bwlabel(I3,4);
numofobjects=max(max(L))
set(handles.text5, 'String', numofobjects)
axes(handles.axes11)
s = regionprops(L, 'Centroid');
imshow(I_bw)
hold on
for k = 1:numel(s)
    c = s(k).Centroid;
    text(c(1), c(2), sprintf('%d', k), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle');
end
hold off

% --- Executes on selection change in pop2.
function pop2_Callback(hObject, eventdata, handles)
% hObject    handle to pop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop2
global I_gray
edgetype=get(handles.pop2, 'value');
if edgetype==2
    I_canny=edge(I_gray, 'canny');
    axes(handles.axes15)
    imshow(I_canny)
elseif edgetype==3
    I_prewitt=edge(I_gray, 'prewitt');
    axes(handles.axes15)
    imshow(I_prewitt)
elseif edgetype==4
    I_sobel=edge(I_gray, 'sobel');
    axes(handles.axes15)
    imshow(I_sobel)
end
    
    


% --- Executes during object creation, after setting all properties.
function pop2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullpath1image
[filename pathname]=uigetfile({'*.jpg'; '*.png'}, 'Browse First Image');
fullpath1=strcat(pathname,filename);
fullpath1image=imread(fullpath1);
axes(handles.axes13)
imshow(fullpath1image)

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullpath1image
[filename pathname]=uigetfile({'*.jpg'; '*.png'}, 'Browse Second Image');
fullpath2=strcat(pathname,filename);
image1_bw=im2bw(fullpath1image, graythresh(fullpath1image));
image2=imread(fullpath2);
axes(handles.axes14)
imshow(image2);
image2_bw=im2bw(image2, graythresh(image2));
if size(image1_bw)==size(image2_bw)
c=xor(image1_bw,image2_bw);
res=nnz(c);
if res==0
    set(handles.text8, 'String', 'Identical QR Codes');
    image1_bg=uint8(255*image1_bw);
    image2_bg=uint8(255*image2_bw);
    ssimval = ssim(image2_bg, image1_bg);
    set(handles.text10, 'String', ssimval) 
else
    set(handles.text8, 'String', 'Not Identical QR Codes');
    image1_bg=uint8(255*image1_bw);
    image2_bg=uint8(255*image2_bw);
    ssimval = ssim(image2_bg, image1_bg);
    set(handles.text10, 'String', ssimval)
end
else
    set(handles.text8, 'String', '');
    warndlg('Image Sizes are not Same. Second Image will be resized. Observe Structure Similarity', 'Warning')
    image2_new=imresize(image2_bw, size(image1_bw), 'bicubic');
    image1_bg=uint8(255*image1_bw);
    image2_bg=uint8(255*image2_new);
    ssimval = ssim(image2_bg, image1_bg);
    set(handles.text10, 'String', ssimval) 
end
    
    
    
% --- Executes on selection change in pop3.
function pop3_Callback(hObject, eventdata, handles)
% hObject    handle to pop3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop3
global I_rgb resizetype I_bilinear I_bicubic I_nearest
resizetype=get(handles.pop3, 'value');
if resizetype==2
    I_bilinear = imresize(I_rgb,2,'bilinear');
    axes(handles.axes16)
    imshow(I_bilinear)
elseif resizetype==3
    I_bicubic=imresize(I_rgb,2,'bicubic');
    axes(handles.axes16)
    imshow(I_bicubic)
elseif resizetype==4
    I_nearest=imresize(I_rgb,2,'nearest');
    axes(handles.axes16)
    imshow(I_nearest)
end

% --- Executes during object creation, after setting all properties.
function pop3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I_gray I_rgb I_noise I_noise_rgb
I_noise=imnoise(I_gray,'gaussian', 0.05);
axes(handles.axes17)
imshow(I_noise)
I_noise_rgb=imnoise(I_rgb, 'gaussian',0.05);
axes(handles.axes20)
imshow(I_noise_rgb)



% --- Executes on selection change in pop4.
function pop4_Callback(hObject, eventdata, handles)
% hObject    handle to pop4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop4
global I_noise I_noise_rgb I_gray I_rgb
filtertype=get(handles.pop4, 'value');
if filtertype==2
    h_average=fspecial('average',3);
    Imean=imfilter(I_noise, h_average);
    [peaksnr, snr] = psnr(Imean,I_gray);
    axes(handles.axes18)
    imshow(Imean)
    set(handles.text17, 'String', snr)
    set(handles.text22, 'String', peaksnr)
    
elseif filtertype==3
    Imedian2=medfilt2(I_noise);
    [peaksnr, snr] = psnr(Imedian2,I_gray);
    axes(handles.axes18)
    imshow(Imedian2)
    set(handles.text17, 'String', snr)
    set(handles.text22, 'String', peaksnr)
elseif filtertype==4
    Iwiener=wiener2(I_noise, [3 3]);
    [peaksnr, snr] = psnr(Iwiener,I_gray);
    axes(handles.axes18)
    imshow(Iwiener)
    set(handles.text17, 'String', snr)
    set(handles.text22, 'String', peaksnr)
elseif filtertype==5
    Igaussian2=imgaussfilt(I_noise);
    [peaksnr, snr] = psnr(Igaussian2,I_gray);
     axes(handles.axes18)
    imshow(Igaussian2)
    set(handles.text17, 'String', snr)
    set(handles.text22, 'String', peaksnr)
elseif filtertype==6
    Iguided=imguidedfilter(I_noise_rgb);
    [peaksnr, snr] = psnr(Iguided,I_rgb);
    axes(handles.axes18)
    imshow(Iguided)
    set(handles.text17, 'String', snr)
    set(handles.text22, 'String', peaksnr)
elseif filtertype==7
    Imedian3=medfilt3(I_noise_rgb);
    [peaksnr, snr] = psnr(Imedian3,I_rgb);
    axes(handles.axes18)
    imshow(Imedian3)
    set(handles.text17, 'String', snr)
    set(handles.text22, 'String', peaksnr)
elseif filtertype==8
    Igassian3=imgaussfilt3(I_noise_rgb);
    [peaksnr, snr] = psnr(Igassian3,I_rgb);
    axes(handles.axes18)
    imshow(Igassian3)
    set(handles.text17, 'String', snr)
    set(handles.text22, 'String', peaksnr)
end 
    
   


% --- Executes during object creation, after setting all properties.
function pop4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop5.
function pop5_Callback(hObject, eventdata, handles)
% hObject    handle to pop5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop5
global I_gray
degree=get(handles.pop5, 'value');
if degree==2
    I_gray_90 = imrotate(I_gray,90);
    axes(handles.axes19)
    imshow(I_gray_90)
elseif degree==3
    I_gray_180 = imrotate(I_gray,180);
    axes(handles.axes19)
    imshow(I_gray_180)
elseif degree==4
    I_gray_270 = imrotate(I_gray,270);
    axes(handles.axes19)
    imshow(I_gray_270)
end


% --- Executes during object creation, after setting all properties.
function pop5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global resizetype I_bilinear I_bicubic I_nearest
[file path]=uiputfile({'*.jpg'; '*.png'}, 'Save File');
fullname=strcat(path,file);
if resizetype==2
imwrite(I_bilinear,fullname);
elseif resizetype==3
imwrite(I_bicubic, fullname)
elseif resizetype==4
imwrite(I_nearest,fullname)
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
