function xdot=transreciever(t,x)
x1=x(1);
x2=x(2);
x3=x(3);
x1_hat=x(4);
x2_hat=x(5);
x3_hat=x(6);

exp=2.718;
L=[34.5020;29.3385;11.2993]; 
s=0.05*sin(600*pi*t);  

x=[x1;x2;x3;x1_hat;x2_hat;x3_hat];
x_state = [x1;x2;x3];

y=x3+s;

xdot1=[0 -1 0;1 0.2 0;1 0 0]*x_state+[-exp^y; 0.01*x1*y; 0.2*exp^-y]+[0;0;-5.7]+L*s;

x_hat=[x1_hat;x2_hat;x3_hat];
y_hat=x3_hat

xdot_hat=[0 -1 0;1 0.2 0;1 0 0]*x_hat+[-exp^y; 0.01*x1*y; 0.2*exp^-y]+[0;0;-5.7]+L*(y-y_hat);
xdot = [xdot1;xdot_hat];

end