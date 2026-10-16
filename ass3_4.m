clear all
clc


tol = 1e-8;

%Bucher tablue
A = [1/4 1/4-sqrt(3)/6;
    1/4+sqrt(3)/6 1/4];
b = [1/2 1/2];
c = [1/2-sqrt(3)/6 1/2+sqrt(3)/6];

k1 = 1;
k2 =3;

alpha = 1;
dt = 0.1;
t = 0:dt:1;

N = length(t) - 1;


x = zeros(1, length(t));
x(1) =1;
lamda = -28;


for i = 1:N
    %guess a K
    K = [k1;k2];
    x_k = x(i);

    [r, J] = r_gen(K, x_k, dt, lamda);
    while norm(r, 'fro') > tol
        k_delta = -J\r;

        K = K + alpha*k_delta;
        [r, J] = r_gen(K, x_k, dt, lamda);
    end
    
    x(i+1) = x(i) + dt*(b*K);
end


%% old rk4 from exercise 2

x_rk4 = old_rk4(lamda)';


x_exact = exp(lamda*t)*x(1); %since solution to the autonomous system


figure(1)
plot(t, x, 'b-');
hold on
plot(t, x_exact, 'r--')
plot(t,x_rk4,'*')
legend('IRK numerical solution', 'Exact solution', 'old RK4')
xlabel('Time t')
ylabel('x(t)')
grid on