function [ a ] = blueprintinfo( bpcrop ,red,green)
[x,y,z]=size(bpcrop);
%imtool(bpcrop);
R=mean(mean(red));
G=mean(mean(green));
a=['w','w','w','w','w'];
a=vertcat(a,vertcat(a,a));
for i=1:3
    for j=1:5
        m1=bpcrop(fix(x/6)*(2*i-1),fix(y/10)*(2*j-1),1);
        m2=bpcrop(fix(x/6)*(2*i-1),fix(y/10)*(2*j-1),2);
        m3=bpcrop(fix(x/6)*(2*i-1),fix(y/10)*(2*j-1),3);
        if(m1>R(1)-70&&m1<R(1)+70&&m2>R(2)-70&&m2<R(2)+70&&m3>R(3)-70&&m3<R(3)+70)
            a(i,j)='r';
        elseif(m1>G(1)-70&&m1<G(1)+70&&m2>G(2)-70&&m2<G(2)+70&&m3>G(3)-70&&m3<G(3)+70)
            a(i,j)='g';
        end
    end
end


end

