function [Mout] = standardize(M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Mout=zeros(9,9);
f=zeros(1,9);
index=0;
for i=1:3
    for j=1:3
        index=index+1;
        f(M(i,j))=index;
    end
end

for i=1:9
    for j=1:9
        Mout(i,j)=f(M(i,j));
    end
end
        


end

