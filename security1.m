function xdot = security1(t,x)



A=[1 2 3; 4 5 6; 7 8 9];
x1=x(1);
x2=x(2);
x3=x(3);
x=[x1;x2;x3];
xdot= A*x;
end



