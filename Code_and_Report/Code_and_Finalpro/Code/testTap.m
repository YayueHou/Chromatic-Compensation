function T_c_x=testTap(R_c_x,x_seq_I,x_seq_Q)
global settings;
  %  T=1/(settings.SymbolRate);  %1/单位时间内载波调制状态变化次数
  T=1/(settings.SymbolRate);  
  D=settings.FiberChromaticDispersion*10^(-12)/10^(-9)/10^3;%s/m/m
    Lf=settings.FiberLength*10^3;%m
    Lam=settings.Lam*10^(-9);%m
    c=settings.Light;%m/s
    NCD=(2*round(D*Lam^2*Lf/(2*c*T^2))+1); 
    taps=zeros(2,7);
    q=zeros(1,7);
    for i=1:7
   
        k=(-NCD/2):1:NCD/2;
        H1=sqrt(1i*c*T^2/(D*Lam^2*Lf))*exp(-1i*pi*c*T^2/(D*Lam^2*Lf).*(floor(k).^2));
        T_c_x=filter(H1,1,R_c_x);
        [numiof,numqof,taps(1,i),taps(2,i),xiof,xqof,ofelecx_i,ofelecx_q]=CalErrCode(T_c_x,x_seq_I,x_seq_Q);
        q(i)=NCD;
        NCD=NCD-1;
        
    end
    plot(q,taps(1,:));hold on;
    plot(q,taps(2,:));
    title("The relation of BER and Tap nummber");
    xlabel("Taps");
    ylabel("BER");
end