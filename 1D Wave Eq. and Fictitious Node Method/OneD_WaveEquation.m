clear; 

f = @(x) 1-abs(2*x-1); %initial displacement at x=0,1,1/2 (triangle shape)
g = @(x) 0;
m = 200;
dt = 0.005;
tsteps = 1250;
c = 1; %constant that tells you properties of the string 
alpha = 0; %boundary conditions of u
beta = 0; %boundary condition of u 
bounds = [0 1 -1 1]; %0 1 on the x axis -1 1 on the y axis 
d = .5; %Damping constant
dx = 1/m;
x = linspace(0,1,m+1);
t = linspace(0, tsteps*dt, tsteps+1);
p = (c*(dt)^2) / (dx^2);
q = 1/(dt*d+2);

stab = dx/sqrt(c)-dt; %has to be positive to not have stability issues (you need a smal dt)


%ICs
for j = 2:m;
   u(1, j) = f(x(j));
   u(1, j+1) = f(x(j+1));
   u(1, j-1) = f(x(j-1))
   u(2, j) = ((dt)^2)*d*g(x(j))/2 + g(x(j))*dt + u(1, j) + (p/2)*(u(1,j-1) - 2*(u(1, j)) + (u(1, j+1)));
end

%stills for first time level 
plot(x,u(1,:));
axis(bounds);
ttext = 't = 0'; %string where t=o
text(0.1, 0.8, ttext); %0.1 at x 0.8 at y ttext will show the change 
xlabel('x');
ylabel('u');
M(1) = getframe();

%stills for second time level 
plot(x, u(2, :));
axis(bounds);
ttext = strcat('t = ', num2str(t(2))); %place side by side t=whatever changing string to array
text(0.1, 0.8, ttext);  
xlabel('x');
ylabel('u');
M(2) = getframe();


for n = 2:tsteps 
    u(n+1,1) = alpha;
    u(n+1,m+1) = beta;
    for j = 2:m
      u(n+1, j) = q*(4*u(n, j) + dt*d*u(n-1, j) - 2*u(n-1, j)) + p*q*(2*u(n, j+1) + 2*u(n, j-1) - 4*u(n, j));
     %u(n+1,j) = -u(n-1,j) + 2*u(n,j) + p*(u(n,j-1)-2*u(n,j)+ u(n,j+1));
    end
    plot(x, u(n+1,:));
    axis(bounds);
    ttext = strcat('t = ', num2str(t(n+1))); 
    text(0.1, 0.8, ttext); 
    M(n+1) = getframe();
end

close all;

 figure(1); 
 contourf(x, t, u);
 colorbar;
 xlabel('x');
 ylabel('u');
 
 figure(2);
 axis(bounds);
 xlabel('x');
 ylabel('t');
 
 movie(M);


