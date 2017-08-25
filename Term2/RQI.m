%% Rayleigh Quotient function to find eigenvalues and eigenvectors
% Inputs: Matrix A & B, initial guess x, tolerance epsilon, and maximum
% number of iterations maxi
% Outputs: Eigenvector v and eigenvalue lambda
function [v,lambda] = RQI(A, x, epsilon, n)
    v = LU_Solver(A, x, n, 1);
    lambda = norm(x); % Initial guess of eigenvalue

    for k = 0:1000
        C = A-lambda*eye(n); % Shifted matrix
        v = LU_Solver(C, x, n, 1); 
        v = v / norm(v); % Normalise
        sigma = (v'*A*v) / (v'*v); % Rayleigh quotient
        if abs(sigma-lambda) < epsilon % Break if reaches tolerance
            return;
        end
        x = v; % New eigenvector
        lambda = sigma; % New eigenvalue
    end
end
