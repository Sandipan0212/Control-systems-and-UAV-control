close all;
clear all;
clc;

N=5;

x(1)= 0.2;
x(2)= 0.4;
x(3)= 0.6;
x(4)= 0.8;
x(5)= 0.5;

x_initial = x;

L = [2.6 -0.6 -1 -1 0; -0.6 2.5 -0.4 -0.5 -1; -1 -0.4 1.4 0 0; -1 -0.5 0 1.8 -0.3; 0 -1 0 -0.3 1.3];
%L = [ 0 0 0 0 0; -1 2 0 -1 0; 0 -1 1 0 0; 0 -1 0 1 0; 0 0 -1 0 1];
T = 4;
dt = 0.01;

tau = 0.1;
delay = floor(tau/dt);

iStep = 1;
xStore = zeros(round(T/dt),N);
uStore = zeros(round(T/dt),N);
time = zeros(round(T/dt),1);

for t = 0:dt:T
    
    if (t<=tau)
        
        xtau = 0*ones(1,N);
        
    else
        xtau = xStore((iStep - delay),:);
    end
    
    u = -L*xtau'; %
    
    xStore(iStep,:)=x;
    uStore(iStep,:)=u;
    time(iStep,:)= t;
    iStep = iStep +1;
    
    
    x = x + u'*dt;
    
    drawnow
    
end

figure(1)
plot(time,xStore)

hold on

figure(2)
plot(time,uStore)










    
        
    




