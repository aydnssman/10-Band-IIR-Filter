clear all;
clc;
N=input('Enter Order: ');
Rp=input('Enter ripple gain(Rp)  in (dB)[0.01:1]: ');
Rs=input('Enter attenuation_gain(Rs) in (dB):[0.1:100]: ');
v=input('Enter gain values in a v vector [....] : ');  % during run of the program enter, v=[ 0.5  1.5  3]
g1=10^(v(1)/20); g2=10^(v(2)/20); g3=10^(v(3)/20); g4=10^(v(4)/20); g5=10^(v(5)/20);
g6=10^(v(6)/20); g7=10^(v(7)/20); g8=10^(v(8)/20); g9=10^(v(9)/20); g10=10^(v(10)/20);
[x1,fs]=audioread('your music file name or file path');
t = linspace(0,1,length(x1));

[b1,a1] = ellip(N,Rp,Rs,[0.02 0.04],'bandpass');
[h1,f]=freqz(b1,a1);
Logb1=20*log10(abs(h1)); %Convert back to dB

[b2, a2] = ellip(N,Rp,Rs,[0.04 0.06],'bandpass');
[h2,f]=freqz(b2,a2);
Logb2=20*log10(abs(h2));

[b3, a3] = ellip(N,Rp,Rs,[0.06 0.08],'bandpass');
[h3,f]=freqz(b3,a3);
Logb3=20*log10(abs(h3));

[b4, a4] = ellip(N,Rp,Rs,[0.08 0.10],'bandpass');
[h4,f]=freqz(b4,a4);
Logb4=20*log10(abs(h4));

[b5, a5] = ellip(N,Rp,Rs,[0.10 0.14],'bandpass');
[h5,f]=freqz(b5,a5);
Logb5=20*log10(abs(h5));

[b6, a6] = ellip(N,Rp,Rs,[0.14 0.20],'bandpass');
[h6,f]=freqz(b6,a6);
Logb6=20*log10(abs(h6));

[b7, a7] = ellip(N,Rp,Rs,[0.20 0.30],'bandpass');
[h7,f]=freqz(b7,a7);
Logb7=20*log10(abs(h7));

[b8, a8] = ellip(N,Rp,Rs,[0.30 0.50],'bandpass');
[h8,f]=freqz(b8,a8);
Logb8=20*log10(abs(h8));

[b9, a9] = ellip(N,Rp,Rs,[0.50 0.70],'bandpass');
[h9,f]=freqz(b9,a9);
Logb9=20*log10(abs(h9));

[b10, a10] = ellip(N,Rp,Rs,[0.71],'high');
[h10,f]=freqz(b10,a10);
Logb10=20*log10(abs(h10));

y1 = filter(b1,a1,x1);
y2 = filter(b2,a2,x1);
y3 = filter(b3,a3,x1);
y4 = filter(b4,a4,x1);
y5 = filter(b5,a5,x1);
y6 = filter(b6,a6,x1);
y7 = filter(b7,a7,x1);
y8 = filter(b8,a8,x1);
y9 = filter(b9,a9,x1);
y10 = filter(b10,a10,x1);

y_tot = (g1*y1+g2*y2+g3*y3+g4*y4+g5*y5+g6*y6+g7*y7+g8*y8+g9*y9+g10*y10);

figure(1)
subplot(4,3,1); plot(t,x1);grid on;xlim([0 1])
title('Orginal Signal')
subplot(4,3,2); plot(t,y1);grid on;xlim([0 1])
title('Bandpass Filter 1')
subplot(4,3,3); plot(t,y2);grid on;xlim([0 1])
title('Bandpass Filter 2')
subplot(4,3,4); plot(t,y3);grid on;xlim([0 1])
title('Bandpass Filter 3')
subplot(4,3,5); plot(t,y4);grid on;xlim([0 1])
title('Bandpass Filter 4')
subplot(4,3,6); plot(t,y5);grid on;xlim([0 1])
title('Bandpass Filter 5')
subplot(4,3,7); plot(t,y6);grid on;xlim([0 1])
title('Bandpass Filter 6')
subplot(4,3,8); plot(t,y7);grid on;xlim([0 1])
title('Bandpass Filter 7')
subplot(4,3,9); plot(t,y8);grid on;xlim([0 1])
title('Bandpass Filter 8')
subplot(4,3,10); plot(t,y9);grid on;xlim([0 1])
title('Bandpass Filter 9')
subplot(4,3,11); plot(t,y10);grid on;xlim([0 1])
title('Highpass Filter')
subplot(4,3,12); plot(t,y_tot);grid on;xlim([0 1])
title('Filtered Signal')

dB1 = mag2db(abs(h1));
dB2 = mag2db(abs(h2));
dB3 = mag2db(abs(h3));
dB4 = mag2db(abs(h4));
dB5 = mag2db(abs(h5));
dB6 = mag2db(abs(h6));
dB7 = mag2db(abs(h7));
dB8 = mag2db(abs(h8));
dB9 = mag2db(abs(h9));
dB10 = mag2db(abs(h10));

figure(2)

subplot(4,3,1);
plot(f/pi,dB1,'b');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,2);
plot(f/pi,dB2,'g');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,3);
plot(f/pi,dB3,'r');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,4);
plot(f/pi,dB4,'c');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,5);
plot(f/pi,dB5,'m');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,6);
plot(f/pi,dB6,'y');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,7);
plot(f/pi,dB7,'k');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,8);
plot(f/pi,dB8,'r');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
subplot(4,3,9);
plot(f/pi,dB9,'g');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
plot(f/pi,dB10,'g');grid on;
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
suptitle('Magnitude Response(dB)')


freq = 0:fs/length(x1):fs/2;
xdft = fft(x1);
ydft = fft(y_tot);

figure(3);
plot(freq/pi,abs(xdft(1:length(x1)/2+1)),'b','linewidth',1);
grid on;
hold on;
plot(freq/pi,abs(ydft(1:length(t)/2+1)),'r','linewidth',2);
title('Original and filtered signals in frequency domain.');
xlabel('Frequency(Hz)'); ylabel('Magnitude(dB)');
legend('Original Signal','Filtered Signal');
grid on
hold off;

figure(4); %increase/decrease by +/- [0-12] dB in dB magnitude
plot(f,[Logb1+v(1) Logb2+v(2) Logb3+v(3) Logb4+v(4) Logb5+v(5) Logb6+v(6) Logb7+v(7) Logb8+v(8) Logb9+v(9) Logb10+v(10)]); 
xlabel('Frequency(Hz)'); ylabel('Magnitude(dB)');
legend('BandPass1','BandPass2','BandPass3','BandPass4','BandPass5','BandPass6','BandPass7','BandPass8','BandPass9','HighPass1');
title('Frequency and Magnitude Graph')
grid on;

sound(x1,fs);
pause;
sound(y_tot,fs);