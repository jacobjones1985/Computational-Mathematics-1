%%Jacob Jones

clear;
clf;

p = @(t) t^2+1;
q = @(t) t^3+2*t;
r = @(t) sqrt(t)+1;
f = @(t, y) [y(2)
            r(t)-p(t)*y(2)-q(t)*y(1)]';      
alpha = 3;
beta = 5;
t0 = 0;
y0 = [alpha beta];
dt = 0.05;
tsteps = 100;
t = t0 : dt : t0+tsteps*dt;

y = RK4(f, y0, t0, dt, tsteps);

figure(1)
plot(t,y(:,1),'m-');
xlabel('t');
ylabel('y');
