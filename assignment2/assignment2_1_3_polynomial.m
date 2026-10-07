clear all
close all
clc

%%init

a_zero_true = -2.923;
b_zero_true = 7.18;
c_zero_true = 2.8;
mu = 0;
sigma = 12.8;

N = 100;
%x= sort(unifrnd(0, 50, [N 1])); %input
x= sort(unifrnd(0, 50, [N 1])); %input

y = zeros(N,1); %noice free
yn= zeros(N,1); %noice incl
e = normrnd(mu, sigma^2, [N 1]);

for t = 1:N % zero initial condition
    y(t) = a_zero_true + b_zero_true*x(t) + c_zero_true*x(t)^2;
    yn(t) = y(t) + e(t);
end

%%%%%%%%%%%%%%% Linear Line%%%%%%%%%%%%%%%%%%%%%%%%
phi_lin = [ones(N,1) x] ;
theta_hat_lin = phi_lin\yn;
y_hat_lin = phi_lin * theta_hat_lin;

%%%%%%%%%%%%%%%%%%% Poly line %%%%%%%%%%%%%%%%%%%%%%%
phi_poly = [ones(N,1) x x.^2] ;
theta_hat_poly = phi_poly\yn;
y_hat_poly = phi_poly * theta_hat_poly;

%%%%%%%%%%%%%%%%%%%%residuals%%%%%%%%%%%%%%%%%%%%%

residuals_poly = 1/N *sum((yn-y_hat_poly).^2);
residuals_lin = 1/N *sum((yn-y_hat_lin).^2);

%%%%%%%%%%%%%%%%plot%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); clf;
plot(x, yn, '.');
hold on;
plot(x, y_hat_lin);
hold off;
legend('data', 'estimate')
title('Linear Estimation')
xlabel('x')
ylabel('y')

figure(2); clf;
plot(x, yn, '.');
hold on;
plot(x,y_hat_poly);
hold off;
legend('data', 'estimate poly')
title('Second Order Polynomial Estimation')
xlabel('x')
ylabel('y')

disp('Linear estimator''s residual is:');
disp(residuals_lin);
disp('Polynomial estimator''s residual is:');
disp(residuals_poly);
