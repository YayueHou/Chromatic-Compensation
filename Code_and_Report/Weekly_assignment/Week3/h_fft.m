function X=h_fft(x,N)
   xn=butter(x,N);
   n=N/2;
   X1=zeros(1,N);
   j=1;
   for i=1:n
       X1(j)=xn(i,1)+xn(i,2);
       X1(j+1)=xn(i,1)-xn(i,2);
       j=j+2;
   end
   X=change(X1,N);
end

