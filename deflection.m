function [ angle ] = deflection( bvx,bvy,pvx,pvy )
%angle=angle from bot vector to path vector

if(bvx==0)
    if(bvy>0)
        bangle=0;
    else
        bangle=180;
    end
elseif(bvy==0)
    if(bvx>0)
        bangle=90;
    else
        bangle=270;
    end
else
    bangle=atand(bvy/bvx);
    if(bangle<0)
        bangle=bangle+180;
    end
end

if(pvx==0)
    if(pvy>0)
        pangle=0;
    else
        pangle=180;
    end
elseif(pvy==0)
    if(pvx>0)
        pangle=90;
    else
        pangle=270;
    end
else
    pangle=atand(pvy/pvx);
    if(pangle<0)
        pangle=pangle+180;
    end
end

while(pangle<0)
    pangle=pangle+360;
end
while(pangle>=360)
    pangle=pangle-360;
end
while(bangle<0)
    bangle=bangle+360;
end
while(bangle>=360)
    bangle=bangle-360;
end

bangle
pangle

angle=pangle-bangle;
if(angle<0)
    angle=angle+360;
end
if(angle>=360)
    angle=angle-360;
end

end

