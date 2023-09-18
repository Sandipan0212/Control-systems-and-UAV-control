t0=0;
tf=5;
tspan=[t0:0.1:tf];
% global e
% e=[]
x0=[0.1];
[t,x]=ode23(@detector,tspan,x0)
figure
hold on
plot(t,x(:,1),'r');


