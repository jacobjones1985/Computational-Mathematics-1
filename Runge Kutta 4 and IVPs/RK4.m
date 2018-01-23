%%Jacob Jones


function [y] = RK4(f, y0, t0, dt, tsteps)
%RK4 function


t = t0 : dt : t0+tsteps*dt;
y(1,:) = y0;

for i = 1 : tsteps
    h2 = dt/2;
    ttemp = t(i)+h2;
    k1 = f(t(i),y(i,:));
    k2 = f((ttemp), y(i,:)+h2*k1);
    k3 = f((ttemp), y(i,:)+h2*k2);
    k4 = f(t(i+1), y(i,:)+dt*k3);
    y(i+1,:) = y(i,:) + dt/6 * (k1+k4+2*(k2+k3));
end

end

