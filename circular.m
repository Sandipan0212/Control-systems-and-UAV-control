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

v(1)= 1.0;
v(2)= 1.2;
v(3)= 1.4;
v(4)= 1.5;
v(5)= 1.8;
v(6)= 2;
v_initial = v;

K=0.1;

rho = 10;

cx = 5 * [1 1 1 1 1 1];
cy = 5 * [1 1 1 1 1 1];

%v = [2 1 3 1 0.5 1];

T = 200;
dt = 0.01;

L =[2 -1 0 0 0 -1; -1 3 -1 0 -1 0;0 -1 3 -1 0 -1;0 0 -1 2 -1 0; 0 -1 0 -1 3 -1;-1 0 -1 0 -1 3];


iStep = 1;
xstore = zeros(round(T/dt),N);
ystore = zeros(round(T/dt),N);
vstore = zeros(round(T/dt),N);
thetastore = zeros(round(T/dt),N);
ustore = zeros(round(T/dt),N);
time = zeros(round(T/dt),1);

for t= 0:dt:T
    
    u1 = -L*v';
    v = v + u1'*dt;
    u = (1/rho)* (v + K*((x-cx).* cos(theta) + (y-cy).* sin(theta)));
    
    x = x + v.* cos(theta)*dt;
    y = y + v.* sin(theta)*dt;
    
    theta = theta + u*dt;
    
    vStore(iStep,:)=v;
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


figure(3)
plot(time,vStore,'Linewidth',2)
xlabel("time")
ylabel("velocity")
axis([0 5 0.5 2.5])
grid on





