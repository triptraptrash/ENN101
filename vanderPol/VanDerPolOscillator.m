options = odeset();
x0 = 1;
y0 = 0;
t = 0:0.001:100;
[t,q] = ode45(@rightHandSide, t, [x0,y0]);

figure(1)
plot(t,q(:,1), 'y-');  
xlabel('t'); ylabel('x(t)');
grid on

figure(2)
plot(q(:,1),q(:,2));  
xlabel('x(t)'); ylabel('y(t)');
hold on;
plot(x0,y0,'*r','MarkerSize',10);


