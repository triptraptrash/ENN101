sigma = 12.8;
my = 0;
N =100;
e = normrnd(my, sigma, [N 1]);

a0 = -2.923;
b0 = 7.18;
c0 = 2.8;

lower_limit = 0;
upper_limit = 50;
sz = [N 1];
x = lower_limit + (upper_limit-lower_limit)*rand(sz);

% figure(1)
% scatter(x,linspace(50,0.5))
% grid on;

y = zeros(N,1);
for t = 1:N
    y(t) = a0 +b0*x(t) + c0*x(t)^2 + e(t);
end

figure(2)
plot(x,y, '.');
grid on; hold on;

%%%Time for linear regression aka want to fin parameters K and m in y = Kx
%%%+ m 
X = [ones(N,1), x, x.^2];
theta_hat = X\y; %solves Ax = b
y_hat = X * theta_hat;

%for plotting sort:
[x_sorted, idx] = sort(x);
y_hat_sorted = y_hat(idx);

xlabel('x');
ylabel('y');
title('Second order polynomial Estimation')
legend('data', 'estimate');
plot(x_sorted, y_hat_sorted, '--');
hold off;

disp(theta_hat)