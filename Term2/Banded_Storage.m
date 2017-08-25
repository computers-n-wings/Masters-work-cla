function Ab = Banded_Storage(A, kl, ku, n)
    Ab = zeros(ku+kl+1, n);
    Ab(ku+1, :) = diag(A);
    for i = 1 : ku
        Ab(ku+1-i, i+1:end) = diag(A, i);
    end
    for j = 1 : kl
        Ab(ku+1+1, 1:n-i) = diag(A, -i);
    end
end
    