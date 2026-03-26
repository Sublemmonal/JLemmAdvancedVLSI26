% Jaiden Lemm - Advanced VLSI Midterm Project - This code will scale and
% quantize the filter and plot the results, comparing it to the original
% unquantized code.

clear; clf; close all;

%% Variable and filter setup
ntap = 330;
ftap = [0 0.2 0.23 1];
Atap = [1 1 0 0];

taps = firpm(ntap,ftap,Atap);
freqz(taps,1,512)

%% Filter taps scaling
% Since the filter taps are all decimals, we can scale the taps by some 
% factor, truncate, and then divide the output by said factor after
% performing the FIR operation

scale = 2^16;
bits = 16;

tapsb = strcat('0b',dec2bin(taps*scale,bits),'s',string(bits));

tapsb2d = bin2dec(tapsb)/scale;

figure
freqz(tapsb2d,1,512)