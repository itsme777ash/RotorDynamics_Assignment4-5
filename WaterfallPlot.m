V1 = test054(:,3);
H1 = test054(:,2);
Kp = test054(:,1);
Vresonance = V1(60*Fs:(65*Fs-1));
Hresonance = H1(3.8e5:(4.3e5-1));
Y = zeros(100,1);
T = zeros(100,1);
Vsec = zeros(10000,1);
Psecs = zeros(5001,100);
Fsecs = zeros(5001,100);

Fs = 10000;

%FFT
[f,P1] = FFT(Vresonance);
%stem(f,P1);
[Amp,MaxFreq] = max(P1);
ActFreq = (MaxFreq/25001)*5000;
for ti = 1:1:100
    disp((ti-1)*Fs + 1 + " : "+ ti*Fs);
    Vsec = V1((ti-1)*Fs + 1:ti*Fs,1);
    [f,P1] = FFT(Vsec);
    [Amp,MaxFreq] = max(P1);
    Psecs(:,ti) = P1;
    Fsecs(:,ti) = f;
    ActFreq = (MaxFreq/5001)*5000;
    Y(ti,1) = ActFreq;
    T(ti,1) = ti;
end
%plot3(Fsecs,transpose(T),Psecs);
%plot(Fsecs,Psecs);

% figure
% hold on
% for t = T
%     plot3(Fsecs(:,t),Psecs(:,t),t);
% end
% view(3)

% plot3(T,transpose(Fsecs),transpose(Psecs));

hr = ribbon(Fsecs(:,1),Psecs,1);
ln = length(hr);
% hold on
% for t = T
%     p = plot(Fsecs(:,t),Psecs(:,t));
%     plot3(t,p);
% end