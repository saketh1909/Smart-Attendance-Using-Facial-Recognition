% Get all text files in the current folder
files = dir('*.jpg');
% Loop through each file 
for id = 1:length(files)
    % Get the file name 
    [~, f,ext] = fileparts(files(id).name);
    sid=int2str(id);
    rename2 = replace(f,f,sid);
    renamed = strcat(rename2,'',ext) ; 
    movefile(files(id).name, renamed); 
end