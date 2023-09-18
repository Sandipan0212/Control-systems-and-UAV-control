close all;
clear all;
clc;

x(1)=1;
y(1)=-4;

x(2)=3;
y(2)=3;

x(3)=-1;
y(3)=4;

x(4)=-4;
y(4)=1;

x(5)=-3;
y(5)=-3;

x(6)=4;
y(6)=-1;

T=30;
dt=0.1;
istep=100;

%control loop
for t =0:dt:T
    ux = [(x(2)-x(1)) (x(3)-x(2)) (x(4)-x(3)) (x(5)-x(4)) (x(6)-x(5)) (x(1)-x(6))];
    uy = [(y(2)-y(1)) (y(3)-y(2)) (y(4)-y(3)) (y(5)-y(4)) (y(6)-y(5)) (y(1)-y(6))];
    u = sqrt(ux.^2 + uy.^2)
    
    %update function
    
    x = x + ux*dt;
    y = y + uy*dt;
    
    %store for plotting
    xStore(istep,:) = x;
    yStore(istep,:) = y;
    uxStore(istep,:) = ux;
    uyStore(istep,:) = uy;
    ustore(istep,:) = u;
    time(istep,:) = t;
    istep = istep+1 ;
    
    
 
    
end

%%plots of ux uy


figure(1)
plot(time(1:end,:), uxStore(1:end,:),'linewidth',2);
hold on
xlabel('time(sec)');
ylabel('ux');
grid on

figure(2)
plot(time(1:end,:), uyStore(1:end,:),'linewidth',2);
hold on
xlabel('time(sec)');
ylabel('uy');
grid on






