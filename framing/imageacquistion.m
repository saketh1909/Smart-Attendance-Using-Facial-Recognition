% Create the face detector object.
faceDetector = vision.CascadeObjectDetector();

% Create the point tracker object.
pointTracker = vision.PointTracker('MaxBidirectionalError', 2);

% Create the webcam object.
cam = VideoReader('C:\Users\Wazeed\Desktop\me5.mp4');

% Capture one frame to get its size.
%videoFrame = readFrame(cam);
%frameSize = size(videoFrame);

% Create the video player object.
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);
runLoop = true;
numPts = 0;
frameCount = 0;

while runLoop && frameCount < 400

    % Get the next frame.
    videoFrame = readFrame(cam);
    videoFrameGray = rgb2gray(videoFrame);
    frameCount = frameCount + 1;

    

    % Display the annotated video frame using the video player object.
    step(videoPlayer, videoFrame);

    % Check whether the video player window has been closed.
    runLoop = isOpen(videoPlayer);
end

% Clean up.
clear cam;
release(videoPlayer);
release(pointTracker);
release(faceDetector);