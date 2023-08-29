function elec = ElecPulseShaping(pat,duty,roll)
%本程序实现电脉冲成形
%%
global settings;
%% 
Nfft = settings.Nt*settings.NumOfSymbol;                % 点数
elec = zeros(Nfft,1);
elpulse = pulseshape(roll,duty,settings.Nt);  % single pulse
nstart = Nfft-settings.Nt+1;      % The first elpulse starts at the end of the sequence (cyclic periodicity).
nend = Nfft;
elec(nstart:nend) = pat(1)*elpulse(1:settings.Nt);
elec(1:settings.Nt) = pat(1)*elpulse(settings.Nt+1:settings.Nt*2);
for kbit=2:settings.NumOfSymbol        % all other bits: 2 -> Nsymb
    nstart = (kbit-2)*settings.Nt+1;
    nend = kbit*settings.Nt;
    elec(nstart:nend) = elec(nstart:nend)+pat(kbit)*elpulse; % add the kbit-pulse
end

function y=pulseshape(roll,duty,Nt)
        elpulse = zeros(Nt*2,1);     % elementary pulse (over two bit times  because the roll-off spreads the pulse).
        nl = round(0.5*(1-roll)*duty*Nt);    % start index of cos roll-off
        nr = duty*Nt-nl-1;                   % end index of cos roll-off
        nmark = 1:nl;                       % indexis where the pulse is 1
        ncos  = nl:nr;                      % transition region of cos roll-off
        elpulse(Nt+nmark) = 1;
        hperiod = duty*Nt-2*nl;
        if hperiod ~= 0
            elpulse(ncos+Nt+1) = 0.5*(1+cos(pi/(hperiod)*(ncos-nl+0.5)));
        end
        elpulse(1:Nt) = flipud(elpulse(Nt+1:Nt*2)); % first half of the pulse
y=elpulse;