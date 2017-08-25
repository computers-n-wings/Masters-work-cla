%% Function to perform Householder transformation
% Inputs: Matrix A and eigenvector x
% Outputs: Householder transformation of A
function A = HHD(A, x)
    alpha = -sign(x(2))*norm(x); % Compute the scaling
    x1 = x(1); % Save first value for calculation
    v = zeros(size(x)); % Initialise the orthogonal unit vector
    v(1) = sqrt(0.5*(1.0-(x1/alpha)));
    for i = 2:length(v)
        v(i) = sqrt((x(i)^2) / (2*(alpha^2)*(1.0-(x1/alpha))));
    end
    H = (eye(length(v)))-2*(v*v'); % Creates the Householder matrix
    A = H*A*H; % Computes the Householder transformation
end
    