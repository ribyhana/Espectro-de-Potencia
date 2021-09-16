% clear;clf;clc;
% f=100;
% fm=2000;
% Tm=1/fm;
% N=1024;
% n=0:Tm:(N-1)*Tm;
% rdn=randn(1,N);
% figure(1)
% stem(n,rdn,'r');grid;
% axis([0 0.05 -3 3]);
% xlabel('n');
% ylabel('x[n]');
% A=[1 -0.9];
% B=[0.3 0.24];
% yn=filter(B,A,rdn);
% figure(2)
% plot(n,yn);grid;
% 
% % Pxx=dft_01(xn);
% Pxx=fft(rdn);
% ModPxx=abs(Pxx);%modulo o magnitud el absoluto
% ModPxx2=ModPxx.*ModPxx;
% Pxx=ModPxx2/N;
% df=fm/N;
% f=0:df:(N-1)*df;
% figure(3)
% plot(f,Pxx,'.-b');grid; %1ero ModPxx
% xlabel('Hz');
% % axis([0 1000 0 100])%fm/2=1000 fm=2000
% 
% %PDSrandn(10,1) una columna 10 datos randn(1,10) una fila 10 datos
clear;clf;clc;
f=100;
fm=2000;
Tm=1/fm;
N=512;
n=0:Tm:(N-1)*Tm;
xn=cos(2*pi*f*n);

figure(1)
stem(n,xn,'r');grid;
axis([0 0.05 -1.1 1.1]);
xlabel('n');
ylabel('x[n]');

% Pxx=dft_01(xn);
Pxx=fft(xn);
ModPxx=abs(Pxx);%modulo o magnitud el absoluto
ModPxx2=ModPxx.*ModPxx;
Pxx=ModPxx2/N;
df=fm/N;
f=0:df:(N-1)*df;

figure(2)
plot(f,Pxx,'.-b');grid; %1ero ModPxx
xlabel('Hz');
axis([0 1000 0 100])%fm/2=1000 fm=2000
Area=sum(ModPxx2);
