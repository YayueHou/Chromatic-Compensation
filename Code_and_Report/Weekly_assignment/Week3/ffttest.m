N=2^10;
x=0:0.1:N/10-0.1;

y=sin(x);
fs=N;
f=0:fs/N:fs-fs/N;
t1=cputime;
X=abs(h_fft(y,N));
t2=cputime;
ta=t2-t1;

%print(X);
t1=cputime;
X1=abs(fft(y));
t2=cputime;
tb=t2-t1;
%stem(X1);
figure(1);
plot(f,X1);
figure(2);
plot(f,X);