% Get all text files in the current folder
%cd classifyset
folder = dir;
for i = 1:length(folder)

    path='C:\Users\Wazeed\Desktop\fix\PROJECT\preprocesstestsamples\processingtrainingdatasampling\classifyset\';
    m=strcat(path,num2str(i));
    cd(m)
 
    files = dir('*.jpg');
% Loop through each file 
    for id = 1:length(files)
    % Get the file name 
    [~, f,ext] = fileparts(files(id).name);
    sid=int2str(id);
    rename2 = replace(f,f,sid);
    ext='.pgm';
    renamed = strcat('',rename2,ext) ; 
    movefile(files(id).name, renamed); 
    end
    cd ../
end
 