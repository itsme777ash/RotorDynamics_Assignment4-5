V1 = coastup(:,3);
H1 = coastup(:,2);
Kp = coastup(:,1);
Vresonance = V1(4.2e5:(4.6e5-1));
Hresonance = H1(3.8e5:(4.3e5-1));

Fs = 10000;
f0 = 43.6; %Spin rate of rotor 
Y = fft(Hresonance);
L = length(Hresonance);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
% figure(2)
%plot(f,P1)
plot(V1);
t = transpose(0:1/Fs:100 - (1/Fs));
%plot(t,Kp);