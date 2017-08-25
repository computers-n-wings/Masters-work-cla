function ab = gefab(ab, n, ml, mu)

m = mu + 1;

for k = 1:n-1
    lm = min(ml, n-k);
    ab(m+1:m+lm,k) = ab(m+1:m+lm,k)/ab(m,k);
    ju = min(mu+k, n);
    mm = m;
    
    for j = k+1:ju
        mm = mm-1;
        ab(mm+1:mm+lm,j) = ab(mm+1:mm+lm,j)-ab(mm,j)*ab(m+1:m+lm,k);
    end
    
end
