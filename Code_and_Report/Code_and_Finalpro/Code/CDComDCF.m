
function Tcx=CDComDCF(R_c_x)
global settings;

   
   beta2=-(-100)*(settings.Lam^2)/(2*pi*settings.Light)*10^(-21);
   %settings.w = 2*pi/settings.SymbolPeriod*transpose(; %角频率
%   t=decimate(linspace(-1/2,1/2,2048),DecimationRate,16,'fir' );
   t=linspace(-1/2,1/2,2048);
   w=2*pi/settings.SymbolPeriod*transpose(t);
   H=exp(1i/2*beta2.*w.^2*12.8);
   U_fft(:,1)=fftshift(fft(R_c_x));
  % H1=ifft(H)*1i;
 %linspace(-settings.Nt/2,settings.Nt/2,settings.Nt*settings.NumOfSymbol))
   U(:,1)=H.*U_fft(:,1);
   out=ifft(ifftshift(U)); %频域色散
   
   Tcx=transpose(out);
   
   
return