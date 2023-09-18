function xdot=fullob(t,x)
x1=x(1);
x2=x(2);
x3=x(3);
x4=x(4);

global e
e1=x1-x3;
e2=x2-x4;

ez=[t e1 e2 ];
e=[e;ez];
A=[-3 1; -2 0];
B=[0;1];
C=[1 0];
x=[x1;x2];
xhat=[x3;x4];
P=[-2 -3];
m=place(A',C',P)
y=C*x;
yhat=C*xhat;
K=[1 1];
u=-K*x;
xdot1=A*x+B*u;
xhat_dot=A*xhat+B*u+m'*(y-yhat);
xdot=[xdot1;xhat_dot];
end