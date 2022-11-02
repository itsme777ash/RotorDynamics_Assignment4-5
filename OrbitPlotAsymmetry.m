V1 = test044(:,3);
H1 = test044(:,2);

Fs = 10000;
f0 = 43.6; %Spin rate of rotor 
Y = fft(H1);
L = length(H1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
% figure(2)
%plot(f,P1)


t = 0:1/Fs:10 - (1/Fs); %For TSA, specifies the rate at which samples are collected
tpulse = 0:1/f0:max(t); %For performing TSA, specifies the start and end of each cycle
sampleRate = 10000;
VFilter = bandpass(V1,[100,110],sampleRate); %Sampling rate = 10k samples/sec
HFilter = bandpass(H1,[60,70],sampleRate);
HTsa = tsa(H1,sampleRate,tpulse);
VTsa = tsa(V1,sampleRate,tpulse);

figure
hold on
plot(H1,V1,'green');
plot(HTsa,VTsa,'red');
hold off
% plot(HFilter,VFilter);