function [ttt,sigsig,RRall]=simulate_HR_RR(HR0,Pulse_Amplitude,RR,Resp_Amplitude,RR_tolerance,template_ind,Noise_Amplitude,signal_duration,save_name,save_RRmeans,merge_all,BL_wander,pulse_method)
%
%
% HR0=80;
% Pulse_Amplitude=27143;
% RR=18;
% Resp_Amplitude=190000;
% template_ind=1;
% Noise_Amplitude=100;
% signal_duration=300;
% save_name='';
% save_RRmeans=0;
% merge_all=0;
% BL_wander=0;
% pulse_method=1;
% RR_tolerance=0.9; %for 5% RR tolerance



% % Synthesize biological signal
samp_rate=240.2;
% num_seconds=20;
% RR=15;      % simulated respiration rate
% Resp_Amplitude=150000;
% HR=70;      % simulated heart rate
% Pulse_Amplitude=13000;
%
% % Pulse2Respiration_ratio=Pulse_Amplitude/Resp_Amplitude;
% t=(1:(num_seconds*samp_rate))/samp_rate;
% f0=3.53+zeros(size(t))/100;
% f1=f0+(HR/60)+rand(size(t))/100;
% % f02=2.73;
% % f12=f02+(HR+7.234)/60;
% sig=(Resp_Amplitude*sin(2*pi*(RR/60)*t)+Pulse_Amplitude*(sin(2*pi*f0.*t)+0.9*sin(2*pi*f1.*t)))/3;%+Pulse_Amplitude*(sin(2*pi*f02*t)+0.9*sin(2*pi*f12*t)));
% sig=sig-min(sig);
%
% figure('units','normalized','position',[0.08,0.15,0.9,0.75])
% subplot(211);plot(t,sig)
% % subplot(212);pwelch(sig,[],[],[],240)
%
% sig=exp(((mod(t,3)-0.5).^2)/2);
% subplot(212);plot(t,sig)


% t=(1:round(1.867*samp_rate))/samp_rate;
% plot(t,1./((4-2.133-t).^7+((1-2.133-t)/1).^4))
if nargin<9,
    save_name='';
    save_RRmeans=0;
    merge_all=0;
elseif nargin<1,
    RR=18;      % simulated respiration rate
    RR_tolerance=0;
    Resp_Amplitude=25000;
    HR0=62;      % simulated heart rate
    Pulse_Amplitude=2511;
    signal_duration=600;
    save_name=['sensig_20120304_123445_RR_',num2str(RR),'+-',num2str(RR_tolerance),'_',num2str(Resp_Amplitude),'_HR_',num2str(HR0),'_',num2str(Pulse_Amplitude),'.bin'];
    save_RRmeans=0;
    merge_all=0;
    template_ind=1;
    Noise_Amplitude=300;
    BL_wander=1;
end


load breathing_cycle_template.mat
template=cycle_template(:,template_ind);
garbage_amp=1000; %5000 %%ola change to 1000

if RR==0 && HR0==0 %Patient out of bed...
    load Out_of_bed_template.mat
    RRall.per_peak_duration=0;
    RRall.RR_1min_means=0;
    Lsigsig=ceil((signal_duration*samp_rate)/length(Out_of_bed_template))*length(Out_of_bed_template);
    sigsig=NaN(Lsigsig,1); %initialization
    ttt=((1:length(sigsig))/samp_rate)';
    sigsig(1:length(Out_of_bed_template))=Out_of_bed_template;
    ttt_end=length(Out_of_bed_template)/samp_rate;     
    while ttt_end<=signal_duration %template is ~10 minutes long
        grand_delta=(sigsig(ind)-sigsig(1)) - (Out_of_bed_template(1)-Out_of_bed_template(end));
        delta=grand_delta/length(Out_of_bed_template);
        q=sigsig(ind) + Out_of_bed_template - Out_of_bed_template(1) - (delta:delta:grand_delta)';
%         q=sigsig(end) + Out_of_bed_template - Out_of_bed_template(1);
        sigsig(ind+1:ind+length(q))=q;
        ttt_end=sum(~isnan(sigsig))/samp_rate;
        ind=ind+length(q);
    end
    sigsig=sigsig(ttt<=signal_duration);
    ttt=ttt(ttt<=signal_duration);
    %AmpCorr = 5000*Resp_Amplitude/26513; 
    AmpCorr = Resp_Amplitude;%10.6.13
    if BL_wander==1
        g = generateGarbage(length(sigsig),AmpCorr); %10.6.13 adding baseline drift to the whole signal
    else
        g = 0;
    end
    sigsig=sigsig+g;
else
    if RR>70,
        disp('RR supported till 70 respiration per minute')
    else
        RR_cycle=60/RR;
        if RR_cycle>t(end)+1/samp_rate,
            garbage_time=RR_cycle-t(end);
            garbage_time_ind=round(garbage_time*samp_rate);
            %         duty_cycle=t(end)/RR_cycle;
            %         garbage=zeros(size(garbage)); %temp
            sig_garbage = generateGarbage(garbage_time_ind,garbage_amp); %check
            y_garbage = polyval([0.4*garbage_amp 0 0],((-floor(garbage_time_ind/2):(garbage_time_ind-floor(garbage_time_ind/2)-1))/samp_rate));
            sig_garbage=sig_garbage+y_garbage';
            %         temp_t=garbage_time*tt/tt(end);
            %         t_garbage=(1/samp_rate:(1/samp_rate):temp_t(end));
            %         sig_garbage=interp1(temp_t,garbage,t_garbage,'spline');
            sig_garbage=sig_garbage-(sig_garbage(1)-template(end)); %4.6.13 (matching the amplitudes of the template end and garbage start)
            sig=[template;sig_garbage];
            t_sig=(1:length(sig))/samp_rate;
        else
            temp_t=RR_cycle*t/t(end);
            t_sig=(1/samp_rate:(1/samp_rate):temp_t(end));
            sig=interp1(temp_t,template,t_sig,'spline');
        end
    end

    sig=Resp_Amplitude*(sig(:)-min(sig))/(max(sig)-min(sig))-(Resp_Amplitude/2);
    t_sig=t_sig(:);

    ttt_end=t_sig(end);
    Lsigsig=ceil(samp_rate*ceil(signal_duration/(60/(RR+RR_tolerance)))*(60/(RR+RR_tolerance)));
    sigsig=NaN(Lsigsig,1); % initialization
    ttt=((1:length(sigsig))/samp_rate)';
    ind=length(sig);
    sigsig(1:length(sig))=sig;
    last_RR=RR;
    Ltolerance_RR=ceil(signal_duration/((RR+RR_tolerance)/60)); %max number of RR waves
    tolerance_RR=NaN(Ltolerance_RR,1); %initialization
    tolerance_RR(1)=60/RR;
    n=1;
    start_ind=1;
    ttt_start=length(t_sig)/samp_rate;
    RR_1min_means=NaN(ceil(signal_duration/(60)),1); %initialization
    num_RRcycle=1;
    while ttt_end<signal_duration
        num_RRcycle=num_RRcycle+1;
        temp=last_RR+2*RR_tolerance*rand(1)-RR_tolerance;
        temp=max([temp,RR-RR_tolerance]);
        temp=min([temp,RR+RR_tolerance]);
        last_RR=temp;
        %         temp_t=(60/last_RR)*t_sig/t_sig(end);
        %         t_sig_m=(1/samp_rate:(1/samp_rate):temp_t(end))';
        %         temp_sig=(0.2*rand(1)+0.8)*interp1(temp_t,sig,t_sig_m,'spline');

        %adding "garbage" to each signal seperately (17.6.13 MLYD)
        RR_cycle=60/last_RR;
        if RR_cycle>t(end)+1/samp_rate,
            garbage_time=RR_cycle-t(end);
            garbage_time_ind=round(garbage_time*samp_rate);
            sig_garbage = generateGarbage(garbage_time_ind,garbage_amp);
            y_garbage = polyval([0.5*garbage_amp 0 0],((-floor(garbage_time_ind/2):(garbage_time_ind-floor(garbage_time_ind/2)-1))/samp_rate));
            sig_garbage=sig_garbage+y_garbage(:);
            sig_garbage=sig_garbage-(sig_garbage(1)-template(end)); %4.6.13 (matching the amplitudes of the template end and garbage start)
            temp_sig=[template;sig_garbage];
            temp_sig=(0.2*rand(1)+0.8)*Resp_Amplitude*(temp_sig(:)-min(temp_sig))/(max(temp_sig)-min(temp_sig))-(Resp_Amplitude/2);
            t_sig_m=(1:length(temp_sig))'/samp_rate;
        else
            temp_t=RR_cycle*t_sig/t_sig(end);
            t_sig_m=(1/samp_rate:(1/samp_rate):temp_t(end))';
            temp_sig=interp1(temp_t,sig,t_sig_m,'spline');
            temp_sig=(0.2*rand(1)+0.8)*Resp_Amplitude*(temp_sig(:)-min(temp_sig))/(max(temp_sig)-min(temp_sig))-(Resp_Amplitude/2);
        end
        %
        tolerance_RR(num_RRcycle)=(60/last_RR); %9.6.13 MLYD
%         ttt=[ttt;ttt(end)+t_sig_m(1:end-1)];
        %     temp_sig=(0.2*rand(1)+0.8)*sig;
        grand_delta=(sigsig(ind)-sigsig(1)) - (temp_sig(1)-temp_sig(end));
        delta=grand_delta/length(t_sig_m);
        q=sigsig(ind) + temp_sig - temp_sig(1) - (delta:delta:grand_delta)';
        sigsig(ind+1:ind+length(q))=q;
        ttt_end=sum(~isnan(sigsig))/samp_rate;
        if save_RRmeans && ttt_end>=60*n % calculating RR 1minute means
            start_RR_part=(ttt_start-60*(n-1))/tolerance_RR(start_ind);
            end_RR_part=(tolerance_RR(num_RRcycle)-(ttt_end-60*n))/tolerance_RR(num_RRcycle);
            RR_1min_means(n)=(start_RR_part+length(tolerance_RR((start_ind+1):(num_RRcycle-1)))+end_RR_part);
            n=n+1;
            start_ind=num_RRcycle;
            ttt_start=sum(~isnan(sigsig))/samp_rate;
        end
        ind=ind+length(q);
    end
    tolerance_RR=tolerance_RR(~isnan(tolerance_RR));
    RR_1min_means=RR_1min_means(~isnan(RR_1min_means));
    sigsig=sigsig(ttt<=signal_duration);
    ttt=ttt(ttt<=signal_duration);

    AmpCorr = 5000*Resp_Amplitude/26513; %10.6.13
    if BL_wander==1
        g = generateGarbage(length(sigsig),AmpCorr); %10.6.13 adding baseline drift to the whole signal
    else
        g = 0; %tmp (in no baseline drift is wanted)
    end
    sigsig=sigsig+g;



    % HR=60;
    % HR=(50:((60-50)/length(ttt)):60)';HR=HR(2:end);
    HR=HR0(1)+zeros(size(ttt));
    for r=2:length(HR0); HR(round((r-1)*length(HR)/length(HR0)):end)=HR0(r);end;
    % Pulse_Amplitude=Pulse_Amplitude*(1+0.05*sin(2*pi*RR/60*ttt)).*cos(2*pi*(HR/60/2).*ttt);
    Pulse_Amplitude=Pulse_Amplitude*(1+0.05*sin(2*pi*RR/60*ttt));
    A=Noise_Amplitude*rand(size(ttt));
    
    switch pulse_method
        case 1
            % sigsig=sigsig+Pulse_Amplitude.*(sin(2*pi*f0.*ttt)+A.*sin(2*pi*f1.*ttt));%+Pulse_Amplitude*(sin(2*pi*f02*t)+0.9*sin(2*pi*f12*t)));
            pulse_sig=combine_sines(ttt,HR);
%             sigsig=A+Resp_Amplitude*sin(2*pi*(RR/60).*ttt)+Pulse_Amplitude.*(sin(2*pi*f0.*ttt)+0.5*sin(2*pi*f1.*ttt)+0.3*sin(2*pi*f2.*ttt)+0.1*sin(2*pi*f3.*ttt)+0.05*sin(2*pi*f4.*ttt)+0.03*sin(2*pi*f5.*ttt)+0.01*sin(2*pi*f6.*ttt)+0.005*sin(2*pi*f7.*ttt)+0.003*sin(2*pi*f8.*ttt)+0.001*sin(2*pi*f9.*ttt))/2;
        case 2
            pulse_sig=combine_sines2(ttt,HR).*cos(2*pi*(HR/60).*ttt);
            pulse_sig=[pulse_sig(1);diff(pulse_sig)];
        case 3
            delta=prepare_delta_vector(samp_rate,ttt,HR0);
            pulse_temp=sinc(17.2397*(ttt-1.52));
            pulse_sig=pulse_temp;
            for r=1:(length(delta)-3),
                pulse_temp=es_leftshift(pulse_temp,pulse_temp(1:round(delta(r)+7*rand(1))));
                pulse_sig=pulse_sig+(1+rand(1)/10)*pulse_temp;
            end
            pulse_sig=local_avg(pulse_sig,23);
        case 4
            delta=prepare_delta_vector(samp_rate,ttt,HR0);
            % Create pulse template
            window=5; %seconds
            mid_template=round(window*samp_rate/2);
            template_t=(1:(2*mid_template-1))/samp_rate;
            pulse_template=(cos(2*pi*(1/(2*window))*(template_t(2:end)-template_t(mid_template))).^1).*diff(sinc(17.2397*(template_t-template_t(mid_template))));
            % Build pulse signal
            ttt_len=length(ttt);
            pulse_sig=zeros(ttt_len,1);
            % current_ind=0;%round(samp_rate/2);
            pulse_location=round(cumsum(delta));
            pulse_location=pulse_location+round(9*rand(length(pulse_location),1));  % Add some variability to inter-beat-interval
            pulse_location=pulse_location(pulse_location<=ttt_len);                 % make sure not to exceed time vector
            pulse_sig(pulse_location)=1+0.5*rand(length(pulse_location),1);         % Add some variability to pulse amplitude
            pulse_sig=same_conv(pulse_sig,pulse_template);
            pulse_sig=local_avg(pulse_sig,23,'han');
    end
    pulse_sig=(pulse_sig-mean(pulse_sig))/diff(tsprctile(pulse_sig,[98,2]))/2;
    sigsig=A+sigsig+Pulse_Amplitude.*pulse_sig;
    
     % plot(ttt,sigsig)
    RRall.per_peak_duration=tolerance_RR;
    RRall.RR_1min_means=RR_1min_means;   
end

if ~isempty(save_name) && merge_all==0
    if isequal(save_name(end-3:end),'.bin'),
        %         save_name = 'C:\Data\tal.bin';
        %         disp('override file name');
        fid=fopen(save_name,'wb');
        fwrite(fid,sigsig+2^23,'int32');
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
        fwrite(fid,sigsig+2^23,'int32');
        fclose(fid);
        %         csvwrite(save_name,round(sigsig+2^23));
        if save_RRmeans
            save([save_name(1:end-4),'RRmeans'],'RRall')
        end
    else
        disp('Not recognized file extension - File not saved!!!')
    end
end
% grand_delta=6000-(garbage(1)-garbage(end)); delta=grand_delta/length(tt);q=9000+garbage-garbage(1)-(delta:delta:grand_delta)';


%---------------------------------------------------------------------------
function c=combine_sines(ttt,HR)

f0=3.53;%+rand(size(ttt))/6000;%+zeros(size(ttt));
f1=f0+(HR/60);%+rand(size(ttt))/600;
f2=f0+2*(HR/60);%+rand(size(ttt))/600;
f3=f0+3*(HR/60);%+rand(size(ttt))/600;
f4=f0+4*(HR/60);%+rand(size(ttt))/600;
f5=f0+5*(HR/60);%+rand(size(ttt))/600;
f6=f0+6*(HR/60);%+rand(size(ttt))/600;
f7=f0+7*(HR/60);%+rand(size(ttt))/600;
f8=f0+8*(HR/60);%+rand(size(ttt))/600;
f9=f0+9*(HR/60);%+rand(size(ttt))/600;

c=(sin(2*pi*f0.*ttt)+0.5*sin(2*pi*f1.*ttt)+0.3*sin(2*pi*f2.*ttt)+0.1*sin(2*pi*f3.*ttt)+0.05*sin(2*pi*f4.*ttt)+0.03*sin(2*pi*f5.*ttt)+0.01*sin(2*pi*f6.*ttt)+0.005*sin(2*pi*f7.*ttt)+0.003*sin(2*pi*f8.*ttt)+0.001*sin(2*pi*f9.*ttt))/2;
%---------------------------------------------------------------------------
function c=combine_sines2(ttt,HR)

f0=3.53;%+rand(size(ttt))/6000;%+zeros(size(ttt));
r_max=ceil((17-f0)*60/min(HR));
c=sin(2*pi*f0.*ttt);
for r=1:r_max,
    f=f0+r*(HR/60);
%     f=f0+r*(HR/60)+rand(1);
%     c=c+((1.5+0.2*rand(1))^(-r))*sin(2*pi*f.*ttt)./(f.^1);
    c=c+((1.3+0.2*rand(1))^(-r))*sin(2*pi*f.*ttt)./f;
end


%---------------------------------------------------------------------------
function delta=prepare_delta_vector(samp_rate,ttt,HR0)
quota=samp_rate*ttt(end)/length(HR0);
delta=[];
for r=1:length(HR0),
    local_delta=60*samp_rate/HR0(r);
    delta=[delta;local_delta*ones(round(quota/local_delta),1)];
end