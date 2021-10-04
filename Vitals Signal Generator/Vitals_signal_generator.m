function varargout = Vitals_signal_generator(varargin)
% VITALS_SIGNAL_GENERATOR M-file for Vitals_signal_generator.fig
%      VITALS_SIGNAL_GENERATOR, by itself, creates a new VITALS_SIGNAL_GENERATOR or raises the existing
%      singleton*.
%
%      H = VITALS_SIGNAL_GENERATOR returns the handle to a new VITALS_SIGNAL_GENERATOR or the handle to
%      the existing singleton*.
%
%      VITALS_SIGNAL_GENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VITALS_SIGNAL_GENERATOR.M with the given input arguments.
%
%      VITALS_SIGNAL_GENERATOR('Property','Value',...) creates a new VITALS_SIGNAL_GENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Vitals_signal_generator_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Vitals_signal_generator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Vitals_signal_generator

% Last Modified by GUIDE v2.5 12-Aug-2013 18:03:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Vitals_signal_generator_OpeningFcn, ...
    'gui_OutputFcn',  @Vitals_signal_generator_OutputFcn, ...
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


% --- Executes just before Vitals_signal_generator is made visible.
function Vitals_signal_generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Vitals_signal_generator (see VARARGIN)

% Choose default command line output for Vitals_signal_generator
handles.output = hObject;
if ispc
    set(handles.file_path,'String','C:\Data')
elseif isunix
    cd ~
    s=pwd;
    set(handles.file_path,'String',s)
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Vitals_signal_generator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Vitals_signal_generator_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Pulse_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to Pulse_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pulse_ratio as text
%        str2double(get(hObject,'String')) returns contents of Pulse_ratio as a double


% --- Executes during object creation, after setting all properties.
function Pulse_ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pulse_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RR_Callback(hObject, eventdata, handles)
% hObject    handle to RR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RR as text
%        str2double(get(hObject,'String')) returns contents of RR as a double


% --- Executes during object creation, after setting all properties.
function RR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Resp_Amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to Resp_Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Resp_Amplitude as text
%        str2double(get(hObject,'String')) returns contents of Resp_Amplitude as a double


% --- Executes during object creation, after setting all properties.
function Resp_Amplitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Resp_Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RR_tolerance_Callback(hObject, eventdata, handles)
% hObject    handle to RR_tolerance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RR_tolerance as text
%        str2double(get(hObject,'String')) returns contents of RR_tolerance as a double


% --- Executes during object creation, after setting all properties.
function RR_tolerance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RR_tolerance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Respiration_template.
function Respiration_template_Callback(hObject, eventdata, handles)
% hObject    handle to Respiration_template (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns Respiration_template contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Respiration_template


% --- Executes during object creation, after setting all properties.
function Respiration_template_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Respiration_template (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Noise_Amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to Noise_Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Noise_Amplitude as text
%        str2double(get(hObject,'String')) returns contents of Noise_Amplitude as a double


% --- Executes during object creation, after setting all properties.
function Noise_Amplitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Noise_Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function signal_duration_Callback(hObject, eventdata, handles)
% hObject    handle to signal_duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of signal_duration as text
%        str2double(get(hObject,'String')) returns contents of signal_duration as a double


% --- Executes during object creation, after setting all properties.
function signal_duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to signal_duration (see GCBO)
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RR=str2double(get(handles.RR,'String'));
RR_step=str2double(get(handles.RR_step,'String'));
RR_final=str2double(get(handles.RR_final,'String'));
Resp_Amplitude=str2double(get(handles.Resp_Amplitude,'String'));
RR_tolerance=str2double(get(handles.RR_tolerance,'String'));
RR_tolerance_perc=str2double(get(handles.RR_tolerance_perc,'String'));
if (~isnan(RR_tolerance) && ~isnan(RR_tolerance_perc))
    errordlg('Fill only one field for tolerance');
    return
elseif (isnan(RR_tolerance) && isnan(RR_tolerance_perc))
    errordlg('Fill only one field for tolerance');
    return
end
% HR0=str2num(get(handles.HR,'String'));  %Must stay str2num to convert arrays
HR0=str2double(get(handles.HR,'String'));
HR0_step=str2double(get(handles.HR_step,'String'));
HR0_final=str2double(get(handles.HR_final,'String'));
if get(handles.radiobutton_ratio,'Value')
    ratio=str2double(get(handles.Pulse_ratio,'String'));
    Pulse_Amplitude=round(Resp_Amplitude/ratio);
    set(handles.Pulse_Amplitude,'String',num2str(Pulse_Amplitude));
else
    Pulse_Amplitude=str2double(get(handles.Pulse_Amplitude,'String'));
end
pulse_method=get(handles.pulse_method_popup,'Value');

Noise_Amplitude=str2double(get(handles.Noise_Amplitude,'String'));
template_ind=get(handles.Respiration_template,'Value');
signal_duration=str2double(get(handles.signal_duration,'String'));
save_file=get(handles.save_file,'Value');

if ~isnan(HR0_step) && ~isnan(HR0_final)
    if HR0_final>HR0
        HR0tmp=HR0:abs(HR0_step):HR0_final;
    else
        HR0tmp=HR0:-abs(HR0_step):HR0_final;
    end
else
    HR0tmp=HR0;
end

if ~isnan(RR_step) && ~isnan(RR_final)
    if RR_final>RR
        RRtmp=RR:abs(RR_step):RR_final;
    else
        RRtmp=RR:-abs(RR_step):RR_final;
    end
else
    RRtmp=RR;
end

if save_file,
    file_path=get(handles.file_path,'String');
    if ~exist(file_path,'dir'),
        mkdir(file_path);
    end
    file_prefix=get(handles.file_prefix,'String');
    contents = get(handles.file_extension,'String');
    file_suffix=contents{get(handles.file_extension,'Value')};
    contents = get(handles.Respiration_template,'String');
    template_name=contents{get(handles.Respiration_template,'Value')};
    %     file_suffix=get(handles.file_extension,'String');
    save_name='save'; %the exact name will be set later
else
    save_name='';
end

save_RRmeans=get(handles.save_RRmeans,'Value'); %if==1, the 1 minute means of the simulated RR will be calculated
merge_all=get(handles.Merge_all,'Value'); %if==1, merge all the signals according to order
if merge_all==1
    ttt_merge=[];
    sigsig_merge=[];
    RRall_merge.per_peak_duration=[];
    RRall_merge.RR_1min_means=[];
end
for n=1:length(RRtmp)
    for k=1:length(HR0tmp)
        if ~isnan(RR_tolerance_perc)
            RR_tolerance_disp=[num2str(RR_tolerance_perc),'p'];
            RR_tolerance = RRtmp(n)*RR_tolerance_perc/100;
        else
            RR_tolerance_disp=num2str(RR_tolerance);
        end
        if ~isempty(save_name)
            if get(handles.ShortName,'Value')==1 %6.6.13 if==1: save name with less details so it can run on the compiled algorithm...
                save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(n)),'HR',num2str(HR0tmp(k)),file_suffix];
            else
                save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            end
        else
        end
        set(handles.save_name,'String',save_name)
        BL_wander=get(handles.BL_wander,'Value');
        [ttt,sigsig,RRall]=simulate_HR_RR(HR0tmp(k),Pulse_Amplitude,RRtmp(n),Resp_Amplitude,RR_tolerance,template_ind,Noise_Amplitude,signal_duration,save_name,save_RRmeans,merge_all,BL_wander,pulse_method);

        if merge_all==1
            if isempty(ttt_merge)
                tend=0;
            else
                tend=ttt_merge(end);
            end
            ttt_merge=[ttt_merge;ttt+tend];
            if isempty(sigsig_merge)
                sig_end=0;
            else
                sig_end=sigsig_merge(end);
            end
            sigsig=sigsig-(sigsig(1)-sig_end); %2.7.13 bug fix
            sigsig_merge=[sigsig_merge;sigsig];
            RRall_merge.per_peak_duration=[RRall_merge.per_peak_duration;RRall.per_peak_duration];
            RRall_merge.RR_1min_means=[RRall_merge.RR_1min_means;RRall.RR_1min_means];
        end
    end
end

if merge_all==1
    ttt=ttt_merge;
    sigsig=sigsig_merge;
    RRall=RRall_merge;
    if ~isempty(save_name) % saving a single file with all merged signals
        if get(handles.ShortName,'Value')==1 %6.6.13 if==1: save name with less details so it can run on the compiled algorithm...
            if n>1 && k==1
            save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'HR',num2str(HR0tmp(k)),file_suffix];
            elseif n==1 && k>1
            save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(n)),'HR',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),file_suffix];
            elseif n>1 && k>1 %the merge order in this case: for each RR all the HRs are merged, and so on
             save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'HR',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),file_suffix];
            end
        else
            if n>1 && k==1
            save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            elseif n==1 && k>1
            save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            elseif n>1 && k>1 %the merge order in this case: for each RR all the HRs are merged, and so on
            save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            end
        end
        set(handles.save_name,'String',save_name)
        if isequal(save_name(end-3:end),'.bin'),
            %         save_name = 'C:\Data\tal.bin';
            %         disp('override file name');
            fid=fopen(save_name,'wb');
            fwrite(fid,sigsig,'int32');
            fclose(fid);
            if save_RRmeans
                save([save_name(1:end-4),'RRmeans'],'RRall')
            end
        elseif isequal(save_name(end-3:end),'.csv'),
            fid=fopen(save_name,'wt');
            fprintf(fid,'%.0f,',sigsig-min(sigsig)+300);
            fprintf(fid,'%.0f\n',sigsig(end)-min(sigsig)+300); 
            fclose(fid);
            save_name=strrep(save_name,'.csv','.bin');
            fid=fopen(save_name,'wb');
            fwrite(fid,sigsig(:),'int32');
            fclose(fid);
            %         csvwrite(save_name,round(sigsig+2^23));
            if save_RRmeans
                save([save_name(1:end-4),'RRmeans'],'RRall')
            end
        else
            disp('Not recognized file extension - File not saved!!!')
        end
    end
end
plot(ttt,sigsig);
xlabel(gca,'Time [sec]');
ylabel(gca,'Signal');
xlim(gca,[ttt(1),min(600,ttt(end))]);

function Pulse_Amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to Pulse_Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pulse_Amplitude as text
%        str2double(get(hObject,'String')) returns contents of Pulse_Amplitude as a double


% --- Executes during object creation, after setting all properties.
function Pulse_Amplitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pulse_Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HR_Callback(hObject, eventdata, handles)
% hObject    handle to HR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HR as text
%        str2double(get(hObject,'String')) returns contents of HR as a double


% --- Executes during object creation, after setting all properties.
function HR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_path_Callback(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_path as text
%        str2double(get(hObject,'String')) returns contents of file_path as a double

% --- Executes during object creation, after setting all properties.
function file_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_prefix_Callback(hObject, eventdata, handles)
% hObject    handle to file_prefix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_prefix as text
%        str2double(get(hObject,'String')) returns contents of file_prefix as a double


% --- Executes during object creation, after setting all properties.
function file_prefix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_prefix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_extension_Callback(hObject, eventdata, handles)
% hObject    handle to file_extension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_extension as text
%        str2double(get(hObject,'String')) returns contents of file_extension as a double


% --- Executes during object creation, after setting all properties.
function file_extension_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_extension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in done_button.
function done_button_Callback(hObject, eventdata, handles)
% hObject    handle to done_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq;


% --- Executes on button press in save_file.
function save_file_Callback(hObject, eventdata, handles)
% hObject    handle to save_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of save_file

if get(hObject,'Value'),
    set(handles.text_path,'Enable','on')
    set(handles.file_path,'Enable','on')
    set(handles.text_prefix,'Enable','on')
    set(handles.file_prefix,'Enable','on')
    set(handles.text_suffix,'Enable','on')
    set(handles.file_extension,'Enable','on')
else
    set(handles.text_path,'Enable','off')
    set(handles.file_path,'Enable','off')
    set(handles.text_prefix,'Enable','off')
    set(handles.file_prefix,'Enable','off')
    set(handles.text_suffix,'Enable','off')
    set(handles.file_extension,'Enable','off')
end


% --- Executes on button press in radiobutton_ratio.
function radiobutton_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject,'Value'),
    set(handles.Pulse_ratio,'Enable','on')
    set(handles.Pulse_Amplitude,'Enable','off')
else
    set(handles.Pulse_ratio,'Enable','off')
    set(handles.Pulse_Amplitude,'Enable','on')
end


% --- Executes on button press in radiobutton_abs.
function radiobutton_abs_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_abs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject,'Value'),
    set(handles.Pulse_ratio,'Enable','off')
    set(handles.Pulse_Amplitude,'Enable','on')
else
    set(handles.Pulse_ratio,'Enable','on')
    set(handles.Pulse_Amplitude,'Enable','off')
end




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over file_path.
function file_path_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


lcd=uigetdir('C:\Data');
if lcd~=0,
    set(handles.file_path,'String',lcd)
end



function HR_step_Callback(hObject, eventdata, handles)
% hObject    handle to HR_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HR_step as text
%        str2double(get(hObject,'String')) returns contents of HR_step as a double


% --- Executes during object creation, after setting all properties.
function HR_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HR_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HR_final_Callback(hObject, eventdata, handles)
% hObject    handle to HR_final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HR_final as text
%        str2double(get(hObject,'String')) returns contents of HR_final as a double


% --- Executes during object creation, after setting all properties.
function HR_final_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HR_final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function RR_final_Callback(hObject, eventdata, handles)
% hObject    handle to RR_final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RR_final as text
%        str2double(get(hObject,'String')) returns contents of RR_final as a double


% --- Executes during object creation, after setting all properties.
function RR_final_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RR_final (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RR_step_Callback(hObject, eventdata, handles)
% hObject    handle to RR_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RR_step as text
%        str2double(get(hObject,'String')) returns contents of RR_step as a double


% --- Executes during object creation, after setting all properties.
function RR_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RR_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in ShortName.
function ShortName_Callback(hObject, eventdata, handles)
% hObject    handle to ShortName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ShortName





function RR_tolerance_perc_Callback(hObject, eventdata, handles)
% hObject    handle to RR_tolerance_perc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RR_tolerance_perc as text
%        str2double(get(hObject,'String')) returns contents of RR_tolerance_perc as a double


% --- Executes during object creation, after setting all properties.
function RR_tolerance_perc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RR_tolerance_perc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in save_RRmeans.
function save_RRmeans_Callback(hObject, eventdata, handles)
% hObject    handle to save_RRmeans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of save_RRmeans




% --- Executes on button press in Merge_all.
function Merge_all_Callback(hObject, eventdata, handles)
% hObject    handle to Merge_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Merge_all




% --- Executes on button press in pb_adv_merge.
function pb_adv_merge_Callback(hObject, eventdata, handles)
% hObject    handle to pb_adv_merge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB 
% handles    structure with handles and user data (see GUIDATA)
DATA=getappdata(handles.figure1,'DATA'); %get DATA
if isempty(DATA)
    DATA.merge_list=[];
    DATA.merged_sig=[];
    DATA.merged_RRall.per_peak_duration=[];
    DATA.merged_RRall.RR_1min_means=[];
    DATA.merge_count=0;
    DATA.save_name_tmp=[];
    DATA.fid=[];
    DATA.fid1=[];
    DATA.fid2=[];
end
setappdata(handles.figure1,'DATA',DATA); 
if get(handles.Merge_all,'Value')==0;
    set(handles.Merge_all,'Value',1);
end
RR=str2double(get(handles.RR,'String'));
RR_step=str2double(get(handles.RR_step,'String'));
RR_final=str2double(get(handles.RR_final,'String'));
Resp_Amplitude=str2double(get(handles.Resp_Amplitude,'String'));
RR_tolerance=str2double(get(handles.RR_tolerance,'String'));
RR_tolerance_perc=str2double(get(handles.RR_tolerance_perc,'String'));
if (~isnan(RR_tolerance) && ~isnan(RR_tolerance_perc))
    errordlg('Fill only one field for tolerance');
    return
elseif (isnan(RR_tolerance) && isnan(RR_tolerance_perc))
    errordlg('Fill one of the tolerance fields');
    return
end
% HR0=str2num(get(handles.HR,'String'));  %Must stay str2num to convert arrays
HR0=str2double(get(handles.HR,'String'));
HR0_step=str2double(get(handles.HR_step,'String'));
HR0_final=str2double(get(handles.HR_final,'String'));
if get(handles.radiobutton_ratio,'Value')
    ratio=str2double(get(handles.Pulse_ratio,'String'));
    Pulse_Amplitude=round(Resp_Amplitude/ratio);
    set(handles.Pulse_Amplitude,'String',num2str(Pulse_Amplitude));
else
    Pulse_Amplitude=str2double(get(handles.Pulse_Amplitude,'String'));
end
pulse_method=get(handles.pulse_method_popup,'Value');
Noise_Amplitude=str2double(get(handles.Noise_Amplitude,'String'));
template_ind=get(handles.Respiration_template,'Value');
signal_duration=str2double(get(handles.signal_duration,'String'));
save_file=get(handles.save_file,'Value');

if ~isnan(HR0_step) && ~isnan(HR0_final)
    if HR0_final>HR0
        HR0tmp=HR0:abs(HR0_step):HR0_final;
    else
        HR0tmp=HR0:-abs(HR0_step):HR0_final;
    end
else
    HR0tmp=HR0;
end

if ~isnan(RR_step) && ~isnan(RR_final)
    if RR_final>RR
        RRtmp=RR:abs(RR_step):RR_final;
    else
        RRtmp=RR:-abs(RR_step):RR_final;
    end
else
    RRtmp=RR;
end

if save_file,
    file_path=get(handles.file_path,'String');
    if ~exist(file_path,'dir'),
        mkdir(file_path);
    end
    file_prefix=get(handles.file_prefix,'String');
    contents = get(handles.file_extension,'String');
    file_suffix=contents{get(handles.file_extension,'Value')};
    contents = get(handles.Respiration_template,'String');
    template_name=contents{get(handles.Respiration_template,'Value')};
    %     file_suffix=get(handles.file_extension,'String');
    save_name='save'; %the exact name will be set later
else
    save_name='';
end

save_RRmeans=get(handles.save_RRmeans,'Value'); %if==1, the 1 minute means of the simulated RR will be calculated
merge_all=get(handles.Merge_all,'Value'); %if==1, merge all the signals according to order
if merge_all==1
    ttt_merge=[];
    sigsig_merge=[];
    RRall_merge.per_peak_duration=[];
    RRall_merge.RR_1min_means=[];
end
for n=1:length(RRtmp)
    for k=1:length(HR0tmp)
        if ~isnan(RR_tolerance_perc)
            RR_tolerance_disp=[num2str(RR_tolerance_perc),'p'];
            RR_tolerance = RRtmp(n)*RR_tolerance_perc/100;
        else
            RR_tolerance_disp=num2str(RR_tolerance);
        end
        if ~isempty(save_name)
            if get(handles.ShortName,'Value')==1 %6.6.13 if==1: save name with less details so it can run on the compiled algorithm...
                save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(n)),'HR',num2str(HR0tmp(k)),file_suffix];
            else
                save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            end
        else
        end
        set(handles.save_name,'String',save_name)
        BL_wander=get(handles.BL_wander,'Value');
        [ttt,sigsig,RRall]=simulate_HR_RR(HR0tmp(k),Pulse_Amplitude,RRtmp(n),Resp_Amplitude,RR_tolerance,template_ind,Noise_Amplitude,signal_duration,save_name,save_RRmeans,merge_all,BL_wander,pulse_method);
        
        if merge_all==1
            if isempty(ttt_merge)
                tend=0;
            else
                tend=ttt_merge(end);
            end
            ttt_merge=[ttt_merge;ttt+tend];
            if isempty(sigsig_merge)
                sig_end=0;
            else
                sig_end=sigsig_merge(end);
            end
            sigsig=sigsig-(sigsig(1)-sig_end);
            sigsig_merge=[sigsig_merge;sigsig];
            RRall_merge.per_peak_duration=[RRall_merge.per_peak_duration;RRall.per_peak_duration];
            RRall_merge.RR_1min_means=[RRall_merge.RR_1min_means;RRall.RR_1min_means];
        end
    end
end

if merge_all==1
    ttt=ttt_merge;
    sigsig=sigsig_merge;
    RRall=RRall_merge;
    if ~isempty(save_name) % saving a single file with all merged signals
        if get(handles.ShortName,'Value')==1 %6.6.13 if==1: save name with less details so it can run on the compiled algorithm...
            if n>1 && k==1
            save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'HR',num2str(HR0tmp(k)),file_suffix];
            elseif n==1 && k>1
            save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(n)),'HR',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),file_suffix];
            elseif n>1 && k>1 %the merge order in this case: for each RR all the HRs are merged, and so on
             save_name=[file_path,filesep,file_prefix,template_name,'RR',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'HR',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),file_suffix];
            end
        else
            if n>1 && k==1
            save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            elseif n==1 && k>1
            save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            elseif n>1 && k>1 %the merge order in this case: for each RR all the HRs are merged, and so on
            save_name=[file_path,filesep,file_prefix,template_name,'_RR_',num2str(RRtmp(1)),'to',num2str(RRtmp(n)),'+-',RR_tolerance_disp,'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0tmp(1)),'to',num2str(HR0tmp(k)),'_',num2str(Pulse_Amplitude),'_Noise_',num2str(Noise_Amplitude),'_Duration_',num2str(signal_duration),file_suffix];
            end
        end
        set(handles.save_name,'String',save_name)
    end
end
plot(ttt,sigsig);
xlabel(gca,'Time [sec]');
ylabel(gca,'Signal');
xlim(gca,[ttt(1),min(600,ttt(end))]);

DATA.merge_count=DATA.merge_count+1;
DATA.merge_list{DATA.merge_count}={save_name};
if isempty(DATA.merged_sig)
    sig_end=0;
else
    sig_end=DATA.merged_sig(end);
end
sigsig=sigsig-(sigsig(1)-sig_end);
DATA.merged_sig=sigsig(end); %saving the last value for the next merge

% Save partial signal to file:
save_file=get(handles.save_file,'Value');

if save_file && ~isempty(DATA.save_name_tmp)
    if isequal(DATA.save_name_tmp(end-3:end),'.bin')
        fid=DATA.fid;
        fwrite(fid,sigsig,'int32');
    elseif isequal(DATA.save_name_tmp(end-3:end),'.csv'),
        fid1=DATA.fid1;
        fprintf(fid1,'%.0f,',sigsig-min(sigsig)+300);
%         fprintf(fid1,'%.0f\n',sigsig(end)-min(sigsig)+300);
        fid2=DATA.fid2;
        fwrite(fid2,sigsig(:),'int32');
    else
        disp('Not recognized file extension - File not saved!!!')
    end
end

if save_file && isempty(DATA.save_name_tmp)
    file_path=get(handles.file_path,'String');
    if ~exist(file_path,'dir'),
        mkdir(file_path);
    end
    file_prefix=get(handles.file_prefix,'String');
    contents = get(handles.file_extension,'String');
    file_suffix=contents{get(handles.file_extension,'Value')};
    current_time=strrep(datestr(now),' ','_');
    current_time=strrep(current_time,':','');
    current_time=strrep(current_time,'-',''); % so no overwriting will occur
    save_name=[file_path,filesep,file_prefix,'Adv_merge_tmp_',current_time,file_suffix];
    DATA.save_name_tmp=save_name;

    if isequal(file_suffix,'.bin')
        fid=fopen(save_name,'wb');
        fwrite(fid,sigsig,'int32');
        DATA.fid=fid;
    elseif isequal(save_name(end-3:end),'.csv'),
        fid1=fopen(save_name,'wt');
        fprintf(fid1,'%.0f,',sigsig-min(sigsig)+300);
%         fprintf(fid1,'%.0f\n',sigsig(end)-min(sigsig)+300);
        save_name=strrep(save_name,'.csv','.bin');
        fid2=fopen(save_name,'wb');
        fwrite(fid2,sigsig(:),'int32');
        DATA.fid1=fid1;
        DATA.fid2=fid2;
    else
        disp('Not recognized file extension - File not saved!!!')
    end    
else
    save_name='';
end

%

DATA.merged_RRall.per_peak_duration=[DATA.merged_RRall.per_peak_duration; RRall.per_peak_duration];
DATA.merged_RRall.RR_1min_means=[DATA.merged_RRall.RR_1min_means; RRall.RR_1min_means];
set(handles.adv_merge_text,'String',[num2str(DATA.merge_count),' added to merge. Choose next settings']);
set(handles.pb_adv_merge,'String','Add & continue');
set(handles.pb_Done_merge,'Enable','on');
setappdata(handles.figure1,'DATA',DATA);  %update DATA

% --- Executes on button press in pb_Done_merge.
function pb_Done_merge_Callback(hObject, eventdata, handles)
% hObject    handle to pb_Done_merge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DATA=getappdata(handles.figure1,'DATA');
DATA.merge_list=DATA.merge_list';
setappdata(handles.figure1,'DATA',DATA);
% ttt=DATA.merged_t;
sigsig=DATA.merged_sig;
save_file=get(handles.save_file,'Value');
if save_file,
    file_path=get(handles.file_path,'String');
    if ~exist(file_path,'dir'),
        mkdir(file_path);
    end
    file_prefix=get(handles.file_prefix,'String');
    contents = get(handles.file_extension,'String');
    file_suffix=contents{get(handles.file_extension,'Value')};
    %     contents = get(handles.Respiration_template,'String');
    %     template_name=contents{get(handles.Respiration_template,'Value')};
    current_time=strrep(datestr(now),' ','_');
    current_time=strrep(current_time,':','');
    current_time=strrep(current_time,'-',''); % so no overwriting will occur
    save_name=[file_path,filesep,file_prefix,'Adv_merge_',num2str(DATA.merge_count),'_different_settings_',current_time,file_suffix];
else
    save_name='';
end

set(handles.save_name,'String',save_name);
if save_file
    if isequal(file_suffix,'.bin')
        fclose(DATA.fid);
        movefile(DATA.save_name_tmp,save_name);
        save([save_name(1:end-4),'DATA'],'DATA');
    elseif isequal(save_name(end-3:end),'.csv'),
        fprintf(DATA.fid1,'%.0f\n',sigsig(end)-min(sigsig)+300);
        fclose(DATA.fid1);
        fclose(DATA.fid2);
        movefile(DATA.save_name_tmp,save_name);
        save_name=strrep(save_name,'.csv','.bin');
        movefile(strrep(DATA.save_name_tmp,'.csv','.bin'),save_name);
        save([save_name(1:end-4),'DATA'],'DATA');
    else
        disp('Not recognized file extension - File not saved!!!');
    end
end

% for plotting entire signal:
if ~isempty(DATA.fid)
    fid=fopen(save_name,'r');
    sigsig=fread(fid,'int32');
    fclose(fid);
elseif ~isempty(DATA.fid2)
    fid=fopen(save_name,'r');
    sigsig=fread(fid,'int32');
    fclose(fid);
end
ttt=(1:length(sigsig))/240;
plot(ttt,sigsig);
xlabel(gca,'Time [sec]');
ylabel(gca,'Signal');
xlim(gca,[ttt(1),min(600,ttt(end))]);


set(handles.pb_adv_merge,'String','Advanced merge');
set(handles.pb_Done_merge,'Enable','off');
set(handles.adv_merge_text,'String','');
DATA=[]; %initialize for next run
setappdata(handles.figure1,'DATA',DATA); 


% --- Executes on button press in BL_wander.
function BL_wander_Callback(hObject, eventdata, handles)
% hObject    handle to BL_wander (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of BL_wander




% --- Executes on selection change in pulse_method_popup.
function pulse_method_popup_Callback(hObject, eventdata, handles)
% hObject    handle to pulse_method_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns pulse_method_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pulse_method_popup


% --- Executes during object creation, after setting all properties.
function pulse_method_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pulse_method_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


