I1 = imread('test1b.jpg');

I1=im2double(I1);

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