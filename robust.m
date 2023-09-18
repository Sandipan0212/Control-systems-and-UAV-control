function xdot = robust(t,x)
x1 = x(1);
x2 = x(2);
x = [x1;x2];
%A = [1 5;0 1];
A = [0 1; 1 -2];

B = [0 0.05 0;2 0 0];
Q = [3300 0;0 100];
%Q = [65 -64;-64 65];

R = 1;
[K,S]=lqr(A,B,Q,R)

u = -K*x;
xdot = A*x+B*u; 