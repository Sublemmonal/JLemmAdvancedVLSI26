% Jaiden Lemm - Advanced VLSI Midterm Project - This code will scale and
% quantize the filter and plot the results, comparing it to the original
% unquantized code.

clear; clf; close all;

%% Variable and filter setup
n = 330;
f = [0 0.2 0.23 1];
A = [1 1 0 0];

tapspm = firpm(n,f,A);