%%

close all
clc
clear all

% for k = 7:9
%     filename_marked = strcat('Training data\A00_v2\A00_v2\A00_0',num2str(k),'.jpg')
%     if (filename_marked == )
%         filename_original = strcat('Training data\A00_v2\A00_v2\A00_0',num2str(k),'.bmp')
%         img_marked = imread(filename_marked);
%         img_original = imread(filename_original);
%         figure, imshow (img_marked);
%         figure, imshow (img_original);
% 
%         img_seg = image_yellow (img_marked,img_original);
%         figure, imshow (img_seg);
%     end
%     
% end

marFiles = dir('E:\DIP\DIP Project\MITOS\Training data\A00_v2\A00_v2c\*.jpg');
orFiles = dir('E:\DIP\DIP Project\MITOS\Training data\A00_v2\A00_v2c\*.bmp');
original = cell(1, length(orFiles));
marked =  cell(1, length(marFiles));
for i = 1 : length(marFiles)
  filename = strcat('E:\DIP\DIP Project\MITOS\Training data\A00_v2\A00_v2c\',marFiles(i).name);
  I = imread(filename);
  marked{1,i}= I
  %figure, imshow(I);
end
for i = 1 : length(orFiles)
  filename = strcat('E:\DIP\DIP Project\MITOS\Training data\A00_v2\A00_v2c\',orFiles(i).name);
  I = imread(filename);
  original{1,i}= I
  %figure, imshow(I);
end
folder = 'E:\DIP\DIP Project\MITOS\Training data\A00_v2\seg\'
mkdir(folder);
for i = 1:length(orFiles)
    img_seg = image_yellow (marked{1,i},original{1,i});
    figure, imshow (img_seg);
    newimagename = [folder ' ' num2str(i) '.bmp'];
    imwrite(img_seg,newimagename)
end