%% James Gross
% CID: 01305321
% The function will require a matrix A, a vector input b,
% maximum number of iterations, iter, and tolerance e
function x = gauss_seidel(A, b, d, iter, e) 
m = length(b);
x = zeros(m,1); % Initialised solution
for k = 1:iter
    xnew = zeros(m,1); % Initialise new solution
    for i = 1:m
        for j == i + d(i)
            s1 = A(i, 1:i-1) * xnew(1:i-1); % Calucalate sum 1 using new solution
            s2 = A(i, i+1:m) * x(i+1:m); % Calculate sum 2 using old solution
        end
        xnew(i) = (b(i)-s1-s2)/A(i,i); % Define new points of new solution
    end
    x = xnew; % Let solution equal the full new solution
    res = max(abs(A*x - b)) / max(abs(b)); % Define the residual
    if res < e
        break % If tolerance is met, exit loop
    end
end