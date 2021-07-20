function [Array] = enumerate()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

vM=[1 2 3 4 5 6 7 8 9 zeros(1,72)];
for a=1:9
    NewvM=[];
    [b,~]=size(vM);
    b
    for c=1:b
        output=possibilities(vM(c,:),a);
        NewvM=[NewvM; output];
    end
    vM=NewvM;
end
[b,~]=size(vM);
Array=zeros(9,9,b);
for d=1:b
    tt=convert(vM(d,:),-1);
    Array(:,:,d)=tt;
end