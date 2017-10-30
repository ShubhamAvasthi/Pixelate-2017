function [ ] = orient( angle,com )
if(angle>5&&angle<355)
    if(angle<=180)
        fwrite(com,'c');
    else
        fwrite(com,'a');
    end
end


end

