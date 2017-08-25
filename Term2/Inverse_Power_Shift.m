%% Function to calculate eigenvectors
% Inputs: The matrix A, initial guess of eigenvector x, eigenvalue lambda,
% and maximum number of iterations iter
% Outputs: The eigenvector x
function x = Inverse_Power_Shift(A, x, lambda, n)
    alpha = lambda + 0.2; % Creates shift by perturbing the eigenvalue
    C = A - alpha*eye(n); % Shifted matrix
    
    for k = 1:1000
        y = LU_Solver(C, x, n, 1);
        y = y/norm(y, 'fro'); % Normalise solution
        x = y;
        sigma = (x'*A*x); % Comparison eigenvalue
        if abs(lambda - sigma) < 0.000001 
            return;
        end
    end
end