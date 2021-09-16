%%Espectro Potencia de una se�al voz%%
clear, clc,clf;
informacion=audioinfo('D:\MATLAB Trabajos\PDS Carrillo Labo\LabPDSTR-DFT-Avila-V1\vozRihana.wav');
fm=48000;%frecuencia de muestreo 9600KHz/para fir 8000
tm=1/fm;%periodo de muestreo 
xn=audioread('D:\MATLAB Trabajos\PDS Carrillo Labo\LabPDSTR-DFT-Avila-V1\vozRihana.wav');
xn=xn(:,1);%solo un canal de la se�al
N=length(xn);
n=0:tm:(N-1)*tm;
subplot(3,1,1), plot(n,xn,'g'); grid; %se�al 
title('Se�al en Tiempo Voz Rihana');
xlabel('t(s)');
subplot(3,1,2); 
pspectrum(xn,fm,'spectrogram','TimeResolution',2);%Especifique una resoluci�n de tiempo de 5 segundo
title('Espectrograma del Voz')
xlabel('Tiempo(s)');

Pf=fft(xn)/N;
ModPf=abs(Pf);
df=fm/N;
f=0:df:(N-1)*df;
subplot(3,1,3),plot(f,ModPf,'r')
title('Se�al en en frecuencia');
xlabel('f(Hz)'), grid;

%%NDVI DE LA VEGETACION%%
% fm=30;%frecuencia de muestreo 30 dias
% tm=1/fm;%periodo de muestreo 
% xn =load('D:\MATLAB Trabajos\PDS Carrillo Labo\LabPDSTR-Estimaci�n del Espectro de Potencia-V1\Vegetacion-Pachacamac.txt');
% N=length(xn);
% n=0:tm:(N-1)*tm;
% subplot(2,1,1), plot(n,xn,'g'); grid; %se�al 
% title('Se�al en Tiempo NDVI Vegetacion Pachacamac');
% xlabel('A�os');
% ylabel('NDVI');
% subplot(2,1,2); 
% pspectrum(xn,fm,'spectrogram','TimeResolution',5)%Especifique una resoluci�n de tiempo de 5 segundo
% title('Espectrograma del indicador de vegetacion Pachacamac')
% xlabel('Tiempo(A�os)');

% figure(2), imshow(xn, []), title('NDVI');
% colormap();
% colorbar;
% impixelinfo
% % axis([0 0.01 -1 1]);
