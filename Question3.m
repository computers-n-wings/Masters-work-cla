%% James Gross
% CID: 01305321
format long
clear
%Initialise the dimensions
p = 10;
h = 1/p;
x = linspace(0,1,p+1);
%Define the bandwidth of matrix
mu = 1;
ml = 1;
n = mu+ml+1;
%Define the given parameters
g_m = 2*log(7/8);
g_p = 4/7;
c = 0;
for i = 1:p
    b(i) = x(i+1)/(8-x(i+1)^2);
    f(i) = -2*(4/(8-x(i+1)^2))^2;
end
%Define the connectivity matrix
A(1, 2:p) = -(1 - 0.5*h*b(1:p-1));
A(2, 1:p) = 2 + h^2*c;
A(3, 1:p-2) = -(1 + 0.5*h*b(2:p-1));
A(3, p-1) = -2;
%Initialize the solution vector
B(1:p, 1) = h^2 * f(1:p);
B(1, 1) = B(1) + (1 + 0.5*h*b(1))*g_m;
B(p, 1) = B(p) + 2*h*(1 - 0.5*h*b(p) )*g_p;
%Call given subroutines to solve matrix system
ab = gefab(A, p, ml, mu);
u1 = geslb(ab, p, 1, 1, B);
%Compute the true solution
for i= 1:p
    u(i, 1) = 2 * log(7/ (8-x(i+1)^2) );
end
%Compute the relative error
re = max(abs(u - u1)) / max(abs(u));



