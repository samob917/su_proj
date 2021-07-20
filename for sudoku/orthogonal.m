function [answer] = orthogonal(A,B)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

answer=1;
[~,n]=size(A);
for i=1:n
    for j=1:n
        temp=0;
        for a=1:n
            for b=1:n
                if (A(a,b)==i)&&(B(a,b)==j)
                    temp=temp+1;
                end
            end
        end
        if temp==0
            answer=0;
        end
    end
end
         
        


end

