%% Function to perform Ritz Reduction
% Inputs: Matrices X, K, and M and reduction size m
% Outputs: New Matrix X that will be eigenvectors upon convergence
function [V, D] = RITZ(X, K, M, m)
        Kbar = X'*K*X; % Define the reduced K
        Mbar = X'*M*X; % Define the reduced M
        [V,D] = QRITER(Kbar, Mbar);
end