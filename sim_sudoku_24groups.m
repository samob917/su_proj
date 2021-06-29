function [A] = sim_sudoku_24groups(n)
A = [];
parfor w = 1:n
    M = randi([1,9],9);
   [m_opt, num_prob, prop_prob] = sudokuextra(3,M);
   vec_of_success = index_loops(m_opt);
   A = [A; vec_of_success];
   if sum(vec_of_success) == 24
       m_opt
       m_standardized = standardize(m_opt);
       m_standardized
   end
end
A;
csvwrite("symmetry24.csv", A);
    


end