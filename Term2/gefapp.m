%% James Gross 
% CID: 01305321
function [B,P] = gefapp(A,n)
P = eye(n); %Initialise permutation matrix
B = A;

for k = 1:n-1
    [max_val, l] = max(B(k:n,k)); %Search columns for index of maximum value
    l = l+k-1; %Make given index consistent with matrix system
    B([k l],:) = B([l k],:); %Swap rows
    P([k l],:) = P([l k],:); %Swap rows of permutation matrix P
    %Continue reducing matrix to LU factorization as in gefa.m
    B(k+1:n,k) = B(k+1:n,k)/B(k,k);
    for j = k+1:n
        B(k+1:n,j) = B(k+1:n,j) - B(k,j)*B(k+1:n,k);
    end
end