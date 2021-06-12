function [group] = group_soln(M_opt)
group = 0;
type = 'unknown';
%if group stays 0 we have a problem
%subrow permutations may be checked like this
guide1 = M_opt(1,1:3);
sum_subrow = 0;
dir_of_double = 0;
parfor i = 1:9
    w = M_opt(i,1:3);
    x = M_opt(i,4:6);
    y = M_opt(i,7:9);
    
    check1 = ismember(guide1,x);
    check2 = ismember(guide1,y);
    check3 = ismember(guide1,w);
    
    soln1 = prod(check1);
    soln2 = prod(check2);
    soln3 = prod(check3);
    dir_of_double = dir_of_double + soln3;
    sum_subrow = sum_subrow + soln1 + soln2 + soln3;
end

%subcol perutations checked like this
guide2 = M_opt(1:3,1);
sum_subcol = 0;

parfor j = 1:9
    w = M_opt(1:3,j);
    x = M_opt(4:6,j);
    y = M_opt(7:9,j);
    
    check1 = ismember(guide2,x);
    check2 = ismember(guide2,y);
    check3 = ismember(guide2,w);
    
    soln1 = prod(check1);
    soln2 = prod(check2);
    soln3 = prod(check3);
    sum_subcol = sum_subcol + soln1 + soln2 + soln3;
end


if sum_subcol == 3 & sum_subrow == 3
    if dir_of_double == 3
        type = 'double permutation col';
        group = 1;
    end
    if dir_of_double == 1
        type = 'double permutation row';
        group = 2;
    end
    
end

if sum_subcol == 9 & sum_subrow == 3
    type = 'single permutation col';
    group = 3;
end

if sum_subrow == 9 & sum_subcol == 3
    type = 'single permutation row';
    group = 4;
end

if sum_subrow == 9 & sum_subcol == 9
    type = 'double permutation throughout';
    group = 5;
end




end