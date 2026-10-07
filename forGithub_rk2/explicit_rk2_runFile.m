clc
lambda = -2;
delta_t = 1e-1;
x_0 = 1;
t_f = 2;

x = 0:delta_t:t_f;

rk2_butcherTable = [1/2, 0, 1]; %a = 1/2, b1 = 0, b2 = 1
saved_x_k1 = zeros(1,length(x));
saved_x_k1(1) = x_0;

for i = 2:(length(x))
    [~, x_k1] = rk2_func(lambda, rk2_butcherTable(1),  rk2_butcherTable(2),  rk2_butcherTable(3), x_0, delta_t);
    saved_x_k1(i) = x_k1;
    x_0 = x_k1;

end

figure(1)
scatter(x, saved_x_k1);
grid('on')

