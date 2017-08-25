%% Subspace Iteration Function
% Inputs: Matrices K and M and reduction m
% Outputs: Matrix of eigenvectors X and eigenvalues D
% Note: Only outputs m eigenvalues and eigenvectors
function [X, D] = SSI(K, M, m)
    n = length(K);
    X  = rand(n, m); % Randomise an initial guess
    del = rand(n, n)*0.001;
    K = K + del;
    M = M + del;
    A = LU_Solver(M, K, n, n); % Convert to Simple eigenvalue problem
    A = A*A; % Multistep 
    B = zeros(m);
    for i = 1:1000
        Xnew = A*X; % Power Iteration
        Xnew = orth(Xnew); % Orthonormalise the results
        [V, D] = RITZ(Xnew, K, M, m); % Solve Ritz problem
        Xnew = Xnew*V; % Transform to n sized problem
        if norm((D - B), inf) < 0.000001 
            % Break when eigenvalues converge
            X = Xnew; % Eigenvectors
            B = D; % Eigenvalues
            return;
        end
        X = Xnew;
        B = D;
    end
end