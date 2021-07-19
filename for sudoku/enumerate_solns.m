function [final] = enumerate_solns(n,m)
tic

matrix_of_solutions = zeros(9,9,500,n);


parfor cell_spots = 1:n
    
    poss_solns = []
    empty_cell = 1;
    for a = 1:500
        poss_solns(:,:,a) = zeros(9,9);
    end
    
    for i = 1:m
        %creates a solution
        M = randi([1,9],9);
        [M_opt, num_prob, prop_of_probs] = sudokuextra(3,M);
        M_opt = standardize(M_opt);
        M_opt;
        
        %counter counts number of equicalent cells (should be 1 or 0)
        counter = 0;
        
        for j = 1:500
            if M_opt == poss_solns(:,:,j)
                counter = counter + 1;
            end
        end
        %adds new solution if it exists
        if counter == 0
            poss_solns(:,:, empty_cell) = M_opt
            empty_cell = empty_cell + 1;
        end
        
    end
    
    
    num_solns = 0;
    for l = 1:500
        if poss_solns(:,:,l) ~= zeros(9,9)
            num_solns = num_solns + 1;
        end
    end
    %now I have a list of unique solns
    matrix_of_solutions(:,:,:,cell_spots) = poss_solns
    num_solns
end



matrix_of_solutions;
[n,m,p,g]=size(matrix_of_solutions);
a=reshape(matrix_of_solutions,n,[],1);
b=reshape(a(:),n*m,[])';
c=unique(b,'rows','stable')';
fin_solution = reshape(c,n,m,[]);

fin_solution;
[x,y,z] = size(fin_solution);
final = z-1;
toc

final

end