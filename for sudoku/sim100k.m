function [results] = sim100k(n)
count_unknown = 0;
count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;
count24_super = 0;


parfor a = 1:n
    M = randi([1,9],9);
    [M_opt, num_prob, prop_of_probs] = sudokuextra(3,M);
    M_opt = standardize(M_opt)
    M_opt
    
    b = checkall(M_opt);
    
    if b == 24
        count24_super = count24_super + 1;
    elseif b == 12 && check(M_opt, [1 2 3 4]) == 1 && check(M_opt, [2 3 4 1])
        count1 = count1 + 1
    elseif b == 12 && check(M_opt, [3 4 1 2]) == 1 && check(M_opt, [2 3 4 1])
        count2 = count2 + 1
    elseif b == 12 && check(M_opt, [3 4 1 2]) == 1 && check(M_opt, [2 1 4 3])
        count3 = count3 + 1
    elseif b == 12 && check(M_opt, [4 1 2 3]) == 1 && check(M_opt, [2 1 3 4])
        count4 = count4 + 1
    else 
        count_unknown = count_unkown + 1;
    end
end

    
    results = [count_unknown,count1, count2, count3, count4, count24_super];
        
    




end
