%%Jacob Jones

clear;

%defining information to be passed to RK4 function
f = @(t,y) [2*y(1)-1.2*y(1)*y(2)
            -y(2) + 0.9*y(1)*y(2)]';
t0 = 0;
y0 = [2 3];
dt = 0.05;
tsteps = 200;
t = t0 : dt : t0+tsteps*dt;

y = RK4(f, y0, t0, dt, tsteps);

figure(1)
plot(y(:,1),y(:,2),'m-');
xlabel('Rabbits');
ylabel('Foxes');
hold;

figure(2)
plot(t,y(:,1),'r-o');
hold on;
plot(t,y(:,2),'b-o');
xlabel('Time');
ylabel('Foxes and Rabbits');