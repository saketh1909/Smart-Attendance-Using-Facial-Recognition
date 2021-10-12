img = imread('C:\Users\Wazeed\Desktop\fix\s.jpg');
img=imresize(img,0.25);
thisFileName = sprintf('ess.jpg');
 % fullFileName = fullfile(pwd, thisFileName);
  imwrite(img, thisFileName);
