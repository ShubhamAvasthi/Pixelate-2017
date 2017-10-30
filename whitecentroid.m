function [ m ] = whitecentroid( im )
st=regionprops(im,'centroid');
m=st(1).Centroid;
end

