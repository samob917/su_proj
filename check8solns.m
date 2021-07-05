A1 = [1 4 7; 2 5 8; 3 6 9]'
A2 = [2 5 8; 3 6 9 ; 1 4 7]'
A3 = [3 6 9; 1 4 7; 2 5 8]'
A4 = [4 7 1; 5 8 2; 6 9 3]'
A5 = [5 8 2; 6 9 3; 4 7 1]'
A6 = [6 9 3; 4 7 1; 5 8 2]'
A7 = [7 1 4; 8 2 5; 9 3 6]'
A8 = [8 2 5; 9 3 6; 7 1 4]'
A9 = [9 3 6; 7 1 4; 8 2 5]'


soln1 = [A1 A8 A6; A9 A4 A2; A5 A3 A7]
soln1t = soln1'
soln2 = [A1 A5 A9; A6 A7 A2; A8 A3 A4]
soln2t = soln2'
soln3 = [A1 A9 A5; A6 A2 A7; A8 A4 A3]
soln3t = soln3'
soln4 = [A1 A5 A9; A8 A3 A4; A6 A7 A2]
soln4t = soln4'

sum1 = sum(index_loops(soln1))
sum2 = sum(index_loops(soln1t))
sum3 = sum(index_loops(soln2))
sum4 = sum(index_loops(soln2t))
sum5 = sum(index_loops(soln3))
sum6 = sum(index_loops(soln3t))
sum7 = sum(index_loops(soln4))
sum8 = sum(index_loops(soln4t))

[a,b,c1] = sudokuextra(3,soln1);
c1
[a,b,c1t] = sudokuextra(3,soln1t);
c1t
[a,b,c2] = sudokuextra(3,soln2);
c2
[a,b,c2t] = sudokuextra(3,soln2t);
c2t
[a,b,c3] = sudokuextra(3,soln3);
c3
[a,b,c3t] = sudokuextra(3,soln3t);
c3t
[a,b,c4] = sudokuextra(3,soln4);
c4
[a,b,c4t] = sudokuextra(3,soln4t);
c4t

