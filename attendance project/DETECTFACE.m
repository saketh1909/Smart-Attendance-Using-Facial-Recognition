%function [] = DETECTFACE(conn,cn)  
%conn = database ('name of the database' , 'root ', 'pwd');

FDetect = vision.CascadeObjectDetector;
FDetect.MergeThreshold=4;
%cam = webcam('Integrated Webcam');
 %I =(snapshot(cam));
 I=imread('C:\Users\Wazeed\Desktop\attendance project\imagesource\testgirls.jpeg');
 %I=imresize(I,0.2);
 
 %%store snapshot for validation if required!
 BB = step(FDetect,I);
 out=insertObjectAnnotation(I,'rectangle',BB,'','LineWidth',3);
 
 imshow(out);
  %hold on
  %{
    for faces = 1:size(BB,1)
        rectangle('Position',BB(faces,:),'LineWidth',1,'LineStyle','-','EdgeColor','b');
        
        K= imcrop(I,BB(faces,:));   
        
        J=rgb2gray(K);        
        J=imresize(J,0.5); 
        %figure(3);
        subplot(2,2,faces);
        
        imshow(J);
        %imshow(J);
        %save J6.pgm J;
        %RECOGNIZE(J,K,conn,cn);
    end
 %}