function [X Y Z] = getecef(e,toe,a,op,sqrtA,o0,w,M0,tst)
%GETECEF ECEF coordinates from orbital parameters

u = 3.986005E14;
oe = 7.2921151467E-5;

A = sqrtA^2;
dt = tst - toe;
n = sqrt(u/(A.^3));
M = M0 + n*dt;

E = CalcEA(M,e);
v = atan((sqrt(1-e^2)*sin(E))/(cos(E)-e));

t = v + w;
o = o0 + op*dt - oe*tst;
R = A*(1 - e*cos(E));

X = R*(cos(t)*cos(o) - sin(t)*sin(o)*cos(a));
Y = R*(cos(t)*sin(o) - sin(t)*cos(o)*cos(a));
Z = R*(sin(t)*sin(a));