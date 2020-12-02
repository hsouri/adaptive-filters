clc
close all
clear all

N=input('length of sequence N = ');
t=linspace(1,N,N);
d=cos(2*pi*t/N);
x=sin(2*pi*t/N);
w=zeros(1,N); 
mu=input('mu = ');

M=input('Number of irretate = ');
for j=1:M
 
for i=1:N
   e(i) = d(i) - w(i)' * x(N-i+1);
   w(i) = w(i) + mu * e(i) * x(N-i+1);
end

for i=1:N
yd(i) = w(i)' * x(N-i+1);  
end

end
figure(1); 
plot(t,d)
ylabel('Desired Signal')
xlabel('n')
xlim([0 N]);
grid on

figure(2);
plot(t,x)
ylabel('Input Signal+Noise')
xlabel('n')
xlim([0 N]);
grid on

figure(3)
plot(t,e)
ylabel('Error')
xlabel('n')
xlim([0 N]);
grid on

figure(4)
plot(t,yd)
ylabel('Adaptive Desired output')
xlabel('n')
xlim([0 N]);
grid on

figure(5)
plot(t,w)
ylabel('Filter coefficients')
xlabel('n')
xlim([0 N]);
grid on

% ideal derivative filter
D_w = [linspace(-50,50,N/2) linspace(-50,50,N/2)];
figure(6)
plot(D_w);
ylabel('Filter Coefficients');
xlabel('n');
xlim([0 N]);
grid on
ylabel