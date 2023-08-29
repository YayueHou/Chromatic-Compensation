f1=1000;
f2=3000;
fs=9000;


t=0:1/fs:0.01;
y=sin(2*pi*f1*t)+sin(2*pi*f2*t);

FK=fft(y);
ft1=ifft_h(FK);
ft2=ifft(FK);
plot(t,y);
figure;
plot(t,ft1);
figure;
plot(t,ft2);