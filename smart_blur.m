% SMART_BLUR - blur image to remove noise, but attempt to preserve
%  edge details where possible
%
% USAGE:
%   image_out = smart_blur( image_in , N , tolerance )
%
%    N         - size of NxN blur to apply to data (def. 5).
%    tolerance - estimate of gradient based on noise alone. Used to
%                contol weighting between oriignal and smoothed data
%                returned by function (def. 0.015)
%
% NOTE: all image data is converted to greyscale, with values in range 
%      0.0..1.0 before filtering is applied.

function B = smart_blur(I,N,tolerance)

% convert to greyscale 0.0..1.0
I =im2double(I);
if (size(I,3)==3)
  I=rgb2gray(I);
end

% handle missing input parameters
if (nargin<2)
  N=5;
  if (nargin<3)
    tolerance=0.015; % about 4 greylevels for 8bit data
  end
  if (nargin<1)
    error('This function requires an image as input');
  end
end

% ------ INSERT YOUR CODE BELOW ------

% average filter where each value is 1/(N*N) so convolving it gets the
% average of the NxN neighbors of each pixel
avg_filter = ones(N, N) / (N*N);
Iblur = conv2(I, avg_filter, 'same');

% 5x5 sobel filters given in the assignment, Kx for the x gradient and Ky
% for the y gradient
Kx = [ -4  -5  0   5   4;
       -8 -10  0  10   8;
      -10 -20  0  20  10;
       -8 -10  0  10   8;
       -4  -5  0   5   4] / 240;

Ky = [  4   8  10   8   4;
        5  10  20  10   5;
        0   0   0   0   0;
       -5 -10 -20 -10  -5;
       -4  -8 -10  -8  -4] / 240;

% same keeps the output the same size as the image
Ix = conv2(I, Kx, 'same');
Iy = conv2(I, Ky, 'same');

[h, w] = size(I);

% allocate the output size first rather than a vector which grows
B = zeros(h, w);

for i = 1:h
    for j = 1:w
        % gradient of the pixel, large on edges and small on flat areas
        G = sqrt(Ix(i, j)^2 + Iy(i, j)^2);

        % weight is t/G but not more than 1, if G is 0 then t/G is Inf
        % so it goes to 1 which is full blur
        if tolerance / G <= 1
            weight = tolerance / G;
        else
            weight = 1;
        end

        % flat areas get more of the blurred image and edges get more of
        % the original image
        B(i, j) = weight * Iblur(i, j) + (1 - weight) * I(i, j);
    end
end

% ------ INSERT YOUR CODE ABOVE ------

return
end

