function [soln1, soln2,soln3, soln4, soln5, soln6, soln7, soln8] = types(M)

for i = 1:3
    for j = 1:3
        block = M( (1+3*(i-1)):(3+3*(i-1)),(1+3*(j-1)):(3+3*(j-1)) );
        
        
        if block(1) == 1
            B1 = block;
        elseif block(1) == 2
            B2 = block;
        elseif block(1) == 3
            B3 = block;
        elseif block(1) == 4
            B4 = block;
        elseif block(1) == 5
            B5 = block;
        elseif block(1) == 6
            B6 = block;
        elseif block(1) == 7
            B7 = block;
        elseif block(1) == 8
            B8 = block;
        else 
            B9 = block;
        end
        
           
    end
end
soln1 = [B1, B8, B6; B9, B4, B2; B5, B3, B7]
soln2 = [B1, B9, B5; B8, B4, B3; B6, B2, B7]

soln3 = [B1, B5, B9; B6, B7, B2; B8, B3, B4]
soln4 = [B1, B6, B8; B5, B7, B3; B9, B2, B4]

soln5 = [B1, B8, B6; B5, B3, B7; B9, B4, B2]
soln6 = [B1, B5, B9; B8, B3, B4; B6, B7, B2]

soln7 = [B1, B9, B5; B6, B2, B7; B8, B4, B3]
soln8 = [B1, B6, B8; B9, B2, B4; B5, B7, B3]

fileID = fopen('solns.txt','w');
fprintf(fileID, '8 seperate solutions with 24 syms \n\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln1');
fprintf(fileID, '\n\n\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln2');
fprintf(fileID, '\n\n\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln3');
fprintf(fileID, '\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln4');
fprintf(fileID, '\n\n\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln5');
fprintf(fileID, '\n\n\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln6');
fprintf(fileID, '\n\n\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln7');
fprintf(fileID, '\n\n\n');
fprintf(fileID,'%d %d %d  %d %d %d  %d %d %d \n',soln8');
fclose(fileID);
end
