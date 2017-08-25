%% James Gross
% CID: 01305321
function x = geslpp(a,n,b,P)
    x = b;
    x = P*x;%Multiply by the permutation matrix
    %Backward and forward substitution 
    for k = 1:n-1
        x(k+1:n) = x(k+1:n)-x(k)*a(k+1:n,k);
    end
    for k = n:-1:1
        x(k) = x(k)/a(k,k);
        x(1:k-1) = x(1:k-1)-x(k)*a(1:k-1,k);
    end
end