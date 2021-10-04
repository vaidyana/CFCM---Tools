%OOR test
close all;
clear all;
clc;

Folder='C:\SENSORS\Hill Rom\Bench Test\Bench Test Algs Results 7_6_97H';
FileNameRR= 'sensig_20120304_123445_patient1_RR_45+-10p_125000_HR_170_25000_Noise_300_Duration_900_rr.mat';
FileNameHR='sensig_20120304_123445_patient1_RR_45+-10p_125000_HR_170_25000_Noise_300_Duration_900_hr.mat';
load ([Folder,'\',FileNameRR]); 
load ([Folder,'\',FileNameHR]); 
RRValues=rr_params.rr_dec;
HRValues=hr_params.hr_dec;
OORVecRR=zeros;
OORFlagRR=0;
OORVecHR=zeros;
OORFlagHR=0;
m=1;
n=8;
d=n*60*2;
k=1;
   while n<13
       for  d=n*60*2:((n+1)*60*2-1)
       if RRValues(d)>45
            OORVecRR(m)=1;
        else
            OORVecRR(m)=0;
       end
        if HRValues(d)>170
            OORVecHR(m)=1;
        else
            OORVecHR(m)=0;
        end
        m=m+1;
       end
       n=n+1;
   end

   for i=0:120:length(OORVecRR)-120
       OORSumRR=sum(OORVecRR(i+1:i+120));
       OORSumHR=sum(OORVecHR(i+1:i+120));
       if OORSumRR>60
           OORFlagRR(k)=1;
       else
           OORFlagRR(k)=0;
       end
       if OORSumHR>60
           OORFlagHR(k)=1;
       else
           OORFlagHR(k)=0;
       end
       k=k+1;
   end
   
