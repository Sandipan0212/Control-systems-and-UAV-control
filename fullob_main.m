t0=0;tf=20;
tspan=[t0:0.1:tf];
global e
e=[]
x0=[0.1;0.2;0.3;-0.1];
[t,x]=ode23(@fullob,tspan,x0);
figure
hold on
plot(t,x(:,1),'r');
plot(t,x(:,2),'b');

hold off
figure
hold on
plot(e(:,1),e(:,2),'r');
plot(e(:,1),e(:,3),'b');

hold off