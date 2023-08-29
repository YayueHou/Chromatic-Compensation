## 傅里叶展开
部分函数可以展开为正弦和余弦函数的和
### 一、展开成傅里叶级数的条件
* 迪利克雷条件
   1. 连续或只有有限个第一类间断点
   2. 只有有限个极值点
* 满足迪利克雷条件的周期实值函数可以进行傅里叶展开
###  二、傅里叶级数
$$ f(t)=\frac{a_0}{2} + \displaystyle \sum_{n=1}^{n \to \infty}(a_n cosn{\omega}_0t+b_0sinn{\omega}_0t) $$

其中
$$ \omega_0=\frac{2\pi}{T} $$
$$ a_n=\frac{2}{T}  \int^{T/2}_{-T/2} f(t)cosn\omega_0tdt \qquad (n=0,1,...)$$
$$ b_n=\frac{2}{T} \int^{T/2}_{-T/2} f(t)sinn\omega_0tdt \qquad (n=0,1,...)$$



