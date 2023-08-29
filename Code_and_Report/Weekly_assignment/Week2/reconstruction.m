clear;
clc;
fs1=14000;    %Hz
fs2=10000;    %Hz
x1=sample(fs1,1);
x2=sample(fs2,2);
xfil=Bfilter(x2,fs2,4,6000);

%t=0:1/fs1:0.01;
%x=5*cos(2*pi*2000*t)+3*cos(2*pi*3000*t)+3*cos(2*pi*4500*t)+cos(2*pi*6000*t

[y1,fx1]=specture(x1,fs1);

[y2,fx2]=specture(x2,fs2);
[y2fil,fx2f]=specture(xfil,fs2);
plotspec(fx1,y1,"Specture of 14000Hz Sample",3,1,1);
plotspec(fx2,y2,"Specture of 10000Hz Sample",3,1,2);
plotspec(fx2f,y2fil,"Specture of 14000Hz Sample with filter",3,1,3);
%plot(t,x);hold on;
%使用butterworth滤波器进行滤波，结果幅值有略微的衰减

xr2=reconst(x2,fs2);
xrfil=reconst(xfil,fs2);
xr1=reconst(x1,fs1);

t1=-0.005:1/100/fs1:0.005;
t2=-0.005:1/100/fs2:0.005;
x=5*cos(2*pi*2000*t1)+3*cos(2*pi*3000*t1)+3*cos(2*pi*4500*t1)+cos(2*pi*6000*t1);


figure("Name","Less Sampled signal without filter");
plotrecon(x2,xr2,100*fs2);

figure("Name","Less Sampled signal with Butterworth filter");
plotrecon(xfil,xrfil,100*fs2);

figure("Name","Full Sampled signal with Butterworth filter");
plotrecon(x1,xr1,100*fs1);

function x=sample(fs,n)
    t=-0.05/2:1/fs:0.05/2;
    x=5*cos(2*pi*2000*t)+3*cos(2*pi*3000*t)+3*cos(2*pi*4500*t)+cos(2*pi*6000*t);
    name="origin signal--"+fs;
    subplot(2,1,n);
    plot(t,x);
    title(name);
end

function [Y,fx]=specture(x,fs)
    %Apply Fast Fourier transform
    xf=fft(x);
    %Get the length of the artix
    N=length(xf);
    %Make the plot exchage
    fx = (-N/2:N/2-1)*fs/N;
    y=fftshift(abs(xf));

    Y=y*2/N;
    Y(1)=Y(1)/2;
end

function plotspec(fx,Y,name,m,x,n)
    subplot(m,x,n);
    plot(fx,Y);
    title(name);
end

function xfil=Bfilter(x,fs,n,fh)
    [b,a]=butter(n,min(3500,fh)/(fs/2),'low');
    xfil=filter(b,a,x);
end

function xr=reconst(x,fs)
     n=-0.05/(1/fs)/2:0.05/(1/fs)/2;
     t=-0.005:1/100/fs:0.005;
     %\siigma_-\infinity^\infinity()转化成矩阵计算
     xr=x*sinc(fs*(ones(length(n),1)*t-(1/fs)*(n'*ones(1,length(t)))));
end

function plotrecon(xs,xr,fs)
    t=-0.005:1/fs:0.005;
    x=5*cos(2*pi*2000*t)+3*cos(2*pi*3000*t)+3*cos(2*pi*4500*t)+cos(2*pi*6000*t);
    subplot(2,2,1);
    stem(xs);
    title("Sampled signal");
    subplot(2,2,2);
    plot(t,x);
    title("Origin signal");
    subplot(2,2,3);
    plot(t,xr);
    title("Reconstructed signal");
    [Y,fx]=specture(xr,fs);
    plotspec(fx,Y,"Specture of Reconstructed signal",2,2,4)
    %title("Specture of Reconstructed signal");
    
end


