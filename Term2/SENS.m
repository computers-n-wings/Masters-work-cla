%% Sensitivity to changes in parameters at each element
% Inputs: Stiffness matrix K, Mass matrix M, Matrix of eigenvectors V,
% Matrix of eigenvalues D, Young's modulus across the wing E,
% Density across the wing rho, change of parameters del_a, and number 
% of elements N
% Outputs: Change of eigenvalues del_lambda
function del_lambda = SENS(K, M, V, D, E, rho, del_a, N)
    Ktemp = zeros(N); % change in K wrt to elemental Young's modulus
    Mtemp = zeros(N); % change in M wrt to elemental density
    S = zeros(N, 2*N); % sensitivity matrix

    for i = 1:N % Loop over elements
        if i == 1 
            % First element only has one contribution
            Ktemp(1, 1) = (K(1, 1) + K(1,2))/(E(1));
        else
            % Uses the form of stiffness matrix K to find elemental
            % contributions
            Ktemp(i-1,i-1) = -K(i-1, i)/(E(i));
            Ktemp(i-1, i) = K(i-1, i)/(E(i));
            Ktemp(i, i-1) = Ktemp(i-1, i); 
            Ktemp(i, i) = Ktemp(i-1,i-1);
        end
        for j = 1:N % Loop over eigenvalues
           S(j, i) = V(:,j)'*Ktemp*V(:,j); % Calculate sensitivity
        end
        Ktemp = zeros(N); % Reinitialise the change in K matrix
    end
    for i = 1:N
        if i == 1
            Mtemp(1,1) = (M(1,1) - 2*M(1,2))/rho(1);
        else
            % Uses the form of mass matrix M to find elemental
            % contributions
            Mtemp(i-1, i-1) = 2*M(i, i-1)/rho(i);
            Mtemp(i, i-1) = M(i, i-1)/rho(i);
            Mtemp(i-1, i) = Mtemp(i, i-1);
            Mtemp(i, i) = Mtemp(i-1, i-1);
        end
        for j = 1:N
            S(j, i+N) = V(:,j)'*(-D(j,j)*Mtemp)*V(:,j);
        end
    end
    
    del_lambda = S*del_a; % Calculate the change in eigenvalues
    for i = 1:N
        del_lambda(i) = del_lambda(i)/D(i,i);
    end
end