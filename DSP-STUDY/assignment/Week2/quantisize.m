BitWidth=8;

fs1=8000;
fs2=140000;


[x1,t1,tt1]=sample(fs1);
[x2,t2,tt2]=sample(fs2);

[xq1,xqt1,SNR1]=getquantisize(x1,fs1,BitWidth);
plotres(x1,xqt1,t1,tt1,fs1,SNR1);

[xq2,xqt2,SNR2]=getquantisize(x2,fs2,BitWidth);
plotres(x2,xqt2,t2,tt2,fs2,SNR2);

function [x,t,tt]=sample(fs)
    t=-0.005:1/fs:0.005;
    x=5*cos(2*pi*2000*t)+3*cos(2*pi*3000*t)+3*cos(2*pi*4500*t)+cos(2*pi*6000*t);
    tt=-0.005:0.01/(length(x)*1000-1):0.005;
end

function [lr,hr]=quantisize(x,fs,T,l,h)
    if(h-l<=1)
        lr=l;
        hr=h;
        return;
    end
    if(x<=T(floor((l+h)/2)))
        [lr,hr]=quantisize(x,fs,T,l,floor((l+h)/2));
    elseif(x>T(floor((l+h)/2)))
        [lr,hr]=quantisize(x,fs,T,ceil((l+h)/2),h);
    end
end


function [xq,xqt,SNR]=getquantisize(x,fs,BitWidth)
    N=2^BitWidth-1;
    SN=length(x);
    xq=ones(SN,1);
    eq=ones(SN,1);
    xqt=zeros(SN*1000,1);
    q=(max(x)-min(x))/N;
    T=min(x):q:max(x);
    for i=1:SN
        [lr,hr]=quantisize(x(i),fs,T,1,N);
        xq(i)=max(T(lr),T(hr));
        eq(i)=xq(i)-x(i);
        for j=1:length(xqt)/SN
            xqt(j+(i-1)*1000)=xq(i);
        end     
    end
    sigPower=sum(abs(x).^2)/length(x);
    noiPower=sum(abs(eq).^2)/length(eq);
    SNR=sigPower/noiPower;
end

function plotres(x,xqt,t,tt,fs,SNR)
    SNRdb=10*log10(SNR);
    figure("Name","SNR="+SNRdb+"dB");
    subplot(2,1,1);
    plot(t,x);
    title("Origin signal with "+fs+"Hz Sampled");
    subplot(2,1,2);
    plot(tt,xqt);
    title("Quantisized signal");
end