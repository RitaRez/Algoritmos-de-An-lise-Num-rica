function [a,det,pivot] = lu_decomposition(a)
    % a = [1 -3 2; -2 8 -1; 4 -6 5];
    n = length(a); a_max = 0; pivot = 1:n; det = 1;
    for i=1:n-1
        pivot(i) = i;
    end
    
    for j = 1:n-1   
        p = j;
        a_max = abs(a(j,j)); 
        for k = j + 1:n
            if abs(a(k,j)) > a_max
                a_max = abs(a(k,j));
                p = k;
            end
        end
        if p ~= j
            for k = 1:n
                t = a(j,k);
                a(j,k) = a(p,k);
                a(p,k) = t;
            end    
            t = pivot(j);
            pivot(j) = pivot(p);
            pivot(p) = t; 
        end    
        det = det * a(j,j);
        if abs(a(j,j)) ~= 0
            % Gauss elimination
            r = 1/a(j,j);
            for i = j+1:n
                m = a(i,j) * r;
                a(i,j) = m;
                for k = j+1:n
                    a(i,k) = a(i,k) - m * a(j,k);
                end    
            end    
        end   
    end
    det = det * a(n,n);
    return [a,det,pivot]
end