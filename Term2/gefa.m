%% LU factorise matrix A
% Inputs: Matrix A and problem size n
% Outputs: LU factorised A
function A = gefa(A,n)

    for k = 1:n-1
        % Create L matrix
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);

        for j = k+1:n
            % Create U matrix
            A(k+1:n,j) = A(k+1:n,j) - A(k,j)*A(k+1:n,k);
        end
    end
end