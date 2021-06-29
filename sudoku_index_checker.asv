function [group_by_indices] = sudoku_index_checker(M)

%1. IKJL
sum1 = 0;
parfor m = 1:9
    for I = 1:3
        comparison = [];
        for K = 1:3
            J1 = M(I*K,1:3);
            J2 = M(I*K,4:6);
            J3 = M(I*K,7:9);
            if ismember(m, J1)
                stored = J1;
            elseif ismember(m, J2)
                stored = J2;
            elseif ismember(m, J3)
                stored = J3;
            end
            if isequal(comparison,[])
                comparison = sort(stored);
                sum1 = sum1+1;
            else
                if isequal(comparison, sort(stored));
                    sum1 = sum1 + 1;
                end
            end
        end
    end
end
sum1


%2. IJKL
sum2 = 0;
for m = 1:9
    for I = 1:3
        comparison = [];
        for J = 1:3
            tictactoe = M( (1+3*(I-1)):(3+3*(I-1)),(1+3*(J-1)):(3+3*(J-1)));
            K1 = tictactoe(1,:);
            K2 = tictactoe(2,:);
            K3 = tictactoe(3,:);
            if ismember(m, K1)
                stored = K1;
            elseif ismember(m, K2)
                stored = K2;
            elseif ismember(m, K3)
                stored = K3;
            end
            if isequal(comparison,[])
                comparison = sort(stored);
                sum2 = sum2+1;
            else
                if isequal(comparison, sort(stored));
                    sum2 = sum2 + 1;
                end
            end
        end
    end
end
sum2
    
            
%3.IJLK
sum3 = 0;
for m = 1:9
    for I = 1:3
        comparison = [];
        for J = 1:3
            tictactoe = M( (1+3*(I-1)):(3+3*(I-1)),(1+3*(J-1)):(3+3*(J-1)));
            L1 = tictactoe(:,1);
            L2 = tictactoe(:,2);
            L3 = tictactoe(:,3);
            if ismember(m, L1)
                stored = L1;
            elseif ismember(m, L2)
                stored = L2;
            elseif ismember(m, L3)
                stored = L3;
            end
            if isequal(comparison,[])
                comparison = sort(stored);
                sum3 = sum3+1;
            else
                if isequal(comparison, sort(stored));
                    sum3 = sum3 + 1;
                end
            end
        end
    end
end
sum3


%4. IKLJ 
sum4 = 0;
for m = 1:9
    for I = 1:3
        comparison = [];
        for K = 1:3
            L1 = M(I*K,1:3:end);
            L2 = M(I*K,2:3:end);
            L3 = M(I*K,3:3:end);
            if ismember(m, L1)
                stored = L1;
            elseif ismember(m, L2)
                stored = L2;
            elseif ismember(m, L3)
                stored = L3;
            end
            if isequal(comparison,[])
                comparison = sort(stored);
                sum4 = sum4+1;
            else
                if isequal(comparison, sort(stored));
                    sum4 = sum4 + 1;
                end
            end
        end
    end
end
sum4

%5. ILJK
sum5=0;
for m = 1:9
    for I = 1:3
        comparison = [];
        for L = 1:3
            J1 = M((1+(3*(I-1))):(3+(3*(I-1))),(L));
            J2 = M((1+(3*(I-1))):(3+(3*(I-1))),(L+3));
            J3 = M((1+(3*(I-1))):(3+(3*(I-1))),(L+6));
            if ismember(m, J1)
                stored = J1;
            elseif ismember(m, J2)
                stored = J2;
            elseif ismember(m, J3)
                stored = J3;
            end
            if isequal(comparison,[])
                comparison = sort(stored);
                sum5 = sum5+1;
            else
                if isequal(comparison, sort(stored));
                    sum5 = sum5 + 1;
                end
            end
        end
    end
end
sum5


%6. ILKJ
sum6=0;
for m = 1:9
    for I = 1:3
        comparison = [];
        for L = 1:3
            K1 = M((1+(3*(I-1))), L:3:end);
            K2 = M((2+(3*(I-1))), L:3:end);
            K3 = M((3+(3*(I-1))), L:3:end);
            if ismember(m, K1)
                stored = K1;
            elseif ismember(m, K2)
                stored = K2;
            elseif ismember(m, K3)
                stored = K3;
            end
            if isequal(comparison,[])
                comparison = sort(stored);
                sum6 = sum6+1;
            else
                if isequal(comparison, sort(stored));
                    sum6 = sum6 + 1;
                end
            end
        end
    end
end
sum6


%7. JIKL
sum7=0;
for m = 1:9
    for J = 1:3
        comparison = [];
        for I = 1:3
            tictactoe = M( (1+3*(I-1)):(3+3*(I-1)),(1+3*(J-1)):(3+3*(J-1)));
            L1 = tictactoe(:,1);
            L2 = tictactoe(:,2);
            L3 = tictactoe(:,3);
            






end