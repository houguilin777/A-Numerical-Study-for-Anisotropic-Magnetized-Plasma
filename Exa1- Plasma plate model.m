load ff.mat
load fre.mat
load Solve.mat

figure(2)
f=0e10:2e8:10e10;
plot(f/(1e9),X1_f,'-g','linewidth',1.1);
hold on

load SFDTD22.mat
plot(freqi/(1e9),S11_2_RR,'-b','linewidth',1.1);
Error_ME_22 =  20*log((abs(S11_2_RR-X1_f))/max(abs(X1_f)));
load SFDTD24.mat
plot(freqi/(1e9),S11_2_RR,'--k','linewidth',1.1);
Error_ME_24 =  20*log((abs(S11_2_RR-X1_f))/max(abs(X1_f)));
load SFDTD44.mat
plot(freqi/(1e9),S11_2_RR,'-.r','linewidth',1.1);
Error_ME_44 =  20*log((abs(S11_2_RR-X1_f))/max(abs(X1_f)));

load ADE44.mat
plot(freqi(1:1:end)/(1e9),S11_2_RR(1:1:end),'--m','linewidth',1.1);
Error_ADE_44 =  20*log((abs(S11_2_RR-X1_f))/max(abs(X1_f)));
figure(3)
plot(freqi/(1e9),Error_ME_22,'-r');

hold on
plot(freqi/(1e9),Error_ME_24-15,'-g');
plot(freqi/(1e9),Error_ME_44,'-b');

plot(freqi/(1e9),Error_ME_44,'-b');
plot(freqi/(1e9),Error_ADE_44,'-M');

%%
figure(4)
f=0e10:2e8:10e10;
plot(f/(1e9),X2_f,'-g','linewidth',1.1);
hold on

load SFDTD22.mat
plot(freqi/(1e9),S11_2_LR_2,'-b','linewidth',1.1);
Error_ME_22_L =  20*log((abs(S11_2_LR_2-X2_f))/max(abs(X1_f)));
load SFDTD24.mat
plot(freqi/(1e9),S11_2_LR_2,'--k','linewidth',1.1);
Error_ME_24_L =  20*log((abs(S11_2_LR_2-X2_f))/max(abs(X1_f)));
load SFDTD44.mat
plot(freqi/(1e9),S11_2_LR_2,'-.r','linewidth',1.1);
Error_ME_44_L =  20*log((abs(S11_2_LR_2-X2_f))/max(abs(X1_f)));

load ADE44.mat
plot(freqi(1:1:end)/(1e9),S11_2_LR_2(1:1:end),'--m','linewidth',1.1);
Error_ADE_44_L =  20*log((abs(S11_2_LR_2-X2_f))/max(abs(X1_f)));
figure(5)
plot(freqi/(1e9),Error_ME_22_L,'-r');
hold on
plot(freqi/(1e9),Error_ME_24_L,'-g');
plot(freqi/(1e9),Error_ME_44_L,'-b');
plot(freqi/(1e9),Error_ADE_44_L,'-M');
% axis([0 100 -300 -30])







