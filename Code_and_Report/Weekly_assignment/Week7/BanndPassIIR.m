wl=400*pi;
wh=600*pi;
W=wh-wl;
w0=sqrt(wl*wh);
syms s
w=(s^2+w0^2)/(s*W);
hs=1/(1+w);
[num,den]=numden(hs);
b=sym2poly(num);
a=sym2poly(den);


v=0:1:4000;
H=freqs(b,a,v);
plot(v, abs(H),'k'); grid
