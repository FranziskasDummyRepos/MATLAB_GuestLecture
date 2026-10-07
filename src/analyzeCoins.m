function results = analyzeCoins(minimumArea,showFigure)
%analyzeCoins - Count large bright objects in the built-in coins image
%   RESULTS = analyzeCoins() reads coins.png, creates a binary image, and
%   returns the number and areas of detected objects.
%
%   RESULTS = analyzeCoins(MINIMUMAREA) ignores objects smaller than
%   MINIMUMAREA pixels.
%
%   RESULTS = analyzeCoins(...,SHOWFIGURE) displays the original and
%   binary images when SHOWFIGURE is true.
%
%   See also imread, imbinarize, bwareaopen, bwconncomp, regionprops

arguments
    minimumArea (1,1) double {mustBeNonnegative} = 100
    showFigure (1,1) logical = true
end

grayImage = imread("coins.png");
binaryImage = imbinarize(grayImage);
cleanImage = bwareaopen(binaryImage,minimumArea);
connectedObjects = bwconncomp(cleanImage);
objectProperties = regionprops(connectedObjects,"Area");
objectAreas = [objectProperties.Area];

results = struct;
results.ObjectCount = connectedObjects.NumObjects;
results.ObjectAreas = objectAreas;
results.MeanArea = mean(objectAreas);
results.BinaryImage = cleanImage;

if showFigure
    figure(Name="Coin analysis")
    tiledlayout(1,2)

    nexttile
    imshow(grayImage)
    title("Original image")

    nexttile
    imshow(cleanImage)
    title("Detected objects")
end
end
