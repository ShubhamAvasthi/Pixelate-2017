function [ patharray ] = shortestpath( segmat, node1, node2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
parent=zeros(8);
dist=inf(8);
dist(node1)=0;
visited=zeros(8);
current=node1;
parent(node1)=0;
a=[0,0,0,0];

segmat(fix((node2-1)/8)+1,mod(node2-1,8)+1)=1;

while visited(node2)==0
    l=(not(mod(current,8)==1))*(current-1);
    r=(not(mod(current,8)==0))*(current+1);
    u=(not(fix((current-1)/8)==0))*(current-8);
    d=(not(fix((current-1)/8)==7))*(current+8);
    %disp(l);disp(r);disp(u);disp(d);
    %if r~=0
    %if(r~=0)
        %disp(segmat(fix((r-1)/8)+1,mod(r-1,8)+1)==1&&visited(r)==0);
        %disp('aaa')
    %end
%     disp(visited(r));
    %end
    ch='n';
    
    next=0;  %Just an initialization
    %disp(segmat(fix((r-1)/8)+1,mod(r-1,8)+1)==1&&(visited(r)==0))
    if l~=0
        if segmat(fix((l-1)/8)+1,mod(l-1,8)+1)==1&&(visited(l)==0&&a(1)==0)
            next=l;%disp('a');
            ch='l';
        end
    end
    if r~=0
        if segmat(fix((r-1)/8)+1,mod(r-1,8)+1)==1&&(visited(r)==0&&a(2)==0)
            next=r;%disp('b');
            ch='r';
        end
    end
    if u~=0
        if (segmat(fix((u-1)/8)+1,mod(u-1,8)+1)==1)&&visited(u)==0&&a(3)==0
            next=u;%disp('c');
            ch='u';
        end
    end
    if d~=0
        if segmat(fix((d-1)/8)+1,mod(d-1,8)+1)==1&&visited(d)==0&&a(4)==0
            next=d;%disp('d');
            ch='d';
        end
    end
    
    if(ch=='l')
        a(1)=1;
    elseif(ch=='r')
        a(2)=1;
    elseif(ch=='u')
        a(3)=1;
    elseif(ch=='d')
        a(4)=1;
    end
    
    %disp(next);
    %disp(current);
    if(next==0)
        visited(current)=1;
    end
    if(next~=0)
    if(dist(next)>dist(current)+1)
        dist(next)=dist(current)+1;
        parent(next)=current;
    end
    end
    %disp 1;
    min_d=intmax;
    pc=current;
    for i=1:64
        if((dist(i)<min_d)&&(visited(i)==0))
            min_d=dist(i);
            current=i;
        end
    end
    
    if(current~=pc)
        a=[0,0,0,0];
    end
    
    %dist
    %visited
    %next
    %current
    
end

x=node2;
patharray=[x];
while parent(x)~=0
    patharray=horzcat(parent(x),patharray);
    x=parent(x);
end


end

