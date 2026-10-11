% CHART_CORRECTION - calculate RGB mappings to correct for color imbalance 
%                    between values measured from reference and test charts 
% Usage:
%         RGB_map = chart_correction(RGB_reference,RGB_measured)
%
% RGB_reference - Mx3 list of reference RGB samples 
% RGB_measured  - Mx3 list of actual RGB samples 
%
% RGB_map - 256x3 lookup table of R,G and B colour corrections
%

function RGB_map = chart_correction(RGB_reference,RGB_measured)

% Here we need to use the difference between the measured RGB values
% and the reference RGB values to create a lookup tables for RGB which will
% map the measured values back into the reference.

% Here the result is result is to be returned as a 256x3 table which contains the
% correction for the red,green and blue values


% ---- INSERT YOUR CODE BELOW -----

% the degrees are changed depending on the bad image reference's chart
% values, the visualizations are found in the chart_test.mlx file

% red channel fit
deg = 1;                        
x = RGB_measured(:, 1);         
y = RGB_reference(:, 1);        

p = polyfit(x, y, deg);
levels = (0:255)';               
Rfit = polyval(p, levels);

% green channel fit
deg = 1;                        
x = RGB_measured(:, 2);         
y = RGB_reference(:, 2);        

p = polyfit(x, y, deg);
levels = (0:255)';               
Gfit = polyval(p, levels);

% blue channel fit
deg = 1;                        
x = RGB_measured(:, 3);         
y = RGB_reference(:, 3);        

p = polyfit(x, y, deg);
levels = (0:255)';               
Bfit = polyval(p, levels);

% join all each channels into 1 matrix
RGB_map = [Rfit, Gfit, Bfit];

% round off values and clip values greater than 255 and less than 0
RGB_map = round(RGB_map);    
RGB_map = max(RGB_map, 0);       
RGB_map = min(RGB_map, 255);

% ---- INSERT YOUR CODE ABOVE -----

return
end