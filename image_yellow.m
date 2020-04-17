function output = image_yellow(img_marked,img_original)

img_original_d = im2double(img_original);

%figure; imshow(img_marked)
% img_R = im2bw(img_marked(:,:,1),240/255);
% img_G = im2bw(img_marked(:,:,2),240/255);
% img_B = im2bw(img_marked(:,:,3),20/255);
[row,col,d] = size(img_marked);
img_yellow = zeros(row,col,d);
% img_yellow (:,:,1) = img_R;
% img_yellow (:,:,2) = img_G;
% img_yellow (:,:,3) = img_B;
    for i=1:row
        for j=1:col
            if (img_marked(i,j,1)>240 && img_marked(i,j,2)>240 && img_marked(i,j,3)<20)
                img_yellow (i,j,:) = img_marked (i,j,:);
            end
        end
    end
%img_seg (:,:,3) = 0;
%figure, imshow (img_yellow)
img_gray = rgb2gray(img_yellow);
%figure, imshow (img_gray);
img_avg = imfilter(img_gray,[9 9]);
%figure, imshow (img_avg)
img_dilate = imdilate(img_avg, ones(5));
%figure, imshow (img_dilate)
img_bin = im2bw(img_dilate);

img_seg = zeros(row,col,d);
img_seg(:,:,1) = img_original_d (:,:,1) .* img_bin;
img_seg(:,:,2) = img_original_d (:,:,2) .* img_bin;
img_seg(:,:,3) = img_original_d (:,:,3) .* img_bin;
%figure, imshow(img_seg)

output = img_seg;
