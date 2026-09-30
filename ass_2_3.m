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

a1_a = theta_a(1);
a2_a = theta_a(2);
b0_a = theta_a(3);

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
a3_c = theta_c(3);
b0_c = theta_c(4);

disp("Model A")
disp(theta_a)
disp("Model B")
disp(theta_b)
disp("Model C")
disp(theta_c)


%%%%% PREDICTION PART %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yn= yval;
un = uval;
val_len = ceil(length(u)*0.2);

ypred_a = zeros(val_len, 1);
ypred_a(1) = yn(1);
ypred_a(2) = yn(2);
ypred_b = zeros(val_len, 1);
ypred_b(1) = yn(1);
ypred_b(2) = yn(2);
ypred_c = zeros(val_len, 1);
ypred_c(1) = yn(1);
ypred_c(2) = yn(2);
ypred_c(2) = yn(3);

for i=3:val_len
    ypred_a(i) = -a1_a*yest(i-1) -a2_a*yest(i-2) + b0_a*uest(i);
    ypred_b(i) = -a1_b*yest(t-1) -a2_b*yest(t-2) + b0_b*uest(t) + b1_b*uest(t-1);
end

for i=4:val_len
    ypred_c(i) = -a1_c*yest(t-1) -a2_c*yest(t-2) -a3_c*yest(t-3) + b0_c*uest(t-1);
end

predERROR_a = yn - ypred_a;
predERROR_b = yn - ypred_b;
predERROR_c = yn - ypred_c;
predRMSE_a = rms(predERROR_a);
predRMSE_b = rms(predERROR_b);
predRMSE_c = rms(predERROR_c);

disp("Model A pred")
disp(predRMSE_a)
disp("Model B pred")
disp(predRMSE_b)
disp("Model C pred")
disp(predRMSE_c)

%%%SIMULATION PART %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

