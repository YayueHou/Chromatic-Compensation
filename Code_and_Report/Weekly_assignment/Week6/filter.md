


Bandstop filter:
$$ H(e^{j\omega})=\begin{cases} 0 \qquad  |\Omega_L| \leq |\Omega| \leq |\Omega_H|   \\  1  \qquad 0\leq |\Omega| \leq |\Omega
_L|\quad or \quad |\Omega_H|\leq |\Omega|\leq \pi \end{cases} $$
$$ H(z)=\sum_{n=0}^{\infty}h(n)z^{-n} $$
$$ H(e^{j\Omega})=\sum_{n=0}^{\infty}h(n)e^{-j\Omega n}  $$
consider $H(e^{j\Omega})$as a sequence then its fourior series form is 
$$ H(e^{j\Omega})=\sum_{n=-\infty}^{\infty}c_ne^{-j\Omega n} $$
obtain $c_n$ by inverse transform
$$ h(n)=c_n=\frac{1}{2\pi}\int_{-\pi}^{\pi}H(e^{j\Omega})e^{j\Omega n}d\Omega$$
For $n!=0$
$$h(n)=\frac{1}{2\pi}\int_{-\pi}^{-\Omega_H}e^{j\Omega n}d\Omega +\frac{1}{2\pi}\int_{-\Omega_L}^{0}e^{j\Omega n}d\Omega+\frac{1}{2\pi}\int_{0}^{\Omega_L}e^{j\Omega n}d\Omega+\frac{1}{2\pi}\int_{\Omega_H}^{\pi}e^{j\Omega n}d\Omega
\\=\frac{1}{jn2\pi }((e^{-j\Omega_Hn}-e^{-j\pi n}+1-e^{-j\Omega_Ln}+e^{j\Omega_Ln}-1+e^{j\pi n}-e^{j\Omega_Hn}))
\\=\frac{1}{jn2\pi }((e^{-j\Omega_Hn}-e^{-j\Omega_Ln}+e^{j\Omega_Ln}-e^{j\Omega_Hn}))
\\=\frac{1}{jn2\pi}(j2sin(\Omega_L n)-j2sin(\Omega_Hn))
\\=\frac{sin(\Omega_Ln)}{n\pi}-\frac{sin(\Omega_Hn)}{n\pi}
$$
For n=0
$$h(n)=\frac{1}{2\pi}\int_{-\pi}^{\pi}H(e^{j\Omega})d\Omega
\\=\frac{1}{2\pi}(\pi-\Omega_H+\Omega_L+\Omega_L+\pi-\Omega_H)
\\=\frac{\pi+\Omega_L-\Omega_H}{\pi}
$$
Hence,
$$ h(n)=\begin{cases}\frac{sin(\Omega_Ln)}{n\pi}-\frac{sin(\Omega_Hn)}{n\pi}\qquad n!=0\\\frac{\pi+\Omega_L-\Omega_H}{\pi}\qquad\qquad\qquad n=0\end{cases} $$

