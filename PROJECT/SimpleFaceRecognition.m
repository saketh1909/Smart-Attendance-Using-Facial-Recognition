function [] = SimpleFaceRecognition(conn,cn)
%% Load Image Information from ATT Face Database Directory
faceDatabase = imageSet('dataset','recursive');
test = imageSet('test');

training = faceDatabase;

%% Extract HOG Features for training set 
trainingFeatures = zeros(size(training,2)*training(1).Count,4680);
featureCount = 1;
for i=1:size(training,2)
    for j = 1:training(i).Count
        trainingFeatures(featureCount,:) = extractHOGFeatures(read(training(i),j));
        trainingLabel{featureCount} = training(i).Description;    
        featureCount = featureCount + 1;
    end
    personIndex{i} = training(i).Description;
end

%% Create 40 class classifier using fitcecoc 
faceClassifier = fitcecoc(trainingFeatures,trainingLabel);

%% Test First n People from Test Set
figure;
figureNum = 1;
for person=1:6
    for j = 1:test.Count
        queryImage = read(test,j);
        queryFeatures = extractHOGFeatures(queryImage);
        personLabel = predict(faceClassifier,queryFeatures);
        % Map back to training set to find identity
        booleanIndex = strcmp(personLabel, personIndex);
        integerIndex = find(booleanIndex);
        subplot(1,2,figureNum);imshow(queryImage);title('Query Face');
        
        subplot(1,2,figureNum+1);imshow(read(training(integerIndex),1));title('Matched Class');
       % figureNum = figureNum+2;
            query = sprintf('UPDATE students SET c%d = 1 WHERE `Number` = %d',cn,integerIndex) ;
 curs = exec(conn,query);
 curs = fetch(curs);
 curs.Data;
 pause(2);
    end
    %figure;
    %figureNum = 1;

%clear all;

end



