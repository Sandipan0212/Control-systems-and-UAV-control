t0=0; 
tf=25;
tspan=[t0:0.1:tf];

x0=[0.1; 0.2; 0.25; 0.1; 0.2; 0.4];

[t,x]=ode45(@transreciever,tspan,x0);

s=0.05*sin(600*pi*t); 
tx =x(:,3)+s;
 
 figure(1)
 subplot(3,1,1)
 plot(t(:,1),x(:,1))
 subplot(3,1,2)
 plot(t(:,1),x(:,2))
 subplot(3,1,3)
 plot(t(:,1),x(:,3))
 
 
 figure(2)
 plot(t(:,1),tx)
figure(3)
plot(t,s)


RC = tx-x(:,3);
diff = RC-s;

figure(4)
subplot(3,1,1)
 plot(t(:,1),x(:,4))
 subplot(3,1,2)
 plot(t(:,1),x(:,5))
 subplot(3,1,3)
 plot(t(:,1),x(:,6))
 
 
figure(5)
plot(t(:,1),RC)
figure(6)
plot(t,diff)


