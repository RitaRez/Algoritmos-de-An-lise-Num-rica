function [l, det, error] = cholesky_decomposition(a)
    %a = [4 -2 2; -2 10 7; 2 -7 30];
    n = length(a);
    l = zeros(n,n);
    det = 1;
    error = 0;
    for j = 1:n  
        soma = 0;
        for k = 1: j - 1
            soma = soma + l(j,k)*l(j,k);
        end
        t = a(j,j) - soma;
        det = det * t;
        if t<= 0
            error("A matriz não e definida positiva");
        end
        l(j,j) = sqrt(t);
        r = 1/l(j,j);
        for i = j +1:n
            soma = 0;
            for k = 1:j-1
                soma = soma +l(i,k)*l(j,k);
            end
            l(i,j) = (a(i,j) - soma)*r;
        end
    end
end