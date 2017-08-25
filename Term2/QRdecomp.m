%% QR Decomposition function
% Inputs: Matrix B and problem size n
% Outputs: Matrices Q and R
function [Q, R] = QRdecomp(B, n)
    Q = zeros(n); 
    Q(:,1) = B(:, 1)/norm(B(:, 1), 'fro'); % Set first column of Q
    for i = 2:n
        Q(:,i) = B(:, i);
        for j = 1:i-1
            Q(:,i) = Q(:,i) - projection(Q(:,j), B(:, i), n); 
            % Orthogonalise the columns of Q
        end
        Q(:,i) = Q(:,i)/norm(Q(:,i), 'fro'); % Normalise
    end
    
    R = zeros(n);
    for i = 1:n
        for j = 1:n
            if i <= j
                R(i,j) = dot(Q(:,i), B(:, j)); % Specify entries in R
            end
        end
    end
end