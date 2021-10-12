function [] = DETECTFACE(conn,cn)  
%conn = database ('name of the database' , 'root ', 'pwd');

FDetect = vision.CascadeObjectDetector;
FDetect.MergeThreshold = 5;
%cam = VideoReader('C:\Users\Wazeed\Desktop\fix\PROJECT\preprocesstestsamples\testsamples\WhatsApp Video 2018-04-23 at 12.42.27 PM.mp4');
%n = cam.NumberOfFrames;
 %n=numFrames;
 %for i = 140:141
 %I = read(cam,i);
 %imshow(I);
I=imread('C:\Users\Wazeed\Desktop\fix\PROJECT\preprocesstestsamples\testsamples\1.jpg');

figure;
montage(I);
title('Test case');
 %imwrite(framed,['Image' int2str(i), '.jpg']);
 %im(i)=image(framed);
 conn = database('students_details','root','root');
query = sprintf('ALTER TABLE students ADD C%d int(2) NOT NULL',cn) ;
curs = exec(conn,query);
curs = fetch(curs);
curs.Data;
imshow(I);
%cam = webcam('HP Truevision HD');
%I =(snapshot(cam));
 %%store snapshot for validation if required!
 %I = imread('C:\Users\Wazeed\Desktop\WhatsApp Image 2018-04-23 at 11.02.09 AM.jpeg');
 %I=In+100;
% I=imresize(I,0.3);
 BB = step(FDetect,I);
 
 %BB = step(FDetect,I);
%figure,
%imshow(I);
  %hold on
    for faces = 1:size(BB,1)
        %rectangle('Position',BB(faces,:),'LineWidth',3,'LineStyle','-','EdgeColor','b');
        J= imcrop(I,BB(faces,:));  
       % J=rgb2gray(K);        
        %J=imresize(J,0.5); 
        %figure(3);
        %subplot(3,3,faces);
      %  imshow(J);
      J = J+ 50;
      J=rgb2gray(J); 
        J=imresize(J,[112,92]);
        path = sprintf('%d.pgm',faces);
       % disp(path);
        imwrite(J,path);
         
    renamed = strcat('C:\Users\Wazeed\Desktop\fix\PROJECT\test\',path) ; 
    movefile(path, renamed);
        %Untitled(conn,cn);
        %SimpleFaceRecognition(conn,cn);
        %pause(5);
        %imshow(J);
        %save J6.pgm J;
        %RECOGNIZE(J,K,conn,i);
    end
    SimpleFaceRecognition(conn,cn);
    cn =cn+1;
 
 %}
 end