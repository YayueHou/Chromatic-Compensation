function TransmitterSettings
%����������ͨ����·���Ͷ˵Ĳ���

global settings
%% ���Ͷ˲���
settings.Light=299792458;	                           %����[m/s]
settings.Lam      = 1550;                              % ���Ĳ��� [nm]
settings.SymbolRate=25e9;                              %������ [Bd/s]
settings.SymbolPeriod=1/settings.SymbolRate;           %�������� [s]
settings.NumOfBit=2^12;                                %ÿ·ƫ���źŵı���������·ƫ���źŵ��ܱ�����
settings.b=2;
settings.M=2^settings.b;                               %���Ƹ�ʽΪQPSK
settings.NumOfSymbol=settings.NumOfBit/settings.b;     %ÿ·ƫ���źŵķ����� 
settings.Nt=64;                                        % ÿһ�����ŵĵ���
settings.Exratio  = inf;                               % ������ [dB]
settings.Duty=1;                                       % �����������ռ�ձ�
settings.Roll=0.2;                                     % ����������Ĺ���ϵ��                     
%% �ŵ�����
settings.FiberLength=80;           %���˳���[km]
settings.EDFASpac=80;                %EDFA���ü��[km]
settings.FiberAttenuation=0.2;       % ����˥�� [dB]
settings.FiberChromaticDispersion=16;%����ɫ��ɫɢ[ps/(nm.km)]
settings.w = 2*pi/settings.SymbolPeriod*transpose(linspace(-settings.Nt/2,settings.Nt/2,settings.Nt*settings.NumOfSymbol)); %��Ƶ��
end 
