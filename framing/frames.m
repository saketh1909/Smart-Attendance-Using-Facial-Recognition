vid = VideoReader('C:\Users\Wazeed\Desktop\WhatsApp Video 2018-04-23 at 12.42.27 PM.mp4');
 numFrames = vid.NumberOfFrames;
 n=numFrames;
 for i = 1:2:n
 framed = read(vid,i);
 imwrite(framed,['Image' int2str(i), '.jpg']);
 im(i)=image(framed);
 end