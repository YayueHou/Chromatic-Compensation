%1.y(n)-0.5y(n-1)+0.3y(n-2)=x(n)+0.5x(n-1)
a=[1 -0.5 0.3];
b=[1 0.5];
n=0:100;
x=(0.5).^n;
y=filter(b,a,x);
stem(n,y);
plot(n,y);