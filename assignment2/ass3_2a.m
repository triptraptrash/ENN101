%xdot = landa * x
%landa < 0
%K_1 = f(x_k + delta t sum(a1_j*K_j, u(t_k + c_1*delta t)

dt = 10^(-1);
tf = 2;
landa = -2;
steps = tf/dt;

%euler integration method
x_k_rk1 = zeros(steps);
x_k_rk1(1) = 0; 
for i = 2:steps
   x_k_rk1(i) = (1-landa*dt)*x_k_rk1(i-1)
end

%rk2

