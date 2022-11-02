V1 = test004(:,3);

Fs = 10000;
Y = fft(V1);
L = length(V1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
% figure(2)
% 
stem(f,P1)

%Natural Frequency = 45 Hz
% sampleRate = 10000;
% VFilter = bandpass(V1,[42,50],sampleRate); %Sampling rate = 10k samples/sec
% plot(VFilter);