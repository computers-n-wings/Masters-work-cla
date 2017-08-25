%% James Gross
% 01305321

%Initial setup
%Want to view as many decimals as possible
%Clear workspace to avoid clutter
format long
clear

p = 14;
alph = 10^(-p);
n = 4;
x = ones(n,1);

A = [alph, -1, -1, -1; 1, 1, -1, -1; 0, 1, 1 -1; 0, 0, 1, 1];
b = [alph - 3; 0; 1; 2];



[L,U,P] = lu(sparse(A),0);
A1 = gefa(A,n);
L = abs(full(L));
U = abs(full(U));
format long
x1 = gesl(A1, n, b)
conda = cond(A, inf)
re = max(abs(x - x1)) / max(abs(x))
rr = max(abs(A*x1 - b)) / max(abs(b))
lu = norm(L*U, inf)
alph_alg = lu / norm(A, inf)
eps

