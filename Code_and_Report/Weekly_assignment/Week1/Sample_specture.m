   
clear;
clc;
f1=1000;
f2=3000;
A1=5;
A2=3;
fs=16000;
t=0:1/fs:0.01;
y1=A1*sin(2*pi*f1*t);
y2=A2*sin(2*pi*f2*t);
y3=y1+y2;

%sketch the origin signal
figure("Name","origin signal1");
plot(t,y1);hold;
plot(t,y1);hold;
xlabel("t/sec");
ylabel("signal amplitude")

figure("Name","origin signal2");
plot(t,y3);hold;
xlabel("t/sec");
ylabel("signal amplitude")

%Apply Fast Fourier transform on y3 and y1
y1f=fft(y1);
y3f=fft(y3);

%Get the length of the artix
N1=length(y1f);
N3=length(y3f);

%Make the plot exchage
fx1 = (-N1/2:N1/2-1)*fs/N1;
y1w=fftshift(abs(y1f)/length(y1f)*2);

fx3 = (-N3/2:N3/2-1)*fs/N3;
y3w=fftshift((abs(y3f))/length(y3f)*2);

%Sketch the frequecy of y1
figure("Name","Frequency domain of y1");
y1w(fx1<1e-5)=0;
plot(fx1,y1w);

%Sketch the frequecy of y3
figure("Name","Frequency domain of y3");
y3w(fx3<1e-5)=0;
plot(fx3,y3w);

