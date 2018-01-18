%%Jacob Jones


clear;

%%Define functions 
f = @(t,y) [2*y(1)-1.2*y(1)*y(2)
            -y(2) + 0.9*y(1)*y(2)]';

%%Set initial conditions and define variables        
t0 = 0;
y0 = [2 3];
dt = 0.05;
tsteps = 200;

t = t0 : dt : t0+tsteps*dt;
y(1,:) = y0;

%%Implement RK4 method
for i = 1 : tsteps
    h2 = dt/2;
    ttemp = t(i)+h2;
    k1 = f(t(i),y(i,:));
    k2 = f((ttemp), y(i,:)+h2*k1);
    k3 = f((ttemp), y(i,:)+h2*k2);
    k4 = f(t(i+1), y(i,:)+dt*k3);
    y(i+1,:) = y(i,:) + dt/6 * (k1+k4+2*(k2+k3));
end

%%Plot Rabbits V. Foxes
figure(1)
plot(y(:,1),y(:,2),'m-');
xlabel('Rabbits');
ylabel('Foxes');
hold;

%%Plot Rabbits and Foxes V. Time
figure(2)
plot(t,y(:,1),'r-o');
hold on;
plot(t,y(:,2),'b-o');
xlabel('Time');
ylabel('Foxes and Rabbits');
legend('Rabbits', 'Foxes');