clc;
clear all;
close all;
%%
a=imread('C:\Users\Wazeed\Desktop\face\1.jpg');
%a=imresize(a,0.5);
imshow(a);
detect=vision.CascadeObjectDetector;
detect.MergeThreshold=5;
bbox=step(detect,a);
%out=insertObjectAnnotation(a,'rectangle',bbox,'','LineWidth',10);
imshow(out);
%{ 
for i = 1:size(bbox,1)
    J= imcrop(a,bbox(i,:)); 
    figure(3),subplot(6,6,i);
    imshow(J); 
    end
 %}

for k = 1 : size(bbox, 1)
  face = imcrop(a, bbox(k, :)); 
 face=face+50;
% subplot(6, 6, k);
face=rgb2gray(face);
  face=imresize(face,[112,92]);
  
  thisFileName = sprintf('%d.pgm', k);
 % fullFileName = fullfile(pwd, thisFileName);
  imwrite(face, thisFileName);
end

