

function out=local_contrast(in,gauss_std,min_local_std)
% Author : Roshni Uppala
% Id : 1011735230 
% ECE 563 PROJECT 1: LOCAL CONTRAST ENHANCEMENT
% FUNCTION FILE
% out=local_contrast(in,gauss_std,min_local_std)
% Enhancing the contrast of the image using local contrast enhancement.
%
% INPUTS:  in= input image. in must be in double form to make 
%              a mathematical and convolution processes.
%
%          gauss_std= The standared deviation which used for enhancement. 
%                     The standared deviation must be integer number 
%                     because it uses for filter size.
%
%          min_local_std= The minimum standard deviation below which
%                         enhancement is not possible.
%
% OUTPUT:   out= enhanced image.

%Displaying the minimum value of standard deviation
min_local_std

% to make sure the standard deviation is integer
gauss_std=ceil(gauss_std); 

% Create a gaussian low pass filter (using separable filter for speed enhancement) 
hx=fspecial('gaussian',[1 4*gauss_std+1],gauss_std); %compute x component of the filter- 1D
hy=fspecial('gaussian',[4*gauss_std+1 1],gauss_std); %compute y component of the filter-1D


% Convolve the input image with the filter to produce local mean and also
% padding the input image
gx=conv2( padarray(in, [0 2*gauss_std], 'symmetric', 'both' ), hx, 'valid');
local_mean=conv2( padarray( gx, [2*gauss_std 0], 'symmetric', 'both' ), hy, 'valid');

% Subtracting the local mean from the original image and square the result
local_variance=(in-local_mean).^2;

% convolve the rsult of squaring  pixels values with the filter and also
% padding.
fx=conv2( padarray(local_variance, [0 2*gauss_std], 'symmetric', 'both' ), hx, 'valid');
local_variance1=conv2( padarray( fx, [2*gauss_std 0], 'symmetric', 'both' ), hy, 'valid');

% Determine the local variance
local_variance2=local_variance1.^0.5;

% Determine the output
out=64*(in-local_mean)./local_variance2+127; 
