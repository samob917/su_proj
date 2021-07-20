function [types] = classify(Array)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

types=zeros(1,5);
[~,~]=size(Array);
for i=1:1
    answer=checkall(Array(:,:))
    for j=1:4
        temp=((answer(:,1)==j)|(answer(:,4)==j))==answer(:,5);
        if sum(temp)==24
            types(j)=types(j)+1;
        end
    end
    if sum(answer(:,5))==24
        types(5)=types(5)+1;
    end
end



end

