%% Function to compute eigenvalues and eigenvectors
% Inputs: K and M matrices and the size of the problem n
% Ouputs: Matrices of eigenvectors V and eigenvalues D
function [V, D] = Task3a(K, M)
    n = length(K);
    V = zeros(n); % Matrix of eigenvectors
    D = zeros(n); % Matrix of eigenvalues on the diagonal
    C = LU_Solver(M, K, n, n); % Change to simple eigenvalue problem
    B = C; % Save the result for later
    
    x = rand(n, 1); % Specify initial guess
    [v, lambda] = RQI(B, x, 0.0000001, n); % Compute eigenpair
    D(1,1) = lambda; % Save eigenvalue
    V(:, 1) = v; % Save eigenvector

    for i = 1:n-1
        B = HHD(B, v); % Compute Householder transformation
        B(1,:) = []; % Reduce dimensionality of the problem
        B(:,1) = []; % by deleting rows and column containing
        v(1) = [];   % the already computed eigenvalue
        x(1) = [];
        if i == n-1 % If scalar system, set eigenvalue as value
            lambda = B(1,1);
        else
            x = rand(n-i, 1); % Generate new x
            [v, lambda] = RQI(B, x, 0.0000001, n-i);
        end
        D(i+1, i+1) = lambda; % Save eigenvalue
        V(:,i+1) = Inverse_Power_Shift(C, rand(n,1), lambda, n);
        % Use Inverse Power shift to find eigenvectors
    end
end