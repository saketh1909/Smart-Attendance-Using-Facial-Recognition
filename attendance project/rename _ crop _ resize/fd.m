clc;
clear all;
close all;
FDetect = vision.CascadeObjectDetector;
FDetect.MergeThreshold = 4;
%cam = webcam('Logitech HD Webcam C270');
 %  I = snapshot(cam);
   
files = dir('*.jpg');
len=length(files);
for id = 1:length(files)
    sid=int2str(id);
    iname=strcat(sid,'.jpg');
I = imread(iname);
I= imresize(I,0.5);
BB = step(FDetect,I);
%figure,
%imshow(I);
hold on
for face = 1:size(BB,1)
   % rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','r');
     J= imcrop(I,BB(face,:));
    % figure(2);
     subplot(1,55,id);
     imshow(J);
     path = sprintf('w%d.jpg',id);
     imwrite(J,path);
    %imageDB{i}=J
    
end
pause(1);

hold off;
end
