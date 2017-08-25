%% James Gross
% CID: 01305321

% The function will require a matrix A, a vector input b,
% an array of row entries, an array of column entries,
% an inital solution x, and tolerance e
function x = banded_SOR(A, b, row, column, x, e) 
m = length(b);
w=1.51; % Relaxation parameter
res = 1; % Initialise residual error 
while res > e % Continue iterative process until tolerance is met
    for i = 1:m
        jval = column(find(row == i)); % Find all values of j for each i
        sum = 0; % Initialise the sum
        for j = jval % Loop over all j
            sum = sum + A(i,j)*x(j); % Compute sum
        end
        sum = sum - A(i,i)*x(i); % Remove j= i entries from sum
        x(i) = w*(b(i)-sum)/A(i,i) + (1 - w)*x(i); % Compute new x(i)
    end
    res = max(abs(A*x - b)) / max(abs(b)); % Compute new residual
end
