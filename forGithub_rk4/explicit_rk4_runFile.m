clc
lambda = -2;
delta_t = 1e-1;
x_0 = 1;
t_f = 2;

x = 0:delta_t:t_f;

rk4_butcherTable = [1/2, 1/2, 1/6, 1/3, 1/3, 1/6, 1/2, 1/2, 1]; %a , b , c
saved_x_k4 = zeros(1,length(x));
saved_x_k4(1) = x_0;

for i = 2:(length(x))
    [~, x_k4] = rk4_func(lambda, rk4_butcherTable, x_0, delta_t);
    saved_x_k4(i) = x_k4;
    x_0 = x_k4;

end

figure(1)
scatter(x, saved_x_k4);
grid('on')

