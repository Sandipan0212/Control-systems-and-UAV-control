function xdot = transmitter(t,x)



A=[0 1 0; -112 0 -8; -212 0 -18];
x1=x(1);
x2=x(2);
x3=x(3);
x=[x1;x2;x3];
xdot1= A*x;
xhat_dot = A * xhat;
xdot= [xdot1:xhat_dot];
end



