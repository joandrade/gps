function [X, Y, Z] = enufromecef(xu, yu, zu, lat, long, x, y, z)
%ENUFROMECEF With reference to point (xu, yu, zu) (in ECEF),
%retrieves ENU coordinates of point (x, y, z) (given in ECEF).

a=6378137;
b=6356752.3142;
e=0.0818;

p=sqrt(xu^2+yu^2);
gama=atan2(a*zu,b*p);

dx=x-xu;
dy=y-yu;
dz=z-zu;

X = -sin(long)*dx + cos(long)*dy;
Y = -sin(lat)*cos(long)*dx - sin(lat)*sin(long)*dy + cos(lat)*dz;
Z = cos(lat)*cos(long)*dx + cos(lat)*sin(long)*dy + sin(lat)*dz;
end

