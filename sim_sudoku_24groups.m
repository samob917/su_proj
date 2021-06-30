function [A, num_dif_standardized] = sim_sudoku_24groups(n)
A = [];
check_stand = 0;
parfor w = 1:n
    standard_check = [    
     1     4     7     9     3     6     5     8     2
     2     5     8     7     1     4     6     9     3
     3     6     9     8     2     5     4     7     1
     8     2     5     4     7     1     3     6     9
     9     3     6     5     8     2     1     4     7
     7     1     4     6     9     3     2     5     8
     6     9     3     2     5     8     7     1     4
     4     7     1     3     6     9     8     2     5
     5     8     2     1     4     7     9     3     6];
    M = randi([1,9],9);
   [m_opt, num_prob, prop_prob] = sudokuextra(3,M);
   vec_of_success = index_loops(m_opt);
   A = [A; vec_of_success];
   if sum(vec_of_success) == 24
       m_standardized = standardize(m_opt);
       if ~isequal(m_standardized,standard_check)
           check_stand = check_stand + 1;
       end               
   end
end
A;
csvwrite("symmetry24_2.csv", A);
num_dif_standardized = check_stand;


end