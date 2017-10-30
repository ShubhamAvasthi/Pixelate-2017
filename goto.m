function [ ] = goto(b_node,next_node,Nx,Ny,angle1,blue,yellow,com,rect,vid )

while b_node~=next_node
    im=getsnapshot(vid);
    im = imcrop(im,rect);
    im = imrotate(im,-90);
    yellowhigh=highlight(im,yellow);
    bluehigh=highlight(im,blue);
    bluehigh=noise(bluehigh);
    yellowhigh=noise(yellowhigh);
    frontcentroid=whitecentroid(bluehigh);
backcentroid=whitecentroid(yellowhigh);

[bvx,bvy]=botvector(frontcentroid(1),frontcentroid(2),backcentroid(1),backcentroid(2));

botcentroid=((frontcentroid+backcentroid)/2);

Bx=botcentroid(1);
By=botcentroid(2);

[imx,imy,imz]=size(im);

bx=mod(Bx,fix(imx/8))+1;
by=mod(By,fix(imy/8))+1;



nvx=Bx-Nx;
nvy=Ny-By;

temp=nvx;
nvx=nvy;
nvy=temp;
angle1=deflection(bvx,bvy,nvx,nvy);
Dx=Nx;
Dy=Ny;
nx=fix(Dx/(imx/8))+1;
ny=fix(Dy/(imy/8))+1;
Nx=(nx-1)*fix(imx/8)+fix(imx/16);
Ny=(ny-1)*fix(imy/8)+fix(imy/16);

b_node=8*(bx-1)+by;
next_node=8*(nx-1)+ny;

nvx=Bx-Nx;
nvy=Ny-By;

if (angle1>5)||(angle1<355)
    orient(angle1,com);
else
    fopen(write,'f');
    b_node=8*(bx-1)+by;
end
    
end

end

