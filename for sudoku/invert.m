function [Mout] = invert(M,new)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

vecM=zeros(1,81);
Mout=zeros(9,9);
for i=1:3
    for j=1:3
        for k=1:3
            for ell=1:3
                vecM((i-1)*3^(4-new(1))+(j-1)*3^(4-new(2))+(k-1)*3^(4-new(3))+(ell-1)*3^(4-new(4))+1)=M((i-1)*3+(k-1)+1,(j-1)*3+(ell-1)+1);
            end
        end
    end
end
for i=1:3
    for j=1:3
        for k=1:3
            for ell=1:3
                Mout((i-1)*3+(k-1)+1,(j-1)*3+(ell-1)+1)=vecM((i-1)*3^3+(j-1)*3^2+(k-1)*3^1+(ell-1)*3^0+1);
            end
        end
    end
end


Mout;

end

