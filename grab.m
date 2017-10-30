function [ output_args ] = grab( b_node,next_node,angle,blue,yellow,Dx,Dy,com,rect )
d=inf;
while(d>10000)
im=vidcam();
    im=imcrop(im,rect);
    bluehigh=highlight(im,blue);
    yellowhigh=highlight(im,yellow);
    frontcentroid=whitecentroid(bluehigh);
    backcentroid=whitecentroid(yellowhigh);

[bvx,bvy]=botvector(frontcentroid(1),frontcentroid(2),backcentroid(1),backcentroid(2));

botcentroid=((frontcentroid+backcentroid)/2);

Bx=botcentroid(1);
By=botcentroid(2);

[imx,imy,imz]=size(im);

bx=mod(Bx,fix(imx/8))+1;
by=mod(By,fix(imy/8))+1;

angle=deflection(bvx,bvy,nvx,nvy);

d=(Bx-Dx)*(Bx-Dx)+(By-Dy)*(By-Dy);

if (angle>5)||(angle<355)
    orient(angle,com);
else
    fwrite(com,'f');
end

end

fwrite(com,'d');

end

