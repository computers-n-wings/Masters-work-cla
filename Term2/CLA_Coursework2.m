clear all
close all
clc
format short;

A = 2; % Initial cross sectional area
pho = 3; % Initial density
E = 4; % Initial Young's modulus
L = 5; % Wing length
s1 = 0.1; % Linear variation of wing area
s2 = 0.2; % Exponential variation of Young's modulus
s3 = 0.3; % Exponential variation of density
n = 4; % Number of elements
N = [1:1:n]; % Vector of elements
omegan1 = zeros(1,n); % Vector of natural frequencies
omega = [1e-5;0.0001;30]; % Vector of frequencies
omegacampbell = [0;0.00001;3]; % Vector of excitation harmonic frequencies
H = omega; % Frequency response function

for i=1:length(N)
    h = L/N(i); % Spacing
    x = [0:h:L]; % Domain x
    M = zeros(N(i)+1); % Initialise mass matrix
    K = zeros(N(i)+1); % Initialise stiffness matrix
    expsm3 = exp(-s3.*x);
    expsm2 = exp(-s2.*x);
    expsm3h = exp(-s3*h);
    expsm2h = exp(-s2*h);
    exps3h = exp(s3*h);
    exps2h = exp(s2*h);
    
    % Populating matrix M with overplapping on the diagonal
    for m=1:N(i)
        M(m,m) = M(m,m) - (1/h^2)*pho*(expsm3(m)*expsm3h/s3^4)* ... 
            (((h^2*s3^2-2*h*s3+2)*exps3h-2)*s1*s3*x(m)-A* ... 
            ((h^2*s3^2-2*h*s3+2)*exps3h-2)*s3+((h^2*s3^2-4*h*s3+6) ...
            *exps3h-2*(h*s3+3))*s1);
        
        M(m+1,m+1) = -(1/h^2)*pho*(expsm3(m)*expsm3h/s3^4)* ... 
            ((2*exps3h-h^2*s3^2-2*h*s3-2)*s1*s3*x(m)-A* ... 
            (2*exps3h-h^2*s3^2-2*h*s3-2)*s3+ ...
            (6*exps3h-h^3*s3^3-3*h^2*s3^2-6*h*s3-6)*s1);
        
        M(m+1,m) = -(1/h^2)*pho*(expsm3(m)-A*((h*s3-2)*exps3h+s3*h+2) ... 
            *s3+(2*(h*s3-3)*exps3h+h^2*s3^2+4*h*s3+6)*s1);
        
        M(m,m+1) = M(m+1,m);
        if N(i) == n
            M
        end
    end
    
    % Populating matrix K with overlap on the diagonal
    for m=1:N(i)
        K(m,m) = K(m,m) -(1/h^2)*E*(expsm2(m)*expsm2h/s2^2)* ... 
            ((exps2h-1)*s1*s2*x(m)-A*(exps2h-1)*s2+(exps2h-h*s2-1)*s1);

        K(m+1,m+1) = -(1/h^2)*E*(expsm2(m)*expsm2h/s2^2)*((exps2h-1) ... 
            *s1*s2*x(m)-A*(exps2h-1)*s2+(exps2h-h*s2-1)*s1);

        K(m+1,m) = (1/h^2)*E*(expsm2(m)*expsm2h/s2^2)*((exps2h-1) ... 
            *s1*s2*x(m)-A*(exps2h-1)*s2+(exps2h-h*s2-1)*s1);

        K(m,m+1) = K(m+1,m);
%         if N(i) == n
%             K
%         end
    end
    
    % Eigenvectors and eigenvalues of the eigenvalue problem
    [V,D] = eig(K(2:N(i)+1,2:N(i)+1), M(2:N(i)+1,2:N(i)+1));
    omegan1(i) = min(diag(D)); % Eigenvalue for each N
    
end

M = (M((2:n+1),(2:n+1)));
K = (K((2:n+1),(2:n+1)));


% % B = inv(M)*K;
% m = 3;
% 
% % [V, D] = Task3a(K, M, n)
% % [V,D] = QRITER(B, n)
% [X, D] = SSI(K, M, n, m)
% 
% 
% [V,D] = eig(K, M)
% link to Clement's structural dynamics cw: https://www.overleaf.com/read/qnnbrjqftkkr#/30147693/
