com=serial('COM6','BAUDRATE',9600);
com=serial('COM6','BAUDRATE',9600);
fopen(com);
pause(3);

i=1;
while(i==1)
taskcompleted=0;
im=vidcam();

if(i==1)
    [im,rect]=imcrop(im);
else
    im=imcrop(im,rect);
end

if(i==1)
    blue=imcrop(im);
    red=imcrop(im);
    green=imcrop(im);
    black=imcrop(im);
    yellow=imcrop(im);
    white=imcrop(im);
end

bluehigh=highlight(im,blue);
redhigh=highlight(im,red);
greenhigh=highlight(im,green);
blackhigh=highlight(im,black);
yellowhigh=highlight(im,yellow);
whitehigh=highlight(im,white);

bluehigh=noise(bluehigh);
redhigh=noise(redhigh);
greenhigh=noise(greenhigh);
blackhigh=noise(blackhigh);
yellowhigh=noise(yellowhigh);
whitehigh=noise(whitehigh);

imtool(bluehigh);
imtool(redhigh);
imtool(greenhigh);
imtool(blackhigh);
imtool(yellowhigh);
imtool(whitehigh);

frontcentroid=whitecentroid(bluehigh);
backcentroid=whitecentroid(yellowhigh);

[bvx,bvy]=botvector(frontcentroid(1),frontcentroid(2),backcentroid(1),backcentroid(2));

botcentroid=((frontcentroid+backcentroid)/2);

Bx=botcentroid(1);
By=botcentroid(2);

temp=Bx;
Bx=By;
By=temp;

[imx,imy,imz]=size(im);

bx=fix(Bx/(imx/8))+1;
by=fix(By/(imy/8))+1;

%temp=bx;
%bx=by;
%by=temp;

if(i==1)
[BB_in,BB_bp,BB_cs]=BB_bp_cs(noise(not(blackhigh|bluehigh|yellowhigh)));
end

indicator=imcrop(im,BB_in);
BP=imcrop(im,BB_bp);
CS=imcrop(im,BB_cs);

in_colour=mean(mean(indicator));

r=mean(mean(red));
g=mean(mean(green));
inchar='n';
if(in_colour(1)>r(1)-15&&in_colour(1)<r(1)+15&&in_colour(2)>r(2)-15&&in_colour(2)<r(2)+15&&in_colour(3)>r(3)-15&&in_colour(3)<r(3)+15&&taskcompleted==0)
    fwrite(com,'r');
    inchar='r';
elseif(in_colour(1)>g(1)-15&&in_colour(1)<g(1)+15&&in_colour(2)>g(2)-15&&in_colour(2)<g(2)+15&&in_colour(3)>g(3)-15&&in_colour(3)<g(3)+15&&taskcompleted==0)
    fwrite(com,'g');
    inchar='g';
end


bp_array=blueprintinfo(imcrop(im,BB_bp),red,green);

T=(bluehigh|yellowhigh|redhigh|greenhigh);
        
pathmatrix=segdmatrix(T);

[Dx,Dy]=nextdest(bx,by,inchar,im,red,green);

nx=fix(Dx/(imx/8))+1;
ny=fix(Dy/(imy/8))+1;
Nx=(nx-1)*fix(imx/8)+fix(imx/16);
Ny=(ny-1)*fix(imy/8)+fix(imy/16);

b_node=8*(bx-1)+by;
next_node=8*(nx-1)+ny;

nvx=Bx-Nx;
nvy=Ny-By;

temp=nvx;
nvx=nvy;
nvy=temp;

%angle=deflection(bvx,bvy,nvx,nvy);

patharray=shortestpath(pathmatrix,b_node,next_node);
patharray

for i=2:length(patharray)-1;
        Dx=(2*(fix((patharray(i)-1)/8)+1)-1)*(imx/16);
        Dy=(2*(mod((patharray(i)-1),8)+1)-1)*(imy/16);
    goto(b_node,patharray(i),Dx,Dy,angle1,blue,yellow,com,rect,vid);
end

grab( b_node,next_node,angle,blue,yellow,Dx,Dy,com,rect );

i=2;
end

delete(instrfindall);