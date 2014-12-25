%Author : Roshni Uppala
% Id : 1011735230 
% ECE 563 PROJECT 1: LOCAL CONTRAST ENHANCEMENT
%run_local_contrast script file

cl                  % Clears the memory, closes windows, clears command window
% Loading the image file
load JPCNN001_small 
whos
% Assigning variable 'Image' from the image file
Image=jrst.cxr;    

% Display the actual image
im(Image)           
title('Input Image')

% Convert from uint16 to double format
Image=double(Image);

%Setting the min_local_std to zero
min_local_std = 0 ;

% Choosing a value and assigning it to the standard deviation that can give the best output image.
gauss_std=9; 

% Calling the function file local_contrast
enhanced_image=local_contrast(Image,gauss_std,min_local_std); 

% Display the final enhanced version of the image
im(enhanced_image)  
title('Output image(Linear contrast enhanced image)')
