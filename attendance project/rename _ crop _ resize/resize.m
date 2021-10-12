for loop = 1:10
    name = sprintf('%d.jpg',loop);
    i = imread(name);
%imshow(i);
%pause(3);
i= imresize(i,[112,92]);
name = sprintf('%d.pgm',loop);
imwrite(i,name);
%imshow(i);
end

