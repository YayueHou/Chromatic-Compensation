clear;clc;close all;
global settings;
beta2=-settings.FiberChromaticDispersion*(settings.Lam^2)/(2*pi*settings.Light)*10^(-21);
H=exp(1i/2*beta2.*settings.w.^2*settings.FiberLength);

figure;
plot(H);
