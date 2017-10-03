data = load('MatrixMultiplyTimers.txt');

n = data(:,1);
t0 = data(:,2);

figure(1);
plot(t0,n,'b-');
set(gca,'XScale','log');
set(gca,'YScale','log');
set(gca,'YLim',[min(n) max(n)]);
xlabel('Computation time (seconds)')
ylabel('Size of matrix, n')

saveas(1,'MatrixMultiplyTimers','pdf');