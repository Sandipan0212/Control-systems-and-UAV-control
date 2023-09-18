clear all
clc

N=6;

x(1)=-1;
y(1)=3;
theta(1)= 0*pi/100;

x(2)=0.5;
y(2)=-1;
theta(2)= 30*pi/100;


x(3)=2;
y(3)= -3;
theta(3)= 45*pi/100;


x(4)=6;
y(4)=0;
theta(4)= 60*pi/100;


x(5)=2;
y(5)=-1;
theta(5)= 60*pi/100;


x(6)=8;
y(6)=8;
theta(6)= 45*pi/100;


K=0.1;

rho = 10;

cx = 5 * [1 1 1 1 1 1];
cy = 5 * [1 1 1 1 1 1];

v = [1 1 1 1 1 1];

T = 200;
dt = 0.01;

iStep = 1;
xstore = zeros(round(T/dt),N);
ystore = zeros(round(T/dt),N);
thetastore = zeros(round(T/dt),N);
ustore = zeros(round(T/dt),N);
time = zeros(round(T/dt),1);

for t= 0:dt:T
    
    
    u = (1/rho)* (v + K*((x-cx).* cos(theta) + (y-cy).* sin(theta)));
    
    x = x + v.* cos(theta)*dt;
    y = y + v.* sin(theta)*dt;
    
    theta = theta + u*dt;
    
    
    xStore(iStep,:)= x;
    yStore(iStep,:)= y;
    thetaStore(iStep,:)= theta;
    time(iStep,:)= t;
    uStore(iStep,:)= u;
    iStep = iStep + 1;
    
    drawnow
    
end

figure(1)
plot(xStore,yStore,'LineWidth',2)
axis square
grid on
xlabel("X")
ylabel("Y")


figure (2)
plot (time,uStore,'LineWidth',2)
xlabel("time")
ylabel("control unit")
grid on








