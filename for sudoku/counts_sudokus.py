# -*- coding: utf-8 -*-
"""
Created on Thu Jul 15 16:28:06 2021

@author: Roy Siegelmann
"""


# N is the size of the matrix 
N = 9
 
# A utility function to print grid
def printing(arr):
    for i in range(N):
        for j in range(N):
            print(arr[i][j], end = " ")
        print()
 
# Check if you can assign to a center spot
def isSafe(grid, macro_row, micro_row, macro_col, micro_col, num):
   
    # Check for {1,2}-bijectivity
    startRow = 3*(macro_row-1)
    startCol = 3*(macro_col-1)
    for i in range(3):
        for j in range(3):
            if grid[i + startRow][j + startCol] == num:
                return False
    
    
    # Check for {1,3}-bijectivity
    for x in range(9):
        if grid[3*(macro_row-1)+(micro_row-1)][x] == num:
            return False
        
    # Check for {1,4}-bijectivity
    startRow = 3*(macro_row-1)
    startCol = micro_col-1
    for i in range(3):
        for j in range(3):
            if grid[i + startRow][3*j + startCol] == num:
                return False
 
    # Check for {2,3}-bijectivity
    startRow = micro_row-1
    startCol = 3*(macro_col-1)
    for i in range(3):
        for j in range(3):
            if grid[3*i + startRow][j + startCol] == num:
                return False
    
    # Check for {2,4}-bijectivity
    for x in range(9):
        if grid[x][3*(macro_col-1)+(micro_col-1)] == num:
            return False

    # Check for {3,4}-bijectivity
    startRow = micro_row-1
    startCol = micro_col-1
    for i in range(3):
        for j in range(3):
            if grid[3*i + startRow][3*j + startCol] == num:
                return False
            
    return True
    
 
def solveSuduko(grid, row, col,solutions):
   
    # If we reached the end successfully, end
    if (row == N - 1 and col == N):
        return storage(grid, solutions)
           
       
    # If reaching the end, continue to next row
    if col == N:
        row += 1
        col = 0
 
    # If current value is assigned, contiune to next column
    if grid[row][col] > 0:
        return solveSuduko(grid, row, col + 1,solutions)
    for num in range(1, N + 1, 1):
        
        
        # Check if we can place the number in a given spot
        mr = int((row - row%3)/3 + 1)
        mc = int((col - col%3)/3 + 1)
        if isSafe(grid, mr , row%3+1, mc , col%3+1, num):
           
            # Assigning the current number to the current place
            grid[row][col] = num
            
           
            # Checking next column
            if solveSuduko(grid, row, col + 1, solutions):
                return True
 
        # Try with a different number
        grid[row][col] = 0
    return False


#stores already determined puzzles
def storage(grid, solutions):
    if len(solutions) == 0:
        solutions.append(grid)
        return True
    else:
        counter = 0
        for i in range(len(solutions)):
            if grid == solutions[i]:
                counter += 1
        if counter == 0:
            solutions.append(grid)
            return True
        else:
            return False
            
    
    
 
# Driver Code
 
ok = True
solutions = []
# 0 means unassigned cells
grid = [[1, 2, 3, 0, 0, 0, 0, 0, 0],
        [4, 5, 6, 0, 0, 0, 0, 0, 0],
        [7, 8, 9, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]]

counter = 0
while ok:
    if (solveSuduko(grid, 0, 0, solutions)):
        printing(grid)
        counter += 1
        grid = [[1, 2, 3, 0, 0 , 0, 0, 0, 0],
        [4, 5, 6, 0, 0, 0, 0, 0, 0],
        [7, 8, 9, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0]]
        print(len(solutions))
    else:
        print(solutions)
        ok = False

        
print(counter)
print(len(solutions))

check = [
 [    1,     2,     3,     5,     6,     4,     8,     9,     7],
 [    4,     5,     6,     9,     7,     8,     2,     3,     1],
 [    7,     8,     9,     3,     1,     2,     6,     4,     5],
 [    9,     7,     8,     2,     3,     1,     4,     5,     6],
 [    3,     1,     2,     6,     4,     5,     7,     8,     9],
 [    5,     6,     4,     8,     9,     7,     1,     2,     3],
 [    6,     4,     5,     7,     8,     9,     3,     1,     2],
 [    8,     9,     7,     1,     2,     3,     5,     6,     4],
 [    2,     3,     1,     4,     5,     6,     9,     7,     8]]

superduper1 =[
[1, 2, 3,  8, 9, 7,  6, 4, 5],
[4, 5, 6,  2, 3, 1,  9, 7, 8], 
[7, 8, 9,  5, 6, 4,  3, 1 ,2],
[9, 7, 8,  4, 5, 6,  2, 3, 1], 
[3, 1, 2,  7, 8, 9, 5, 6, 4], 
[6, 4, 5,  1, 2, 3,   8, 9, 7  ], 
[5, 6, 4 ,  3, 1, 2,  7, 8, 9 ], 
[8, 9, 7,  6, 4 ,5,  1, 2, 3], 
[2, 3, 1,  9, 7, 8,  4, 5, 6]]

hm = [[1, 2, 3, 9, 7, 8, 6, 4, 5], [4, 5, 6, 3, 1, 2, 8, 9, 7], [7, 8, 9, 5, 6, 4, 2, 3, 1], [8, 9, 7, 4, 5, 6, 3, 1, 2], [2, 3, 1, 7, 8, 9, 5, 6, 4], [6, 4, 5, 1, 2, 3, 9, 7, 8], [5, 6, 4, 2, 3, 1, 7, 8, 9], [9, 7, 8, 6, 4, 5, 1, 2, 3], [3, 1, 2, 8, 9, 7, 4, 5, 6]]

for i in solutions:
    if check == i:
        print(i)
        print("true")
        break
    else:
        print("not {}".format(i))



 