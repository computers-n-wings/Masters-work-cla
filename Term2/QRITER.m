%% QR Iteration Function
% Inputs: Matrices K & M and problem size n
% Outputs: Matrix of eigenvectors V and matrix of eigenvalues D
function [V,D] = QRITER(K, M)
    n = length(K);
    B = LU_Solver(M, K, n, n); % Transform to a simple EVP
    V = eye(n); % Initialise Schur vectors
    D = zeros(n); % Initialise the eigenvalue
    for k = 1:1000
        [Q, R] = QRdecomp(B, n); % QR decompose the matrix B
        B = R*Q; % Set B to be product RQ
        V = V*Q; % Schur vectors
        err = norm(diag(D) - diag(B), inf); % Error between eigenvalues
        if err < 0.000001; % Break if tolerance is met
            Vt = zeros(n);
            x = rand(n, 1);
            % Eigenpairs of Schur Transformation
            for i = 1:n
                Vt(:, i) = Inverse_Power_Shift(B, x, B(i,i), n);
            end
            V = V*Vt; % Eigenvectors  
            return
        end
        D = diag(diag(B)); % Save new eigenvalues for comparison
    end
end