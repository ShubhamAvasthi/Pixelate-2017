function [bw] = noise (im)

im = bwareaopen(im,400);
im = imclose(im, strel('square',20));
im = imopen(im, strel('square',20));

bw = im;


end