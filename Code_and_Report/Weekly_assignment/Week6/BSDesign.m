M=25;

OmegaL=0.3*pi;
OmegaH=0.6*pi;
n=-M:M;

% 1.Rectangular window
wrec=1.*(-M<=n<=M)+0;
% 2.Triangular window
wtri=1-abs(n)/M;
% 3.Hanning window
whan=0.5+0.5*cos(n*pi/M);
% 4.Hamming window
wham=0.54+0.46*cos(n*pi/M);
% 5.Blackman window
wblk=0.42+0.5.*cos(n*pi/M)+0.08*cos(2*pi*n/M);


W = linspace(-pi,pi,2048); 
h=(pi-OmegaH+OmegaL)/pi.*(n==0)+(-(sinc(OmegaH*(-M:M)/pi)/pi*OmegaH-sinc(OmegaL*(-M:M)/pi)/pi*OmegaL)).*(n~=0);

[hz,w]=freqz(h, 1, 512);
phi=180*unwrap(angle(hz))/pi;
subplot(2,1,1), plot(w,20*log10(abs(hz))),grid;
xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
subplot(2,1,2), plot(w, phi); grid;
xlabel('Frequency (radians)');
ylabel('Phase (degrees)');

wrec=wrec.*h;
wtri=wtri.*h;
whan=whan.*h;
wham=wham.*h;
wblk=wblk.*h;

[hr1,w1]=freqz(wrec,1,W);
phi1=180*unwrap(angle(hr1))/pi;
[hr2,w2]=freqz(wtri,1,W);
phi2=180*unwrap(angle(hr2))/pi;
[hr3,w3]=freqz(whan,1,W);
phi3=180*unwrap(angle(hr3))/pi;
[hr4,w4]=freqz(wham,1,W);
phi4=180*unwrap(angle(hr4))/pi;
[hr5,w5]=freqz(wblk,1,W);
phi5=180*unwrap(angle(hr5))/pi;
% 
 figure("Name","Rectangular Windows");
 subplot(2,1,1),plot(abs(w1/pi),(20*log10(abs(hr1)))),grid;
 xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 subplot(2,1,2), plot(w1/pi, phi1); grid;
xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 figure("Name","Triangular Windows");
 subplot(2,1,1),plot(abs(w2/pi),(20*log10(abs(hr2)))),grid;
xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 subplot(2,1,2), plot(w2/pi, phi2); grid;
xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 figure("Name","Hanning Windows");
 subplot(2,1,1), plot(abs(w3/pi),(20*log10(abs(hr3)))),grid;
 xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 subplot(2,1,2), plot(w3/pi, phi3); grid;
 xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 figure("Name","Hamming Windows");
 subplot(2,1,1),plot(abs(w4/pi),(20*log10(abs(hr4)))),grid;
xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 subplot(2,1,2), plot(w4/pi, phi4); grid;
 xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 figure("Name","Blackman Windows");
 subplot(2,1,1),plot(abs(w5/pi),(20*log10(abs(hr5)))),grid;
 xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')
 subplot(2,1,2), plot(w5/pi, phi5); grid;
xlabel('Frequency (radians)');
ylabel('Magnitude Response (dB)')

    