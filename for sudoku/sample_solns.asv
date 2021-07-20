function [num] = sample_solns(n)
check = [];
check(:,:,1) = zeros(9,9);
counter = 2;
for a = 1:n
        M = randi([1,9],9);
       [M_opt, num_prob, prop_of_probs] = sudokuextra(3,M);
        M_opt = standardize(M_opt);
        M_opt;
        
        same = 0;
        for i = 1:counter-1
            if M_opt == check(:,:,i)
                same = same + 1;
            end     
        end
        if same == 0
            check(:,:,counter) = M_opt;
            counter = counter + 1;
        end
        
        counter-2
        
        
end
num = counter - 2
end

            
              
                
        