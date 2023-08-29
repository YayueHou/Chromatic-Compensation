M=5;

% 1.Rectangular window:Wrec(n)=1  -M<=n<=M
Omegac=0.5*pi;
n=-M:M;

wrec=ones(1,2*M+1);
wtri=1-abs(n)/M;
whan=0.5+0.5*cos(n*pi/M);
wham=0.54+0.46*cos(n*pi/M);

W = linspace(-pi,pi,2048); 

h=(Omegac/pi).*(n==0)+(sin(Omegac*n)/(n*pi)).*(n~=0 & n<=M & n>=-M);
xin=sin(n);


wrec=wrec.*h;
wtri=wtri.*h;
whan=whan.*h;
wham=wham.*h;

b=h;

[hr1,w1]=freqz(wrec,1,W);
[hr2,w2]=freqz(wtri,1,W);
[hr3,w3]=freqz(whan,1,W);
[hr4,w4]=freqz(wham,1,W);

subplot(4,1,1), plot(w1/pi,(20*log10(abs(hr1)))),grid;
title("rectangular window");
ylabel("dB");
subplot(4,1,2), plot(w2/pi,(20*log10(abs(hr2)))),grid;
title("triangle window");
ylabel("dB");
%axis([-1 1 -100 100]);
subplot(4,1,3), plot(w3/pi,(20*log10(abs(hr3)))),grid;
title("hanning window");
ylabel("dB");
%axis([-1 1 -100 100]);
subplot(4,1,4), plot(w4/pi,(20*log10(abs(hr4)))),grid;
title("Hamming window");
ylabel("dB");
%axis([-1 1 -100 100]);   
   
figure;
subplot(4,1,1), plot(w1/pi,abs(hr1)),grid;

subplot(4,1,2), plot(w2/pi,abs(hr2)),grid;
%axis([-1 1 -100 100]);
subplot(4,1,3), plot(w3/pi,abs(hr3)),grid;
%axis([-1 1 -100 100]);
subplot(4,1,4), plot(w4/pi,abs(hr4)),grid;
%axis([-1 1 -100 100]);   
    