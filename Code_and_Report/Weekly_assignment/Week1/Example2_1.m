fs=8000;
f0=1000;
t=0:1/fs:1;
A=5;

x=A*cos(2*pi*f0*t);
N=length(x);
%Sketch the spectrum
y=fft(x);
w=fftshift(abs(y));
w=w/N;
f=(-N/2:N/2-1)*fs/N;
%w(f<1e-5)=0;

figure("Name","Origin signal spectrum");
plot(f,w);

figure("Name","Q2")
fs=000;

while fs<60000
    t=0:1/fs:1;
    x=A*cos(2*pi*f0*t);
    N=length(x);
    y=fft(x);
    w=fftshift(abs(y));
    w=w/N;
    %figure("Name","Q2")
    f=(0:N-1)*fs/N;
    plot(f,w);hold on;
    f=(-N:-1)*fs/N;
    plot(f,w);hold on;
    fs=fs+8000;
end