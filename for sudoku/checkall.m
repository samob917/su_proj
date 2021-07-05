function [answer] = checkall(M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

answer=zeros(24,5);
answer(:,1:4)=perms([1 2 3 4]);
for i=1:24
    answer(i,5)=check(M,answer(i,1:4));
end
answer = sum(answer(:,5));
end

