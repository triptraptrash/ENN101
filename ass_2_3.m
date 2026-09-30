clc
load("input.mat")
load("output.mat")
syms a_1 a_2 b_0 const
%80 validation 20% training
split_u = floor(0.8*length(u));
test_data_u = u(split_u+1:end, 1);
train_row_u = u(1: split_u, 1);

split_y = floor(0.8*length(y));
test_data_y = y(split_y+1:end, 1);
train_row_y = y(1: split_y, 1);

len_group = floor(length(train_row_y)/5);
y_groups = zeros(len_group, 5);
u_groups = zeros(len_group, 5);
c = 0;
while c < 5
    u_groups(:, c+1) = train_row_u(c*len_group+1:(c+1)*len_group);
    y_groups(:, c+1) = train_row_y(c*len_group+1:(c+1)*len_group);
    c= c+1;
end
a_2 = 1;
a_1 = 1;
b_0 = 1;
y_hat_est = zeros(len_group, 5);
for iter = 1:5   
    for t = 3:len_group % zero initial condition
        phi = [-y_groups(t-1, iter) -y_groups(t-2, iter) u_groups(t, iter)].';
        theta = [a_1 a_2 b_0];
        y_hat_est(t, iter) = theta*phi;
    end
   
end

%%% estimation part
for iter = 1:5
    H(iter, :) = [yest(iter-1) u_groups(iter-1)];
end

th = (H.'*H)\H.'*y_hat

%while iteration
%Make a while loop and least square it
% phi = [ones(N,1) u_groups(iteration)] ;
% theta_hat = phi\yn;
% y_hat = phi * theta_hat;

%Get the good stuff and change the estimator param
%Look through our groups that are not in the iteration
%Get the error
%Go to the next iteration

%




% figure(1); clf;
% plot(x, yn, '.');
% hold on;
% plot(x, y_hat_lin);
% hold off;
% legend('data', 'estimate')
% title('Linear Estimation')
% xlabel('x')
% ylabel('y')
clc
load("input.mat")
load("output.mat")
syms a_1 a_2 b_0 const
%80 validation 20% training
split_u = floor(0.8*length(u));
test_data_u = u(split_u+1:end, 1);
train_row_u = u(1: split_u, 1);

split_y = floor(0.8*length(y));
test_data_y = y(split_y+1:end, 1);
train_row_y = y(1: split_y, 1);

len_group = floor(length(train_row_y)/5);
y_groups = zeros(len_group, 5);
u_groups = zeros(len_group, 5);
c = 0;
while c < 5
    u_groups(:, c+1) = train_row_u(c*len_group+1:(c+1)*len_group);
    y_groups(:, c+1) = train_row_y(c*len_group+1:(c+1)*len_group);
    c= c+1;
end
y_hat_est = zeros(len_group, 5);
u_est = u_groups;

for iter = 1:5
    
    for t = 3:len_group-2 % zero initial condition
        phi = [-y(t-1, iter) -y(t-2, iter) u_groups(t, iter)].';
        theta = [a_1 a_2 b_0];
        y_hat_est(t) = theta*phi;
    end
   
end

%%% estimation part
for iter = 1:5
    H(iter, :)
end
%Let them find things, get the estimator

%while iteration
%Make a while loop and least square it
% phi = [ones(N,1) u_groups(iteration)] ;
% theta_hat = phi\yn;
% y_hat = phi * theta_hat;

%Get the good stuff and change the estimator param
%Look through our groups that are not in the iteration
%Get the error
%Go to the next iteration

%




% figure(1); clf;
% plot(x, yn, '.');
% hold on;
% plot(x, y_hat_lin);
% hold off;
% legend('data', 'estimate')
% title('Linear Estimation')
% xlabel('x')
% ylabel('y')
