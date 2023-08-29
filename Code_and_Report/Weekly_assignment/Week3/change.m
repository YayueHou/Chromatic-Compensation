function re=change(X,N)
    re=zeros(1,N);
    m=log2(N);
    for i=1:N
        q=dec2bin(i-1,m);
        p=fliplr(q);
        k=bin2dec(p)+1;
        re(i)=X(k);
    end
    return;
end