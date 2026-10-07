clc
lambda = -2;
delta_t = 1e-1;
x_0 = 1;
t_f = 2;

x = 0:delta_t:t_f;

rk1_butcherTable = 1; %b1 = 1
saved_x_k1 = zeros(1,length(x));
saved_x_k1(1) = x_0;

for i = 2:(length(x))
    [x_dot, k1, x_k1] = rk1_func(lambda, rk1_butcherTable, x_0, delta_t);
    saved_x_k1(i) = x_k1;
    x_0 = x_k1;

end

figure(1)
scatter(x, saved_x_k1);
grid('on')

