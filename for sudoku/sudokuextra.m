function [M_opt, num_prob, prop_of_probs] = sudokuextra(n,M)
%sudokuextra solves a sudoku puzzle with extra constraints
%   accepts a n^2 by n^2 matrix M and determines the complete sudoku puzzle
%   with as many entries equal to M as possible


e = n^4*7;
v = n^6;
A = zeros(e,v);
b = ones(e,1);
row = 1;
indexhelp = zeros(v, 6);

% creates a matrix indexhelp to access indices i, j, k, l, m for any
% position in the x vector
for i=1:n
    for j=1:n
        for k=1:n
            for l=1:n
                for m =1:n^2
                   xpos = m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5;
                   indexhelp(xpos,:) = [xpos i j k l m];
                end
            end
        end
    end
end

% every entry is exactly one integer
for i=1:n
    for j=1:n
        for k=1:n
            for l=1:n
                for m =1:n^2
                    A(row, m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5)=1;
                end
                row = row+1;
            end
        end
    end
end

% every integer appears once in every mini tic-tac-toe
for i=1:n
    for j=1:n
        for m=1:n^2
            for k=1:n
                for l=1:n
                    A(row, m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5)=1;
                end
            end
            row = row+1;
        end
    end
end

% every integer appears once in every row
for i=1:n
    for k=1:n
        for m=1:n^2
            for j=1:n
                for l=1:n
                    A(row, m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5)=1;
                end
            end
            row = row+1;
        end
    end
end

% every integer appears once in every column
for j=1:n
    for l=1:n
        for m=1:n^2
            for i=1:n
                for k=1:n
                    A(row, m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5)=1;
                end
            end
            row = row+1;
        end
    end
end


% extra constraint 1
for i=1:n
    for l=1:n
        for m=1:n^2
            for j=1:n
                for k=1:n
                    A(row, m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5)=1;
                end
            end
            row = row+1;
        end
    end
end

% extra constraint 2
for j=1:n
    for k=1:n
        for m=1:n^2
            for i=1:n
                for l=1:n
                    A(row, m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5)=1;
                end
            end
            row = row+1;
        end
    end
end

% extra constraint 3
for k=1:n
    for l=1:n
        for m=1:n^2
            for i=1:n
                for j=1:n
                    A(row, m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5)=1;
                end
            end
            row = row+1;
        end
    end
end

% converts matrix M to x vector
M_x = zeros(v,1);
for i=1:n
    for j=1:n
        for k=1:n
            for l=1:n
                x = (i-1)*n + k;
                y = (j-1)*n + l;
                m = M(x,y);
                xpos = m + (l-1)*n^2 + (k-1)*n^3 + (j-1)*n^4 + (i-1)*n^5;
                if m~=0
                    M_x(xpos, 1) = 1;
                end
            end
        end
    end
end

% runs integer linear program
LB1 = zeros(v,1);
UB1 = ones(v,1);
c = -1*M_x;
intcon = [1:v];
options = optimoptions('intlinprog','Display','off');
[xopt, ~] = intlinprog(c,intcon,[],[],A,b,LB1,UB1,[],options);

% rebuild M_opt from xopt
M_opt = zeros(n^2, n^2);
for index=1:v
    if xopt(index) >0.9
        indexvec = indexhelp(index, :);
        i = indexvec(2);
        j = indexvec(3);
        k = indexvec(4);
        l = indexvec(5);
        m = indexvec(6);
        M_opt((i-1)*n+k, (j-1)*n +l) = m;
    end
end
num_prob = sum(sum(~((M==0)|(M == M_opt))));
prop_of_probs = num_prob / (3^4);

end