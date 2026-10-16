function [x_rk4] = old_rk4(lambda_in)
%% old rk4 from exercise 2

dt = 10^(-1);
tf = 1;
lambda = lambda_in;
% steps = tf/dt;
t = 0:dt:tf;
N = length(t);

f = @(x) lambda*x;

x_rk4 = zeros(N,1);
x_rk4(1) = 1;

for i = 1:N-1
    k1 = f(x_rk4(i));
    k2 = f(x_rk4(i) + dt/2*k1);
    k3 = f(x_rk4(i) + dt/2*k2);
    k4 = f(x_rk4(i) + dt*k3);
    x_rk4(i+1) = x_rk4(i) + dt*(1/6*k1 +1/3*k2 + 1/3*k3 + 1/6*k4);
end


end