clear all
clc

%Bucher tablue
A = [1/4 1/4-sqrt(3)/6;
    1/4+sqrt(3)/6 1/4];
b = [1/2 1/2];
c = [1/2-sqrt(3)/6 1/2+sqrt(3)/6];

syms t dt lamda x real
f = lamda*x;
s = 2;
n = 1; %number of states (for b =1, for c= 2)

K  = sym('K', [n s], 'real');
r = sym(zeros(n,s));
x_k = sym('x_k', [n 1], 'real');

%We need to find r
for j = 1:s
    x_stage = x_k+ dt * K*A(j,:)';
    r(:,j) = subs(f, x, x_stage) - K(:,j);
end

r_vec = r(:); %vector forms
k_vec = K(:);
J = jacobian(r_vec, k_vec); 

matlabFunction(r_vec, J, 'File', 'r_gen', 'Vars', {k_vec, x_k, dt, lamda}, 'Outputs', {'r', 'J'})