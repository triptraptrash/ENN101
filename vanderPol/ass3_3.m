clc
clear

%%%%%%%%  ode45  %%%%%%%%%%

% options = odeset();
options = odeset('AbsTol',1e-8,'RelTol',1e-8);

x0 = 1;
y0 = 0;
% t = 0:0.001:100; %% why define time step here?? ska d inte va adaptiv
t_ode45 = [0 100];

disp('Starting ode45') % debugging print
tic

[t,q] = ode45(@rightHandSide, t_ode45, [x0,y0], options);

toc
disp('ode45 finished')

%%%%%% RK4  %%%%%%%

dt = 0.01; % test different time steps
t_rk4 = 0:dt:100; %timescale

disp('Starting RK4')
tic

[t_rk4,q_rk4] = RK4_func_2(@rightHandSide, t_rk4, dt, [x0,y0]);

toc
disp('RK4 finished')

figure(1)
plot(t,q(:,1), 'b-');  
hold on
plot(t_rk4, q_rk4(:,1), 'r--');
xlabel('t'); ylabel('x(t)');
legend('ode45', 'RK4');
grid on

figure(2) %phase portairt aka q vs q (not t)
plot(q(:,1),q(:,2), 'b-'); % like this see 
hold on
plot(q_rk4(:,1), q_rk4(:,2), 'r--') % use two qs NO t
xlabel('x(t)'); ylabel('y(t)');
legend('ode45', 'RK4');
plot(x0,y0,'*r','MarkerSize',10);
grid on
