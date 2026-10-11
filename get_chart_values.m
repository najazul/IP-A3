% GET_CHART_VALUES(chart_image) - extract the 6x4 color values from the
% supplied colour chart image.
%
% Usage:
%         RGB_list = get_chart_values(chart_image)
%
% chart_image - NxMx3 array of uint8
% RGB_list - 24x3 element list of rgb values


function RGB_list = get_chart_values(chart_image)

% chart_image is assumed to be an RGB (0..255) image of the color test
% chart. The chart should consist of 4 rows of 6 color patches equally
% spaced. Here you simply need to obtain an RGB value for each patch and
% store it in an Nx3 table

% ---- INSERT YOUR CODE BELOW -----

% get the char_image size
[h, w, c] = size(chart_image);

% resize to remove edges
I1 = chart_image(68:1045, 68:1527, :);

% get the new size and get the offsets
[h, w, c] = size(I1);
h_offset = h/4;
w_offset = w/6;

% for polyfit to work (it expects double not uint8)
% also for faster loop since this creates an allocated size rather than a
% vector which grows

RGB_list = zeros(24, 3);

for i = 1:4
    for j = 1:6
        % get the midpoint for each offset
        row = round((h_offset*i) - (h_offset/2));
        col = round((w_offset*j) - (w_offset/2));
        % create a continous 24 x 3 blocks using the offsets
        RGB_list((i-1)*6 + j, :) = I1(row, col, :);
    end
end

% ---- INSERT YOUR CODE ABOVE -----

return
end