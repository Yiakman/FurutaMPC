function dxdt = caida(t,x)

tau = [0;0];

theta0 = x(1);
theta1 = x(2);
dtheta0 = x(3);
dtheta1 = x(4);

s0 = sin(theta0);
s1 = sin(theta1);

c0 = cos(theta0);
c1 = cos(theta1);

constants;

M11 = Ja + Jp*s1^2;
M12 = m1*l0*r1*c1;
M21 = m1*l0*r1*c1;
M22 = Jp;

M = [M11 -M12;-M21 M22];

V11 = 2*Jp*s1*c1*dtheta1 + nab0;
V12 = m1*l0*r1*s1*dtheta1;
V21 = Jp*s1*c1*dtheta0;
V22 = nab1;

Vm = [V11 V12;-V21 V22];

G2 = m1*r1*g*s1;
G = [0;G2];

qdotdot = inv(M)*(tau - Vm*[dtheta0;dtheta1] - G);

dxdt = zeros(size(x));
dxdt(1) = dtheta0;
dxdt(2) = dtheta1;
dxdt(3) = qdotdot(1);
dxdt(4) = qdotdot(2);
