clc
load("input.mat")
load("output.mat")

len_data_div = floor(length(u)*0.8);
uest = u(1:len_data_div);
yest = y(1:len_data_div);

uval = u(len_data_div+1:end);
yval = y(len_data_div+1:end);

%%estimation part
N_est = length(yest);
H_a = zeros(N_est, 3);
Y_a = yest;
H_b = zeros(N_est, 4);
Y_b = yest;
H_c = zeros(N_est, 4);
Y_c = yest;

H_a(1, :) = [0 0 0];
H_a(2, :) = [0 0 0];

H_b(1, :) = [0 0 0 0];
H_b(2, :) = [0 0 0 0];

H_c(1, :) = [0 0 0 0];
H_c(2, :) = [0 0 0 0];

for t = 3:N_est
    H_a(t, :) = [-yest(t-1) -yest(t-2) uest(t)];
    H_b(t, :) = [-yest(t-1) -yest(t-2) uest(t) uest(t-1)];
end

for t = 4:N_est
    H_c(t, :) = [-yest(t-1) -yest(t-2) -yest(t-3) uest(t-1)];
end

%Model a)
theta_a = H_a\yest;

a_1_a = theta_a(1);
a_2_a = theta_a(2);
b_0_a = theta_a(3);

%model b)
theta_b = H_b\yest;

a1_b = theta_b(1);
a2_b = theta_b(2);
b0_b = theta_b(3);
b1_b = theta_b(4);

%model c)
theta_c = H_c\yest;

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





yn= yval;
un = uval;

ypred = zeros(len_data_div, 1);
ypred(1) = yn(1);

for i=3:len_data_div
    ypred(i) = -a_1hat*yest(i-1) -a_2hat*yest(i-2) + b_0hat*uest(i);
end

predERROR = yn - ypred
predRMSE = rms(predERROR)

