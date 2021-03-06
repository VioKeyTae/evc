function[image_swapped, image_mark_blue, image_masked, image_reshaped, image_convoluted, image_edge] = Images();

%% Initialization. Do not change anything here
clc;
input_path = 'lena_color.jpg';
output_path = 'lena_output.png';

image_swapped = [];
image_mark_blue = [];
image_masked = [];
image_reshaped = [];
image_edge = [];


%% I. Images basics
% 1) Load image from 'input_path'
image = imread(input_path);
%whos bild


% 2) Convert the image from 1) to double format with range [0, 1]. DO NOT USE LOOPS.
image = im2double(image);
%whos bild

% 3) Use the image from 2) to create a image where the red and the green channel
% are swapped. The result should be stored in image_swapped. DO NOT USE LOOPS.
image_swapped = image;
r=image(:,:,1);
g=image(:,:,2);
image_swapped(:,:,1)=g;
image_swapped(:,:,2)=r;

% 4) Display the swapped image
imshow(image_swapped);

% 5) Write the swapped image to the path specified in output_path. The
% image should be in png format.
imwrite(image_swapped,output_path);

% 6) Create logical image where every pixel is marked that's blue channel
% is greater than 0.5. The result should be stored in image_mark_blue. 
% DO NOT USE LOOPS.
image_mark_blue = logical(image(:,:,3)>0.5)

% 7) Set all pixels in the original image to black where image_mark_blue is
% true (where blue > 0.5). Store the result in image_masked. Use repmat to
% complete this task. DO NOT USE LOOPS.
pseudorgb = repmat(image_mark_blue, [1 1 3]);
image_masked = image;
image_masked(pseudorgb) = 0;
imshow(image_masked);

% 8) Convert the original image to a grayscale image and reshape it from
% 512x512 to 1024x256. The result should be stored in 'image_reshaped' DO NOT USE LOOPS.
image_reshaped = rgb2gray(image);
part1 = image_reshaped([1:256],:);
part2 = image_reshaped([257:512],:);
image_reshaped = cat(2,part1,part2);

%% II. Filters and convolutions

% 1) Use fspecial to create a 3x3 gaussian filter with sigma=1.0
%TODO: Delete the next line and add your code here
gauss_kernel = fspecial('gaussian',[3 3],1.0);

% 2) Implement the evc_filter function. You are allowed to use loops for
% this task. You can assume that the kernel is always of size 3x3.
% For pixels outside the image use 0. 
% Do not use the conv or the imfilter function here. The result should be
% stored in image_convoluted
image_convoluted = evc_filter(image_swapped, gauss_kernel);

% 3) Create a image showing the vertical edges in image_reshaped using the sobel filter.
% For this task you can use either the evc_filter method or imfilter/conv.
% The result should be stored in image_edge. DO NOT USE LOOPS.
vertical_sobel_filter = [-1,-2,-1;0,0,0;1,2,1];
image_edges = imfilter(image_reshaped,vertical_sobel_filter);

end

% Returns the input image filtered with the kernel
% input: A rgb-image
% kernel: The filter kernel
function [result] = evc_filter(input, kernel)
    matrixSize = size(input);
    
    for row=1:matrixSize(1)
        for column=1:matrixSize(2)
            
            newValue = get_value(row-1,column-1,input) * kernel(1,1);
            newValue = newValue + get_value(row-1,column,input) * kernel(1,2);
            newValue = newValue + get_value(row-1,column+1,input) * kernel(1,3);
            newValue = newValue + get_value(row,column -1,input) * kernel(2,1);
            newValue = newValue + get_value(row,column,input) * kernel(2,2);
            newValue = newValue + get_value(row,column +1,input) * kernel(2,3);
            newValue = newValue + get_value(row+1,column-1,input) * kernel(3,1);
            newValue = newValue + get_value(row+1,column,input) * kernel(3,2);
            newValue = newValue + get_value(row+1,column+1,input) * kernel(3,3);
            
            input(row,column) = newValue;
        end
    end
    
    result = input;

end

function [value] = get_value(x,y,input)
    if (x<1 || y<1 || x> size(input,2)|| y > size(input,1))
        value = 0;
    else
        value = input(x,y);
    end
end