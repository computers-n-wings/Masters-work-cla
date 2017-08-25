function err =  Max_Lower_Triag(B, n)
    err = eps;
    for i = 1:n
        for j = 1:n
            if i <= j
                continue
            else
                if abs(B(i,j)) > err
                    err = abs(B(i,j));
                end
            end
        end
    end
end