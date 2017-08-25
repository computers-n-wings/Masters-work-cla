%% Solve matrix system AX=B using LU factorization
% Inputs: Matrices A & B, rows n, columns m
% Outputs: Solution matrix X
function X = LU_Solver(A, B, n, m)
    A = gefa(A, n); % LU factorise A
    X = zeros(n, m); % Initialise solution
    
    for i = 1:m % Iterate through columns of X
        X(:,i) = gesl(A, n, B(:, i)); % Solve for each column
    end

    X = sparse(X); % Result is full, return to sparse storage
end