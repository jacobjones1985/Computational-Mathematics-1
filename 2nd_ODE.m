%%Jacob Jones

clear;
clf;

%y(2) -> v -> dy/dt
%y(1) -> y
%Define functions
p = @(t) t+3;
q = @(t) t^2+5;
r = @(t) t^4+7*t^2+6*t+2;
f = @(t, y) [y(2)
            r(t)-p(t)*y(2)-q(t)*y(1)]';
        
alpha = 0;
beta = 0;
%initial t value
t0 = 0;
%initial y and v values
y0 = [alpha beta];
dt = 0.05;
tsteps = 100;

t = t0 : dt : t0+tsteps*dt;
y(1,:) = y0;

%Implement RK4 method
for i = 1 : tsteps
    h2 = dt/2;
    ttemp = t(i)+h2;
    k1 = f(t(i), y(i,:));
    k2 = f((ttemp), y(i,:)+h2*k1);
    k3 = f((ttemp), y(i,:)+h2*k2);
    k4 = f(t(i+1), y(i,:)+dt*k3);
    y(i+1,:) = y(i,:) + dt/6 * (k1+k4+2*(k2+k3));
end

%Plot Function
plot(t,y(:,1),'m-');
xlabel('t');
ylabel('y');