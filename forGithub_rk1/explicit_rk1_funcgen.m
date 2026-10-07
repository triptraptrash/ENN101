clc
clear

syms lamda b1 delta_t x_prev real  %x_prev is x(t-1)

%rk1
x_dot = lamda.*x_prev;
k1 = x_dot;
x_k1 = x_prev + delta_t.*b1.*k1;

matlabFunction(x_dot, k1, x_k1, 'File', 'rk1_func', 'Vars', {lamda, b1, x_prev, delta_t})


