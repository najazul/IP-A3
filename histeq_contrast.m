function eq_img = histeq_contrast(img)

pixels = round(img * 255) + 1;

H = histcounts(pixels, 1:257);

C = cumsum(H);

H0 = H(find(H > 0, 1));

mapping = (C - H0) / (numel(img) - H0);

mapping = max(0, mapping);

eq_img = reshape(mapping(pixels), size(img));

end
