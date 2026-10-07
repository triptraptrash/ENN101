clc
clear

syms lamda delta_t x_prev real  %x_prev is x(t-1)
syms a1 a2 a3 b1 b2 b3 b4 real

rk4_butcherTable = [a1, a2, a3, b1, b2, b3 b4] ;


%rk4
x_dot = lamda.*x_prev;
k1 = x_dot;
k2 =lamda.*(x_prev + a1.*delta_t.*k1); 
k3 = lamda.*(x_prev + a2.*delta_t.*k2);
k4 = lamda.*(x_prev + a3.*delta_t.*k3);

x_k1 = x_prev + delta_t.*(b1.*k1 + b2.*k2 + b3.*k3 + b4.*k4);

matlabFunction(x_dot, k1, x_k1, 'File', 'rk4_func', 'Vars', {lamda, rk4_butcherTable, x_prev, delta_t})


