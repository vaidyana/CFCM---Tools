function [] = sig_gen_bin2csv(file_name)

if nargin<1
    button = questdlg('Please choose: sensig for conversion (for "Tzabad")','bin2csv file ','Convert a whole folder','Convert a single file','Convert a single file');
    if strcmp(button,'Convert a single file')
        [file_name,local_dir]=uigetfile('*.bin');
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
            files = dir([local_dir,'\*.bin']);
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
    fid=fopen(file_name,'rb');
    sig_bin = fread(fid,inf,'int32');%8640000
    sigsig = sig_bin-2^23;
    fclose(fid);
             
    save_name=strrep(file_name,'.bin','.csv');
    fid=fopen(save_name,'wt');
    fprintf(fid,'%.0f,',sigsig-min(sigsig)+300);
    fprintf(fid,'%.0f\n',sigsig(end)-min(sigsig)+300);
    fclose(fid);
end
