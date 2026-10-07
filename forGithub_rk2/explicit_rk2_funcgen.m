clc
clear

syms lamda delta_t x_prev a b1 b2 real  %x_prev is x(t-1)

%rk2
x_dot = lamda.*x_prev;
k1 = x_dot;
k2 =lamda.*(x_prev + a.*delta_t.*k1); %is this correct?
x_k1 = x_prev + delta_t.*(b1.*k1 + b2.*k2);

matlabFunction(x_dot, k1, x_k1, 'File', 'rk2_func', 'Vars', {lamda, a, b1, b2, x_prev, delta_t})


