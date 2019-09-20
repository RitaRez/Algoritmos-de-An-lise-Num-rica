function [result] = matrix_multiplier(a,b)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    %a = [4 -1; 2 1;0 3];
    %b = [1 -1 0; 2 0 1];
    
    [a_row,a_col] = size(a);
    [b_row, b_col] = size(b);
    
    
    result = zeros(a_row, b_col);
   
    if a_col ~= b_row || b_col ~= a_row
        error("As matrizes não podem ser multiplicadas");
    end
    for i = 1: a_row
        for j = 1: b_col
            for k = 1: b_row
                result(i,j) = result(i,j) + a(i,k)*b(k,j);
            end    
        end
    end

end