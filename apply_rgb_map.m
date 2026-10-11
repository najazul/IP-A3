% APPLY_RGB_MAP - replace R,G and B values in an image based
%  on the supplied lookup table
%
% Usage:
%          adjusted_image = apply_rgb_map(img,map)
%
% img -  NxMx3 uint8 image
% map -  256x3 lookup table for R,G,B values in range 0..255
%
% note R,G and B values are mapped independently. The RGB triples
% do not represent actual colours in the image (this is not a colormap).

function adjusted_image = apply_rgb_map(RGB_image,RGB_map)

% remap each RGB value in the current image onto a new image. Remember
% to treat each RGB channel separately. Also entry 1 in the table is
% colorlevel 0 and entry 256 is colorlevel 255

% ----- ADD YOUR CODE BELOW -----

%uint8 can only hold 0-255 but the mapping holds 1-256 rows hence convert
%to double so when we add 1 it goes to 256th index
RGB_image = double(RGB_image);

[h, w, c] = size(RGB_image);

% for faster loop since this creates an allocated size rather than a
% vector which grows and we also want uint8 output
adjusted_image = zeros(h, w, c, 'uint8');

for i = 1:h
    for j = 1:w
        for k = 1:c
        map_index = RGB_image(i, j, k) + 1;
        new_value = RGB_map(map_index, k);
        adjusted_image(i, j, k) = new_value;
        end
    end
end

% ----- ADD YOUR CODE ABOVE -----

return
end