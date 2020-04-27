% tabula rasa:
% clc;
clear all;
close all;

%% This is to solve Prelab Q1:
% Write a MATLAB script that reads the image, plots the three hsv channels seperately, uses threshhold on hue and saturation to find the red, green and blue shapes independently and determines the centroid of the object


% Read the image given to you (use function imread())

% plot the original image (use imshow())

% convert your image into hsv color space (use function rgb2hsv())

% plot the grayscale images of hue, saturation and value of your image seperately (use imshow() again)

% use the hue image you just plotted to find the hue lower and upper bounds for each color

% use the saturation image you just plotted and find one single lower and upper bound for all your colors

% use these tresholds to create a mask for each color, plot your three masks seperately (for each color you should have a black-white image showing only the blob of that color)

% find the centroid of the three colors using their respective masks ( use function regionprops();  be aware that it can return more than one centroid  )


% plot the original image with the center of the centroid (use function insertMarker())


