clear all
close all
clc

%%init

a_zero_true = -2.923;
b_zero_true = 7.18;
mu = 0;
sigma = 3.8;

N = 100;
%x= sort(unifrnd(0, 50, [N 1])); %input
x= unifrnd(0, 50, [N 1]); %input

y = zeros(N,1); %noice free
yn= zeros(N,1); %noice incl
e = normrnd(mu, sigma, [N 1]);

for t = 1:N % zero initial condition
    y(t) = a_zero_true + b_zero_true*x(t);
    yn(t) = y(t) + e(t);
end

figure(1); clf;
plot(x, yn, '.')
title('')
xlabel('x')
ylabel('y')

