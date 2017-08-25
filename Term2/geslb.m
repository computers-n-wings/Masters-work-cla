function x = geslb(ab, n, ml, mu, b)

m = mu+1;

if ml ~= 0
    for k = 1:n-1
        lm = min(ml,n-k);
        b(k+1:k+lm) = b(k+1:k+lm)-b(k)*ab(m+1:m+lm,k);
    end
end

for k = n:-1:1
    b(k) = b(k)/ab(m,k);
    lm = min(k,m)-1;
    b(k-lm:k-1) = b(k-lm:k-1)-b(k)*ab(m-lm:m-1,k);
end

x = b;