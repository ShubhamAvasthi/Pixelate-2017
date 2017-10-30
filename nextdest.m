function [ Dx,Dy ] = nextdest( bx,by,incolour,im,red,green )

if(incolour=='r')
    filter=red;
else
    filter=green;
end
img=highlight(im,filter);
img=noise(img);
x=regionprops(img,'Centroid');

min_d=inf;
min_i=0;

for i=1:length(x)
    a=x(i).Centroid;
    X=a(1);
    Y=a(2);
    d=((X-bx)*(X-bx)+(Y-by)*(Y-by));
    if(d<min_d)
        min_d=d;
        min_i=i;
    end
end

D=x(min_i).Centroid;
Dx=D(1);
Dy=D(2);

[imx,imy,imz]=size(im);
end

