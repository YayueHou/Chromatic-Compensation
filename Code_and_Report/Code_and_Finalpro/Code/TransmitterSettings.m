function TransmitterSettings
%本函数定义通信链路发送端的参数

global settings
%% 发送端参数
settings.Light=299792458;	                           %光速[m/s]
settings.Lam      = 1550;                              % 中心波长 [nm]
settings.SymbolRate=25e9;                              %波特率 [Bd/s]
settings.SymbolPeriod=1/settings.SymbolRate;           %符号周期 [s]
settings.NumOfBit=2^12;                                %每路偏振信号的比特数，两路偏振信号的总比特数
settings.b=2;
settings.M=2^settings.b;                               %调制格式为QPSK
settings.NumOfSymbol=settings.NumOfBit/settings.b;     %每路偏振信号的符号数 
settings.Nt=64;                                        % 每一个符号的点数
settings.Exratio  = inf;                               % 本征比 [dB]
settings.Duty=1;                                       % 升余弦脉冲的占空比
settings.Roll=0.2;                                     % 升余弦脉冲的滚降系数                     
%% 信道参数
settings.FiberLength=80;           %光纤长度[km]
settings.EDFASpac=80;                %EDFA放置间隔[km]
settings.FiberAttenuation=0.2;       % 光纤衰减 [dB]
settings.FiberChromaticDispersion=16;%光纤色度色散[ps/(nm.km)]
settings.w = 2*pi/settings.SymbolPeriod*transpose(linspace(-settings.Nt/2,settings.Nt/2,settings.Nt*settings.NumOfSymbol)); %角频率
end 
