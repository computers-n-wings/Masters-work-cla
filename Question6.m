%% James Gross
% CID:01305321
clear

N1 = 40; % Number of grid points in one direction
N = N1-2; % Number of unknown grid points in one direction
% Initialise the entries
d0 = ones(N^2, 1);
d1a = d0;
d1a(N:N:end,1) = 0; % Lower diagonal entries
d1b = d0;
d1b(N+1:N:end,1) = 0; % Upper diagonal entries
d = [-N -1 0 1 N]; % Diagonal positions of non-zero entries
% Occupy the A matrix with the entries in positions defined
A = spdiags([-1*d0 -1*d1a 4*d0 -1*d1b -1*d0], d, N^2, N^2);


%% James Gross
% CID: 01305321

% Define the parameters
delx = 1/(N1-1);
delt = 0.1;
alph = 1;
sig = alph*delt/delx^2;
% Create the multipliers of solutions from time step n+1 and n
A_L = speye(N^2) + 0.5*sig*A;
A_R = speye(N^2) - 0.5*sig*A;

%% James Gross
% CID: 01305321

% Define source term
for i = 1:N
    for j = 1:N
        q(i,j) = 10*exp(-(i*delx - 0.5)^4 + (j*delx -0.5)^4);
    end
end
q = reshape(q, [N^2, 1]); % Source term vector
x = zeros(N^2, 1); % Initial solution
[row, column] = find(A_L); % Create arrays of indices of non-zero entries
% Loop over time steps
for i = 1 : 1000 % Max number of time steps
    b = A_R*x + delt*q; % Define new b for each time step
    x1 = banded_SOR(A_L, b, row, column, x, 0.00001); % Call SOR subroutine
    if i < 100 % Save every 5 time steps to a text file
        textfilename = ['Temp' num2str(i) '.txt'];
        fileID = fopen(textfilename, 'w');
        fprintf(fileID, '%9.8f\n', x1);
        fclose(fileID);
    end
    if max(abs(x1-x))/max(abs(x)) < 0.0001
        break % Break loop when arrives at steady state solution
    end
    x = x1; 
end
