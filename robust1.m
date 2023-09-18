t0 =0;
tf = 5;
tspan =[t0 tf];
x0 =[0.1;0.2];
[t,x]=ode23(@robust,tspan,x0);

figure 

plot(t,x(:,1))
xlabel('time')
ylabel('state')
hold on
plot(t,x(:,2))
xlabel('time')