clc
load('input.mat')
load('output.mat')
syms a_1 a_2 b_0 const
%80 training 20% validation (test)
split_u = floor(0.8*length(u));
test_data_u = u(split_u+1:end, 1);
train_row_u = u(1: split_u, 1);

split_y = floor(0.8*length(y));
test_data_y = y(split_y+1:end, 1);
train_row_y = y(1: split_y, 1);


yest = test_data_y;
uest = test_data_u;

%%% estimation part
N_est = length(yest);
H_a = zeros(N_est -2, 3);
Y_a = yest(3:end);
H_b = zeros(N_est-2, 4);
Y_b = yest(3:end);
H_c = zeros(N_est-3, 4);
Y_c = yest(4:end);

for t = 3:N_est
    H_a(t-2, :) = [-yest(t-1) -yest(t-2) uest(t)];
    H_b(t-2, :) = [-yest(t-1) -yest(t-2) uest(t-1) uest(t-1)];
end
for t = 4:N_est
    H_c(t-3, :) = [-yest(t-1) -yest(t-2) -yest(t-3) uest(t-1)];
end


%Model a)
theta_a = H_a\Y_a;

a1_a = theta_a(1);
a2_a = theta_a(2);
b0_a = theta_a(3);

%model b)
theta_b = H_b\Y_b;

a1_b = theta_b(1);
a2_b = theta_b(2);
b0_b = theta_b(3);
b1_b = theta_b(4);

%model c)
theta_c = H_c\Y_c;

a1_c = theta_c(1);
a2_c = theta_c(2);
b0_c = theta_c(3);
b1_c = theta_c(4);


disp("Model A")
disp(theta_a)
disp("Model B")
disp(theta_b)
disp("Model C")
disp(theta_c)