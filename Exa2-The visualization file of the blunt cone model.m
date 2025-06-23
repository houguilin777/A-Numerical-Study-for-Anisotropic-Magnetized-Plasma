clc;
clear;
close all;

load('T_3')
load('FDTD1')
figure(1)
plot(0.04*(1:1:85),T_3(1:1:85,1),'-g', 'LineWidth', 1)
hold on
plot(0.04*(1:1:85),T_3(1:1:85,2),'-b', 'LineWidth', 1)
hold on
plot(0.04*(1:1:85),T_3(1:1:85,3),'--k', 'LineWidth', 1)
hold on
plot(0.04*(1:2:85),MEFDTD(1:2:85,1),'-.','Color', [1, 0.647, 0], 'LineWidth', 1)
hold on
plot(0.04*(1:1:85),T_3(1:1:85,4),'--r', 'LineWidth', 1)


axis([0.2 3.4 -45 -10 ])
xticks([0.2 1.0 1.8 2.6 3.4]);
% axis([2.7 3.4 -22 -20.5 ])
legend({'DG-FDTD(2,2)','CG-FDTD(2,2)','CG-FDTD(2,4)','STS-CG-FDTD(2,2)','CG-ME-SFDTD(4,4)'},'Location', 'best');
xlabel('Frequency(GHz)')
ylabel('MRCS(dBsm)')
title('The MRCS results model of 3D blunt cone')


E_F_22 = T_3(:,2)-T_3(:,1);
E_F_24 = T_3(:,3)-T_3(:,1);
E_F_44 = T_3(:,4)-T_3(:,1);
E_F_225 = MEFDTD(:,1)-T_3(:,1);

figure(23)
plot(0.04*(1:1:85),20*log(abs(E_F_22(1:1:85))/max(abs(T_3(:,1)))),'-b')
hold on
plot(0.04*(1:1:85),20*log(abs(E_F_24(1:1:85))/max(abs(T_3(:,1)))),'--k')
hold on
plot(0.04*(1:1:85),20*log(abs(E_F_44(1:1:85))/max(abs(T_3(:,1)))),'-r')
hold on
plot(0.04*(1:2:85),20*log(abs(E_F_225(1:2:85))/max(abs(T_3(:,1)))),'-.m')
axis([0.2 3.4 -220 -80])
legend('FDTD-Coarse-22','FDTD-Coarse-24','SFDTD-Coarse-44')
xlabel('GHz')
ylabel('Relative Error')






