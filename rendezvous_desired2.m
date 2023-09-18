close all;
clear all;
clc;

N=6;

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


%online plotting option
nHistory = 600;
xHist = inf*ones(nHistory,N);
yHist = inf*ones(nHistory,N);
uxHist = inf*ones(nHistory,N);
uyHist = inf*ones(nHistory,N);

iFrame=0;

T=120;
dt=0.1;



%control loop
for t =0:dt:T
    ux = [(1-x(1)) (x(3)-x(2)) (x(4)-x(3)) (x(5)-x(4)) (x(6)-x(5)) (x(1)-x(6))];
    uy = [(1-y(1)) (y(3)-y(2)) (y(4)-y(3)) (y(5)-y(4)) (y(6)-y(5)) (y(1)-y(6))];
    
    xHist = [x;xHist(1:end-1,:)];
    yHist = [y;yHist(1:end-1,:)];
    
    clf
    plot(xHist,yHist,'linewidth',2);
    hold on
    grid on
    plot(x,y,'o');
    
    xlabel('X');
    ylabel('Y');
    grid on
    
     
   drawnow
    
    %update function
    
    x = x + ux*dt;
    y = y + uy*dt;
    
    
    
    
    
    
end








