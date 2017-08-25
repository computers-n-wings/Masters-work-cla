format long

re = zeros(1, 4);
re(1) = [0.00254599846615430];
re(2) = [0.000632380353424026];
re(3) = [0.000157840100300066];
re(4) = [3.94441264973807e-05];

p = [10, 20, 40, 80];

gradient = polyfit(log(p), log(re), 1)

loglog( p, re, '-*r', 'LineWidth', 1, 'MarkerSize', 8)
set(gca,'FontSize',18)
hold on

axis([8 100 0.000009 0.01 ])

title('Logarithm Plot of Relative Error vs Grid Size p', 'FontSize', 24)
xlabel('Grid Size p', 'FontSize', 20)
ylabel('Relative Error','FontSize', 20)

grid on




% figure
% ax1 = axes('Position',[0.1 0.1 0.7 0.7]);
% ax2 = axes('Position',[0.65 0.65 0.28 0.28]);
% figure
% 
% subplot(2, 1, 1);
% plot( p, re, ':*r', 'LineWidth', 2, 'MarkerSize', 5)
% 
% grid on
% 
% subplot(2, 1, 2);
% loglog( p, re, ':*k', 'LineWidth', 1, 'MarkerSize', 5)
% grid on


