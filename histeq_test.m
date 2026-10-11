
I1 = imread('vintage_postcard.tif');
%I1 = imread('pout.tif');
%I1 = imread('office_5.jpg'); I1=I1(:,:,2);
%I1 = imread('office_1.jpg'); I1=I1(:,:,2);
%I1 = imread('low_light.tif');
I1=im2double(I1);

% damage contrast
I1=0.8*I1;

I1eq = histeq_contrast(I1);
figure
subplot(1,2,1);
imagesc(I1); caxis([0 1]); title('Test Image 1'); axis equal tight
subplot(1,2,2);
imagesc(I1eq); caxis([0 1]); title('Histeq Result');  axis equal tight
colormap(gray);

figure;
subplot(1,2,1);
histogram(I1(:), 256, 'BinLimits', [0 1]);
title('Original Histogram - Test 1');
xlabel('Pixel Intensity');
ylabel('Frequency');
xlim([0 1]);

subplot(1,2,2);
histogram(I1eq(:), 256, 'BinLimits', [0 1]);
title('Equalized Histogram - Test 1');
xlabel('Pixel Intensity');
ylabel('Frequency');
xlim([0 1]);

fprintf(1,'Min/max of input image  1: %3.3f %3.3f\n', min(I1(:)),max(I1(:)) );
fprintf(1,'Min/max of output image 1: %3.3f %3.3f\n', min(I1eq(:)),max(I1eq(:)) );

% damage contrast
I2 = I1*0.25 + 0.25;

I2eq = histeq_contrast(I2);
figure
subplot(1,2,1);
imagesc(I2); caxis([0 1]); title('Test Image 2');  axis equal tight
subplot(1,2,2);
imagesc(I2eq); caxis([0 1]); title('Histeq Result');  axis equal tight
colormap(gray);

figure;
subplot(1,2,1);
histogram(I2(:), 256, 'BinLimits', [0 1]);
title('Original Histogram - Test 2');
xlabel('Pixel Intensity');
ylabel('Frequency');
xlim([0 1]);

subplot(1,2,2);
histogram(I2eq(:), 256, 'BinLimits', [0 1]);
title('Equalized Histogram - Test 2');
xlabel('Pixel Intensity');
ylabel('Frequency');
xlim([0 1]);

fprintf(1,'Min/max of input image  2: %3.3f %3.3f\n', min(I2(:)),max(I2(:)) );
fprintf(1,'Min/max of output image 2: %3.3f %3.3f\n', min(I2eq(:)),max(I2eq(:)) );







