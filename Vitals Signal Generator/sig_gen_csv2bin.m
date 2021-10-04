function [] = sig_gen_csv2bin(file_name)

if nargin<1
    button = questdlg('Please choose:','csv2bin file (from signal generator)','Convert a whole folder','Convert a single file','Convert a single file');
    if strcmp(button,'Convert a single file')
        [file_name,local_dir]=uigetfile('*.csv');
        if local_dir==0
            fprintf('A directory wasn''t chosen\n');
            return;
        else
            cd(local_dir);
            L=1;
        end
    elseif strcmp(button,'Convert a whole folder')
        local_dir=uigetdir;
        if local_dir==0
            fprintf('A directory wasn''t chosen\n');
            return;
        else
            cd(local_dir);
            files = dir([local_dir,'\*.csv']);
            L=length(files);
            if L==1
                file_name = files(1).name;
            end
        end
    else
        return;
    end
%if providing a file name as a parameter    
else
    L=1;
end

for mm=1:L
    if L>1
        file_name = files(mm).name;
    end
    sig_csv = csvread(file_name);
    sig_bin = sig_csv(1:end-1)-300;
    sig_bin = sig_bin - median(sig_bin)+2^23;
    
    save_name=strrep(file_name,'.csv','.bin');
    fid=fopen(save_name,'wb');
    fwrite(fid,sig_bin,'int32');
    fclose(fid);
end
