informacion=audioinfo('C:\Users\JORGE\Downloads\vozRihana.wav');
[m, fs] =audioread ('C:\Users\JORGE\Downloads\vozRihana.wav');
m=m(:,1); 
Ts=1/fs; 
tmensaje=Ts:Ts:length (m)*Ts'; 
Nmensaje=length (m); 
[Smm, f]=pwelch (m, ones (1, 4800),0, [], fs, 'twoside'); 
Smm=fftshift (Smm) ; f=fftshift (f); 
f(1:floor (length (f)/2))=f (1:floor (length (f)/2))-fs; 
figure (); 
subplot (3,1,1); 
plot (tmensaje, m);
title ('señal de audio'); 
xlabel ('tiempo [s]'),ylabel ('[v]');
subplot (3,1,2);
plot (f, Smm, '.-','linewidth',1.5);
title ('Densidad espectral de potencia ');
xlabel ('frecuencia [Hz]'), ylabel (['v^2']);
% xlim ([-5e3 5e3]);
axis([-30 2000 0 0.00007]);
Pm=sum (abs (m).^2)/Nmensaje; 
fprintf('La potencia de la señal es: %d [v^2]\n', Pm) 
sound (m, fs)
%-----------------------------
Pf=fft(m)/Nmensaje;
ModPf=abs(Pf);
df=fs/Nmensaje;%defino intervalo 
f=0:df:(Nmensaje-1)*df;
subplot(3,1,3);
plot(f,ModPf,'m'); title('Señal en en frecuencia'); grid;%espectro de la señal
xlabel('f(Hz)');
axis([-30 2000 0 0.01]);