function coefficients = get_polynomial_coefficients(n, x, y)
% encontra polinomio caracteristico de uma funcao    
    
    if n < 1
        error('Grau do polinomio < 1');
    end 
    
    c = 1:n+1;
    for i = 1:n+1
        c(i) = y(i);
    end
    
    % construção das diferenças divididas
    for k = 1:n
        for i = n+1:-1:k+1
            c(i) = (c(i) - c(i-1))/(x(i)-x(i-k));
        end
    end
    
    % cálculo dos coeficientes
    for k = n:-1:1
        for i = k:n
            c(i) = c(i) - c(i+1)*x(k);
        end
    end
    
    %imprime o polinômio
    disp(c)
    coefficients = "";
    for i = length(c):-1:1
        if c(i) ~= 0
            coefficients = coefficients + c(i) + "x^" + (i-1) + " "; 
        end
    end
    
    
end 