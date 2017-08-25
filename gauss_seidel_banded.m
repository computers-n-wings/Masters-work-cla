%% James Gross
% CID: 01305321
% The function will require a matrix A, a vector input b,
% maximum number of iterations, iter, and tolerance e
function x = gauss_seidel_banded(A, b, row, column, x, e) 
m = length(b);
w=1.51;
res = 1;
while res > e
    for i = 1:m
        jval = column(find(row == i));
        sum = 0;
        for j = jval
            sum = sum + A(i,j)*x(j);
        end
        sum = sum - A(i,i)*x(i);
        x(i) = w*(b(i)-sum)/A(i,i) + (1 - w)*x(i);
    end
    res = max(abs(A*x - b)) / max(abs(b));
end
