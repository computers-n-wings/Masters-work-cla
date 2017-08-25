% fileID = fopen('Temp5.txt','r');
% formatSpec = '%f';
% T5 = fscanf(fileID,formatSpec);
% fclose(fileID);
% T5 = vec2mat(T5, 38);
% contourf(T5)

% fileID = fopen('Temp20.txt','r');
% formatSpec = '%f';
% T20 = fscanf(fileID,formatSpec);
% fclose(fileID);
% T20 = vec2mat(T20, 38);
% contourf(T20)

% fileID = fopen('Temp70.txt','r');
% formatSpec = '%f';
% T70 = fscanf(fileID,formatSpec);
% fclose(fileID);
% T70 = vec2mat(T70, 38);
% contourf(T70)
 
T1 = zeros(40);

for k = [1, 2, 8, 64]

figure(k); 
textfilename = ['Temp' num2str(k) '.txt'];
fileID = fopen(textfilename,'r');
formatSpec = '%f';
T = fscanf(fileID,formatSpec);
fclose(fileID);
T = vec2mat(T, 38);
for i = 1:38
    T1(i+1, 2:39) =  T(i, 1:38);
end
X = linspace(0,1,40);
Y = linspace(0,1,40);
[C,h] = contourf(X, Y, T1, 20);
colorbar
hold on
% axis([0 1 0 1 ])
plotname = ['Temperature at Time Step ' num2str(k)];
title( plotname , 'FontSize', 18)
pause(1)

end

