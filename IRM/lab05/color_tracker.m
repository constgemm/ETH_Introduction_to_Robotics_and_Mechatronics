% tabula rasa:
% clc;
% clear all;
% close all;

% This is to solve Prelab Q1:
% Write a MATLAB script that reads the image, plots the three hsv channels
% seperately, uses threshhold on hue and saturation to find the red, green and blue shapes independently and determines the centroid of the object

% Read the image given to you (use function imread())
image_original = imread('image1.jpg');

% plot the original image (use imshow())
imshow(image_original)
% convert your image into hsv color space (use function rgb2hsv())
image_hsv = rgb2hsv(image_original);
imshow(image_hsv)

%% plot the grayscale images of hue, saturation and value of your image seperately (use imshow() again)
close all
% image_grey = rgb2gray(image_original);

image_hue = image_hsv(:, :, 1);
figure('Name', 'greyscale of hue')
imshow(image_hue)

image_saturation = image_hsv(:, :, 2);
figure('Name', 'greyscale of saturation')
imshow(image_saturation)

image_value = image_hsv(:, :, 3);
figure('Name', 'greyscale of value')
imshow(image_value)
%% use the hue image you just plotted to find the hue lower and upper bounds for each color

% const
const_lower_red = 0.8334;
const_upper_red = 0.1666;
const_lower_green = 0.1667;
const_upper_green = 0.5;
const_lower_blue = 0.5001;
const_upper_blue = 0.8333;

% set all upper_bounds to lowest possible and vice versa
upper_bound_red = 0;
lower_bound_red = 1;
upper_bound_green = const_lower_green;
lower_bound_green = const_upper_green;
upper_bound_blue = const_lower_blue;
lower_bound_blue = const_upper_blue;



for j = 1:1080
    for i = 1:1680
        temp_hue = image_hue(j, i);
        % upper bound
        if temp_hue < const_upper_red
            if temp_hue > upper_bound_red
                upper_bound_red = temp_hue;
            end
        end
        if temp_hue < const_upper_green && temp_hue > const_lower_green
             if temp_hue > upper_bound_green
                upper_bound_green = temp_hue;
            end
        end  
        if temp_hue < const_upper_blue && temp_hue > const_lower_blue
             if temp_hue > upper_bound_blue
                upper_bound_blue = temp_hue;
            end
        end
        
        % lower bound
        if temp_hue > const_lower_red
            if temp_hue < lower_bound_red
                lower_bound_red = temp_hue;
            end
        end
        if temp_hue < const_upper_green && temp_hue > const_lower_green
             if temp_hue < lower_bound_green
                lower_bound_green = temp_hue;
            end
        end  
        if temp_hue < const_upper_blue && temp_hue > const_lower_blue
             if temp_hue < lower_bound_blue
                lower_bound_blue = temp_hue;
            end
        end  
        
    end
end
clear i j temp


%% use the saturation image you just plotted and find one single lower and upper bound for all your colors
lower_bound_sat = min(min(image_saturation));
upper_bound_sat = max(max(image_saturation));


%% use these tresholds to create a mask for each color, plot your three masks seperately (for each
% color you should have a black-white image showing only the blob of that color)
close all
red_mask([1:1080], [1:1680]) = zeros;
green_mask([1:1080], [1:1680]) = zeros;
blue_mask([1:1080], [1:1680]) = zeros;

sat_factor = 0.92;

for j = 1:1080
    for i = 1:1680
        temp_hue = image_hue(j, i);
        temp_sat = image_saturation(j, i);
        if (temp_hue < const_upper_red || image_hue(j, i) > const_lower_red) && temp_sat > sat_factor * upper_bound_sat
            red_mask(j, i) = 1;
        end
        if temp_hue < const_upper_green && temp_hue > const_lower_green && temp_sat > sat_factor * upper_bound_sat
            green_mask(j, i) = 1;
        end  
        if temp_hue < const_upper_blue && temp_hue > const_lower_blue && temp_sat > sat_factor * upper_bound_sat
             blue_mask(j, i) = 1;
        end
    end
end
rgb_mask(:, :, 1) = red_mask;
rgb_mask(:, :, 2) = green_mask;
rgb_mask(:, :, 3) = blue_mask;

figure('Name', 'red mask')
imshow(red_mask)
title('red mask')
figure('Name', 'green mask')
imshow(green_mask)
title('green mask')
figure('Name', 'blue mask')
imshow(blue_mask)
title('blue mask')
% figure('Name', 'RGB mask')
% imshow(rgb_mask)
% title('rgb mask')

clear j i temp sat_factor

%% find the centroid of the three colors using their respective masks ( use function regionprops();  be aware that it can return more than one centroid  )

center_red=regionprops(red_mask, 'centroid');
xy_centroid_red=cat(1, center_red.Centroid);
x_centroid = xy_centroid(:,1);
y_centroid = xy_centroid(:,2);
%% plot the original image with the center of the centroid (use function insertMarker())
































