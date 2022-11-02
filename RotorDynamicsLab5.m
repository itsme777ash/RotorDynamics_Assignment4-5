F1 = raptest(:,2);

Fs = 10000;
Y = fft(F1);
L = length(F1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
% figure(2)
% 
%stem(f,P1)

%Natural Frequency = 45 Hz
sampleRate = 10000;
FFilter = bandpass(F1,[42,50],sampleRate); %Sampling rate = 10k samples/sec
plot(FFilter);