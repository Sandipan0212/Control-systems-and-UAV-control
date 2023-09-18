function xdot=detector(t,x)
x1=x(1);
x2=x(2);


global e
e1=x1-x2;


ez=[t e1 ];
e=[e;ez]
A=[2];
B=[1];
C=[2];
w=[1];
x=[x1];
xhat=[x2];
P=[-1];
m=place(A',C',P)
y=C*x;
yhat=C*xhat;
K=[1];
u=-K*x;
xdot1=A*x+B*u+w;
xhat_dot=A*xhat+B*u+m'*(y-yhat);
xdot=[xdot1;xhat_dot];
end