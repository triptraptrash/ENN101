clc
clear all
%Type in 'b' or 'c'
func = "c"; %%This is the option to either run code for excersise 'b', the lambda function, or 'c', the Van der pol oscillator.
s= 2; %Stages of the IRK function
if func == "b"
    n = 1;
    xy_num = 1;
elseif func == "c"
    n = 2;
    xy_num = 2;
end

lambda = -2; 

dt = 0.16;
alpha = 1;
tol = 10^-8;
t = 0:dt:25;
N = length(t);

%butcher Tableu
A = [1/4  1/4-sqrt(3)/6;
    1/4+sqrt(3)/6  1/4];
b = [1/2 1/2];
c = [1/2-sqrt(3)/6 1/2+sqrt(3)/6];

%init values
x = zeros(N, xy_num);
if func == "b"
    x(1, 1) = 1;
elseif func == "c"
    x(1, 1) = 1;
    x(1, 2) = 0;
end

for i = 1:N - 1
    K = zeros(s, n); %Init and reset K
    while true
        if func == "b"
            [r, drdk] = r_func_lambda(x(i,:), lambda, dt, K, A);
            dK = drdk\ r;
        elseif func == "c"
            [r, drdk] = r_func_vander(x(i,:), dt, K, A);
            dK = reshape(-(drdk \ r(:)), 2, 2); %Inverse needs to be done differently since it a matrix against a matrix inversion
        end
        if norm(r(:,:)) < tol
            break
        end
        K = K + alpha*dK; %K adjusted for
    end
    x(i+1, :) = x(i,:) + dt*(b*K); %next step of x updated
end

if func == "b"
    x_rk = rk4_func_lambda(lambda, dt, t);
    figure(1);
    title('Lambda RK4 and RK4 model', ['lambda =', num2str(lambda)])
    plot(t, x, 'b--', 'LineWidth',1.5)
    hold on
    plot(t, x_rk, 'r--')
    xlabel('t'); ylabel('x(t)');
    legend('IRK4', 'RK4');
    grid on

elseif func == "c"
    [t,q_rk4] = rk4_vander(@rightHandSide, t, dt, [1,0]);
    figure(1)
    title('Van der Pol RK4 and RK4')
    plot(t, x(:,1), 'r--')
    hold on
    plot(t, q_rk4(:,1), 'b--')
    xlabel('t'); ylabel('x(t)')
    legend('IRK4', 'RK4')
    grid on;
end

