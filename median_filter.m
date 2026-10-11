% MEDIAN_FILTER
%
% Usage:
%         med_img = median_filter(img,M,N)
%
% M,N size of MxN median filter to employ. 

function med_img = median_filter(img,M,N)

% ensure img is 0..1 and greyscale
img = im2double(img);
if (size(img,3)==3)
  img=rgb2gray(img);
end

% ----- INSERT YOUR OWN CODE BELOW -----
med_img = img;
rows = size(img, 1);
cols = size(img, 2);

% calculate the window placement split
up = floor((M - 1) / 2);
down = M - 1 - up;
left = floor((N - 1) / 2);
right = N - 1 - left;
total = M * N;

% loop through each pixel
for r = (1 + up):(rows - down)
    for c = (1 + left):(cols - right)
        window = img((r - up):(r + down), (c - left):(c + right));
        window_col = window(:);
        window_sorted = sort(window_col);

        if mod(total, 2) == 1
            med_val = window_sorted((total + 1) / 2);
        else
            mid1 = window_sorted(total / 2);
            mid2 = window_sorted(total / 2 + 1);
            med_val = (mid1 + mid2) / 2;
        end
        med_img(r, c) = med_val;
    end
end

% Hint: the simplest solution is to use for loops and the sort() function
% to solve this. Consider also how you plan to deal with values near the
% boundary.


% ----- INSERT YOUR OWN CODE ABOVE -----

return
end




