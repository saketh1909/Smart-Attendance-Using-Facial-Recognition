clc;
clear all;
close all;
%%
cd unprocesseddata
%%

%%
rm=0;
a = dir('*.jpg');
n = size(a);
for i= 1:n
    path = sprintf('%d.jpg',i);
    I=imread(path);
    I=I+50;
    %I=imresize(I,0.2);
    %imshow(a);
    detect=vision.CascadeObjectDetector;
    detect.MergeThreshold=5;
    bbox=step(detect,I);
    pause(2);
    out=insertObjectAnnotation(I,'rectangle',bbox,'','LineWidth',10);
    imshow(out);
%{ 
for i = 1:size(bbox,1)
    J= imcrop(a,bbox(i,:)); 
    figure(3),subplot(6,6,i);
    imshow(J); 
    end
 %}
    cd ../
    cd croppedfaces
    for k = 1 : size(bbox, 1)
        face=I+50;
        face=rgb2gray(face);
        face = imcrop(face, bbox(k, :)); 
    
% subplot(6, 6, k);
    
  face=imresize(face,[112,92]);
  rm=rm+size(bbox,1);
  thisFileName = sprintf('%d.jpg', k+rm);
 % fullFileName = fullfile(pwd, thisFileName);
  imwrite(face, thisFileName);
    end
    cd ../
    cd unprocesseddata
end

