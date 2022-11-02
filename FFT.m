function [f,P1] = FFT(Signal)
%FFT Summary of this function goes here
%   Detailed explanation goes here

Fs = 10000;
Y = fft(Signal);
L = length(Signal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
end

