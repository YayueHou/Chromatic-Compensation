function ft=ifft_h(FK)
    len=length(FK);
    ftt=1/len*fft(FK);
    ft=zeros(1,len);
    for i=2:len
        ft(i)=real(ftt(len-i+2));
    end
return 