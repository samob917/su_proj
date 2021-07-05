function [m_standardized] = standardize_weird(m_opt)
A = m_opt;
[rows,cols] = size(m_opt);
B = m_opt(1:3,1:3);
m_standardized = m_opt;

for m=1:9
    X = A== B(m);
    
    for i=1:rows
        for j=1:cols
            if X(i,j) == 1
                m_standardized(i,j) = m;
            end
        end
    end
end







end