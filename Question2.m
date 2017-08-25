format long
clear

p = 14;
alph = 10^(-p);
n = 4;

A = [alph, -1, -1, -1; 1, 1, -1, -1; 0, 1, 1 -1; 0, 0, 1, 1];
b = [alph - 3; 0; 1; 2];
x = ones(4,1);

[A1,P] = gefapp(A, 4);
x1 = geslpp(A1, 4 ,b, P);


U = abs(triu(A1));
L = abs(tril(A1));
for i = 1 : n
    L(i, i) = 1;
end

conda = cond(A, inf);
re = max(abs(x - x1)) / max(abs(x));
rr = max(abs(A*x1 - b)) / max(abs(b));
lu = norm(L*U, inf);
alph_alg = lu / norm(A, inf);
