function [ pathmatrix ] = segdmatrix( bw )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pathmatrix=zeros(8);
[x1,y1,z1]=size(bw);
for i=1:8
    for j=1:8
        nodeimg=imcrop(bw,[((x1/16)*(2*i-1))-16,((y1/16)*(2*j-1))-16,(x1/8),(y1/8)]);
        pathmatrix(i,j)=fix(1-(mean(mean(nodeimg))));
    end
end

pathmatrix=transpose(pathmatrix);

end

