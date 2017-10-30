function [ y ] = highlight( im, crop )

M=mean(mean(crop));
dx=70;

bwr = im(:,:,1)>M(1)-dx & im(:,:,1)<M(1)+dx;
bwg = im(:,:,2)>M(2)-dx & im(:,:,2)<M(2)+dx;
bwb = im(:,:,3)>M(3)-dx & im(:,:,3)<M(3)+dx;

y=bwr & bwg & bwb;
end

