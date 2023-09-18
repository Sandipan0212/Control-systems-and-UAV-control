clear
clc
close all

F=[0.1 0.1 0.1;0.1 0.1 1;0 0 1];
H=[1 1 1];

N  = 10;                        
X  = zeros(3,N);          
y  = zeros(1,N);       


noise =  randn(3,N);
Q = cov(noise');  


Obv_noise = ones(1,N);
R = cov(Obv_noise');          

X(:,1) = [1 0 0]'; 
Px = eye(3); 
xh(:,1) = randn(3,1);
 

for i = 3 : N
    X(:,i) = F * X(:,i-1) + noise(:,i);
    y(:,i) = H * X(:,i)   + Obv_noise(:,i);
end


for i = 1 : N
    
    xh_(:,i) = F * xh(:,i);
   
    Px_ = F*Px*F' + Q;
    
    K = Px_ * H' * inv(H*Px_*H' + R);
   
    yh_(:,i) = H * xh_(:,i) + R;
   
    inov(:,i) = y(:,i) - yh_(:,i);
   
    xh(:,i+1) = xh_(:,i) + K * inov(:,i);
   
    Px = Px_ - K*H*Px_;
   
end
   
figure 
plot(y,'b')
hold on, 
plot(yh_,'r')

