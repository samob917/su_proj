function [answer] = check(M,indices)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

for i=1:3
    for j=1:3
        for k=1:3
            for ell=1:3
                vecM((i-1)*3^3+(j-1)*3^2+(k-1)*3^1+(ell-1)*3^0+1)=M((i-1)*3+(k-1)+1,(j-1)*3+(ell-1)+1);
            end
        end
    end
end
strip=zeros(3,3,3,3);
for a=1:3
    for b=1:3
        for c=1:3
            for d=1:3
                strip(c,d,a,b)=vecM((a-1)*3^(4-indices(1))+(b-1)*3^(4-indices(2))+(c-1)*3^(4-indices(3))+(d-1)*3^(4-indices(4))+1);
            end
        end
    end
end

answer=1;
for x=1:3
    for y=2:3
        for z=1:3
            piece=sort(strip(z,:,x,1));
            temp=zeros(1,3);
            for w=1:3
                if 3==sum(piece==sort(strip(w,:,x,y)))
                    temp(w)=1;
                end
            end
            if ~(temp(1)||temp(2)||temp(3))
                answer=0;
            end
        end
    end
end


end

