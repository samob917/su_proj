function [m_changed] = index_loops(M)
vector_of_success = [];
A = perms(1:4);
for i= 1:length(A)
    key = A(i,:);
    sum = 0;
    for m = 1:9
        comparison = [];
        for I=1:3
            for J=1:3
                for K = 1:3
                    %first one:
                    if key(1) == 1
                        S1 = M((1+(3*(I-1))):(3+(3*(I-1))),:);
                    elseif key(1) == 2
                        S1 = M(:, (1+(3*(I-1))):(3+(3*(I-1))));
                    elseif key(1) == 3
                        S1 = M(I:3:end,:);
                    elseif key(1) == 4
                        S1 = M(:,I:3:end);
                    end
                    
                    %second one:
                    [rows, cols] = size(S1);
                    if key(2) == 1
                        if rows == 3
                            S12 = S1(J,:);
                        else
                            S12 = S1((1+(3*(J-1))):(3+(3*(J-1))),:);
                        end
                    elseif key(2) == 2
                        if cols == 3
                            S12 = S1(:,J);
                        else
                            S12 = S1(:, (1+(3*(J-1))):(3+(3*(J-1))));
                        end
                    elseif key(2) == 3
                        S12 = S1(J:3:end, :);
                    elseif key(2) == 4
                        S12 = S1(:,J:3:end);
                    end
                    
                    %third:
                    [rows, cols] = size(S12);
                    if key(3) == 1
                        if rows == 3
                            S123 = S12(K,:);
                        else
                            S123 = S12((1+(3*(K-1))):(3+(3*(K-1))),:);
                        end
                    elseif key(3) == 2
                        if cols == 3
                            S123 = S12(:,K);
                        else
                            S123 = S12(:, (1+(3*(K-1))):(3+(3*(K-1))));
                        end
                    elseif key(3) == 3
                        S123 = S12(K:3:end, :);
                    elseif key(3) == 4
                        S123 = S12(:,K:3:end);
                    end
                    S123;
                    if ismember(m, S123)
                        stored = S123;
                        
                        if isequal(comparison,[])
                            comparison = sort(stored);
                            sum = sum+1;
                        else
                            if isequal(comparison, sort(stored))
                                sum = sum + 1;
                            end
                            
                        end
                    end
                    
                end
            end
        end
    end
    if sum == 81
        vector_of_success = [vector_of_success 1];
    else
        vector_of_success = [vector_of_success 0];
    end
    
end
m_changed = vector_of_success;
end






