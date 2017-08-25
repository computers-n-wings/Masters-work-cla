function b = Banded_Matrix_Multiply(Ab, x, n, kl, ku)
    b = zeros(size(x));
    bnd1 = ku;
    for i = 1:bnd1
        for j = 1:ku
            pnt1 = ku+2;
            pnt2 = j-1;
            b(j) = b(j) + Ab(pnt1-i, pnt2+i)*x(pnt2+i);
        end
    end
    bnd1 = ku+kl+1;
    for i = 1:bnd1
        for j = ku+1:n-kl
            pnt1 = kl+ku+2;
            pnt2 = j-2;
            b(j) = b(j) + Ab(pnt1-i, pnt2+i)*x(pnt2+i);
        end
    end
    bnd1 = kl+1;
    for i = 1:bnd1
        for j = 1:kl
            pnt1 = kl+ku+2;
            pnt2 = n-kl-1;
            b(pnt2+j+kl) = b(pnt2+j+kl) + Ab(pnt1-i, pnt2+i)*x(pnt2+i);
        end
    end
end