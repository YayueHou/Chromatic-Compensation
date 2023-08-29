function re=butter(x,N)
   if(N<=2)
       re=x;
       return;
   end
   w=(exp(-2*pi*1i*((1:N/2)-1)/N));
   %W=diag(w);
   s=size(x);
   re1=zeros(2*s(1),N/2);
   j=1;
   for i=1:s(1)
      a=x(i,1:N/2)+x(i,N/2+1:N);
      b=((x(i,1:N/2)-x(i,N/2+1:N)).*w);
     
      re1(j,:)=a;
      re1(j+1,:)=b;
      j=j+2;
   end
   re1=butter(re1,N/2);
   re=re1;
end
 