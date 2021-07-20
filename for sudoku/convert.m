function [output] = convert(M,direction)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if direction==1
    output=zeros(1,81);
else
    output=zeros(9,9);
end
for i=1:3
    for j=1:3
        for k=1:3
            for ell=1:3
                if direction==1
                    output((i-1)*3^3+(j-1)*3^2+(k-1)*3+ell)=M((i-1)*3+k,(j-1)*3+ell);
                else
                    output((i-1)*3+k,(j-1)*3+ell)=M((i-1)*3^3+(j-1)*3^2+(k-1)*3+ell);
                end
            end
        end
    end
end






end

