%theta_init = [0;0.1];
tstart = 0;
tend = 20;
n = 0.1;
tspan = [tstart tend];

xinit = [0;0.1;0;0];

[T,X] = ode45(@caida,tspan,xinit);

plot(T,X(:,2));