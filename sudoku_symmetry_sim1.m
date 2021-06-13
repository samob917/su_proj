function [prop_of_probs, counts_of_types] = sudoku_symmetry_sim1(n)
count0 = 0;
count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;
count5 = 0;

%n is the number of simulations you want to run
num_prob_sum = 0;
mean_prop_prob = 0;
tic;
parfor i = 1:n
    M = randi([1,9],9);
    [m_opt, num_prob, prop_prob] = sudokuextra(3,M);
    num_prob_sum = num_prob_sum + num_prob;
    mean_prop_prob = mean_prop_prob + prop_prob;
    m_opt;
    a = group_soln(m_opt);
    if a == 0
        count0 = count0 + 1;
    end
    if a ==1
        count1 = count1 + 1;
    end
    if a == 2
        count2 = count2 + 1;
    end
    if a == 3
        count3 = count3 + 1;
    end
    if a == 4
        count4 = count4 + 1;
    end
    if a == 5 
        count5 = count5+ 1;
    end
    
    
    i
    
    
end
toc;

counts_of_types = [count0, count1, count2, count3, count4, count5];

prop_of_probs = mean_prop_prob/n;
    
    