M=120;

% 1.Rectangular window:Wrec(n)=1  -M<=n<=M
Omegac=0.5*pi;
n=-M:M;

wrec=ones(1,2*M+1);
wtri=1-abs(n)/M;
whan=0.5+0.5*cos(n*pi/M);
wham=0.54+0.46*cos(n*pi/M);
wblk=0.42+0.5.*cos(n*pi/M)+0.08*cos(2*pi*n/M);

x=sin(n);

y1=wrec.*x;
y2=wtri.*x;
y3=whan.*x;
y4=wham.*x;
y5=wblk.*x;

w1=abs(fft(y1));
w2=abs(fft(y2));
w3=abs(fft(y3));
w4=abs(fft(y4));
w5=abs(fft(y5));

f1=fftshift(w1);
f2=fftshift(w2);
f3=fftshift(w3);
f4=fftshift(w4);
f5=fftshift(w5);
k=abs(n);
figure("Name","Rectangular Windows");
plot(k,f1);
figure("Name","Triangular Windows");
plot(k,f2);
figure("Name","Hanning Windows");
plot(k,f3);
figure("Name","Hamming Windows");
plot(k,f4);
figure("Name","Blackman Windows");
plot(k,f5);



