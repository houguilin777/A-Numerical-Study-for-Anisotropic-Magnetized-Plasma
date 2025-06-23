syms  t1 t2 t3 t4 t5 t6 t7 t8 t9  ;

ii = sqrt(-1);

t = dt;
wbx = 0;
wby = 0;
wbz = wb1;
A = cell(1,5);
B = cell(1,5);
F = cell(1,5);
B{1,2} = zeros(3,3);
B{1,3} = zeros(3,3);
B{1,4} = zeros(3,3);
B{1,5} = zeros(3,3);
F{1,2} = zeros(3,3);
F{1,3} = zeros(3,3);
F{1,4} = zeros(3,3);
F{1,5} = zeros(3,3);

%欧拉公式化简
% exp(-cl*dt*(v - wb*1i)) =  exp(-cl*dt*v)*(cos(cl*dt*wb) + 1i*sin(cl*dt*wb));
% exp(-cl*dt*(v + wb*1i)) =  exp(-cl*dt*v)*(cos(cl*dt*wb) - 1i*sin(cl*dt*wb));
C=[1];
% D=[0.62337932451322,-0.12337932451322,-0.12337932451322,0.62337932451322,0];
for m = 1:1
d= C(m);
x1 = - d * vc1;
x2 = - d * vc1 - d*wbz*ii;
x3 = - d * vc1 + d*wbz*ii;
%第一种初值条件
eqns=[t1+t2+t3==1,x1*t1+x2*t2+x3*t3==0,x1^2*t1+x2^2*t2+x3^2*t3==0];
vars=[t1,t2,t3];
[sola1,sola2,sola3]=solve(eqns,vars);
s1 = sola1*exp(x1*t) + sola2*exp(x2*t) + sola3*exp(x3*t);
%第二种初值条件
eqns=[t4+t5+t6==0,x1*t4+x2*t5+x3*t6==1,x1^2*t4+x2^2*t5+x3^2*t6==0];
vars=[t4,t5,t6];
[sola4,sola5,sola6]=solve(eqns,vars);
s2 = sola4*exp(x1*t) + sola5*exp(x2*t) + sola6*exp(x3*t);
%第三种初值条件
eqns=[t7+t8+t9==0,x1*t7+x2*t8+x3*t9==0,x1^2*t7+x2^2*t8+x3^2*t9==1];
vars=[t7,t8,t9];
[sola7,sola8,sola9]=solve(eqns,vars);
s3 = sola7*exp(x1*t) + sola8*exp(x2*t) + sola9*exp(x3*t);
%指数矩阵表达式
A{1,m} = [-vc1*d,-wbz*d,wby*d;wbz*d,-vc1*d,-wbx*d;-wby*d,wbx*d,-vc1*d];
O = [-vc1,-wbz,wby;wbz,-vc1,-wbx;-wby,wbx,-vc1];
Oni = inv(O);
E = eye(3);
% sin1=-ii*(exp(vv + wb*1i)-exp(vv - wb*ii))/2;
% cos1=(exp(vv + wb*ii)+exp(vv - wb*ii))/2;
B{1,m} = s1*E + s2*A{1,m} + s3*A{1,m}*A{1,m};
B{1,m} = simplify(B{1,m});
F{1,m} = Oni*(B{1,m}-E);
F{1,m} = simplify(F{1,m});

B1 = B{1,1};
D1 = F{1,1};
B2 = B{1,2};
D2 = F{1,2};
B3 = B{1,3};
D3 = F{1,3};
B4 = B{1,4};
D4 = F{1,4};
B5 = B{1,5};
D5 = F{1,5};

%矩阵1
a111 = double(B1(1,1));
a121 = double(B1(1,2));
a211 = double(B1(2,1));
a221 = double(B1(2,2));
d111 = double(D1(1,1));
d121 = double(D1(1,2));
d211 = double(D1(2,1));
d221 = double(D1(2,2));
%矩阵2
a112 = double(B2(1,1));
a122 = double(B2(1,2));
a212 = double(B2(2,1));
a222 = double(B2(2,2));
d112 = double(D2(1,1));
d122 = double(D2(1,2));
d212 = double(D2(2,1));
d222 = double(D2(2,2));
%矩阵3
a113 = double(B3(1,1));
a123 = double(B3(1,2));
a213 = double(B3(2,1));
a223 = double(B3(2,2));
d113 = double(D3(1,1));
d123 = double(D3(1,2));
d213 = double(D3(2,1));
d223 = double(D3(2,2));
%矩阵4
a114 = double(B4(1,1));
a124 = double(B4(1,2));
a214 = double(B4(2,1));
a224 = double(B4(2,2));
d114 = double(D4(1,1));
d124 = double(D4(1,2));
d214 = double(D4(2,1));
d224 = double(D4(2,2));
%矩阵5
a115 = double(B5(1,1));
a125 = double(B5(1,2));
a215 = double(B5(2,1));
a225 = double(B5(2,2));
d115 = double(D5(1,1));
d125 = double(D5(1,2));
d215 = double(D5(2,1));
d225 = double(D5(2,2));
end
a11=[a111 a112 a113 a114 a115];
a12=[a121 a122 a123 a124 a125];
a21=[a211 a212 a213 a214 a215];
a22=[a221 a222 a223 a224 a225];
d11=[d111 d112 d113 d114 d115];
d12=[d121 d122 d123 d124 d125];
d21=[d211 d212 d213 d214 d215];
d22=[d221 d222 d223 d224 d225];