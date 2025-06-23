pi=3.1415926;
c0 =3E8; 
mu0 = 4.0 * pi * 1.0E-7;  
eps0 = 8.85419e-12;

dz = 75e-6;%The spatial step
dt = 1.25e-13; %The time step

dealta_Ne = 0.3; %the electron density variation ratio

me = 9.11e-31; 
e = 1.6e-19;
vc = 20e9;
wb1 = 100e9;

X_f=[];
%反射系数解析解  

  dne=0.3;
Neavg=3e18;
  nn=0;
a=0;
  for f=0:0.1e9:100e9%入射电磁波频率

    nn=nn+1;
    a = a +1;    
    d      = 1.5e-2;%0.015;               %等离子体厚度 解析解

    
    w=2*pi*f;%电磁波角频率
    ne=Neavg*(1);%等离子体电子密度+
    
    wp=sqrt(ne*e^2/me/eps0);%等离子体频率
  
    
    
%     epsz=1-wp^2/(w^2+vc^2)-j*(vc/w)*(wp^2/(w^2+vc^2));%等离子体等效介电
    epsz_R = (1-(wp/w).^2*(1-j*vc/w+wb1/w)./((1-j*vc/w).^2-(wb1/w).^2));
  
    
    n = sqrt(epsz_R);
    r = (1-n) / (1+n);
    v = exp(-j*(w*d*n)/c0);
    R1(a) = r - r*(1-r^2)*v^2/(1-r^2*v^2);

    epsz_L = (1-(wp/w).^2*(1-j*vc/w-wb1/w)./((1-j*vc/w).^2-(wb1/w).^2));
  
    
    n = sqrt(epsz_L);
    r = (1-n) / (1+n);
    v = exp(-j*(w*d*n)/c0);
    R2(a) = r - r*(1-r^2)*v^2/(1-r^2*v^2);
    
 
    X=20*log10(abs(R1));%取幅度
   X1=20*log10(abs(R2));%取幅度
    
  end 
  figure(1)
  plot(0:0.1e9:100e9,X)
    figure(2)
  plot(0:0.1e9:100e9,X1)

