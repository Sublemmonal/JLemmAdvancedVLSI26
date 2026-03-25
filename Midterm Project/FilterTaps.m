% Jaiden Lemm - Advanced VLSI Midterm Project - This code will generate a 
% 100 tap low-pass FIR filter with a transition region of 0.2pi to 0.23pi
% and attenuation of 80dB

clear; clf; close all;

%% Variable setup
n = 330;
f = [0 0.2 0.23 1];
A = [1 1 0 0];

%% Frequency Sampling FIR Filter
taps2 = fir2(n,f,A);

freqz(taps2,1,512)
[h2,w2] = freqz(taps2,1,512);

figure

%% Parks-McClellan FIR Filter
tapspm = firpm(n,f,A);

freqz(tapspm,1,512)
[hpm,wpm] = freqz(tapspm,1,512);

figure

%% Kaiser Window LP FIR Filter
fk = [0.2 0.23];
Ak = [1 0];
dev = [0.05 10^-4];

[n,Wn,beta,ftype] = kaiserord(fk,Ak,dev);
tapsk = fir1(n,Wn,ftype,kaiser(n+1,beta),"noscale");

freqz(tapsk,1,512)
[hk,wk] = freqz(tapsk,1,512);

figure

%% Plot and compare
plot(f,A,w2/pi,abs(h2),wpm/pi,abs(hpm),wk/pi,abs(hk))

legend('Ideal','Freq n-Tap Filter', 'PM n-Tap Filter', 'Kaiser n-tap Filter')
xlabel('Radian Frequency (\omega/\pi)'); ylabel('Magnitude');