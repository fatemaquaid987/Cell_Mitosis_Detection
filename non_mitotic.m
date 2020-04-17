function out = non_mitotic(img_marked)
a = imread(img_marked);
[row,col,d] = size(img_marked);
img_yellow = zeros(size(a));

for i=1:row
        for j=1:col
            if (a(i,j,1)>240 && a(i,j,2)>240 && a(i,j,3)<20)
                img_yellow (i,j,1) = 1;
                img_yellow (i,j,2) = 1;
                img_yellow (i,j,3) = 1;
            end
        end
end
out = img_yellow;
end