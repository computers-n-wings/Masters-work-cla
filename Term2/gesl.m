%% Use LU factorised matrix to solve
% Inputs: LU factorised matrix a, problem size n, vector b
% Outputs: Solution vector x
function x = gesl(a,n,b)
    % Forward Substitution
    for k = 1:n-1
        b(k+1:n) = b(k+1:n)-b(k)*a(k+1:n,k);
    end
    % Backward Substitution
    for k = n:-1:1
        b(k) = b(k)/a(k,k);
        b(1:k-1) = b(1:k-1)-b(k)*a(1:k-1,k);
    end
    x = b; % Save to solution
end





