t0 = 0;
tf = 10;
tspan = [0:0.1:10];
x0=[0.1;0.2;0.3];

 [t,x]=ode23(@transmitter,tspan,x0)
 
figure
plot(t,x(:,1))
hold on
plot(t,x(:,2))
hold on
plot(t,x(:,3))

%x = [0:0.1:10];
a=5;
m = a * sin(x);
mod = m+x(:,1);

figure
hold on
plot(x,m)
%modulated design
plot(t,mod)
hold off
%ciper text creation
ci= mod+x(:,3);
figure
plot(t,ci)














