
function T_c_x=CDComOF(R_c_x)
global settings;
  %  T=1/(settings.SymbolRate);  %1/单位时间内载波调制状态变化次数
  T=1/(settings.SymbolRate);  
  D=settings.FiberChromaticDispersion*10^(-12)/10^(-9)/10^3;%s/m/m
    Lf=settings.FiberLength*10^3;%m
    Lam=settings.Lam*10^(-9);%m
    t=linspace(-1/2,1/2,2048);
    c=settings.Light;%m/s
    NCD=(2*round(D*Lam^2*Lf/(2*c*T^2)));
    k=(-NCD/2):1:NCD/2;
    H1=sqrt(1i*c*T^2/(D*Lam^2*Lf))*exp(-1i*pi*c*T^2/(D*Lam^2*Lf).*(floor(k).^2));
    T_c_x=filter(H1,1,R_c_x);
end