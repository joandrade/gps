function [X Y Z] = eceffromlatlong(lat, long, alt)
%ECEFFROMLATLONG ECEF coordinates from lat, long, alt (WGS-84)
%Retrieves coordinates in ECEF (meters) for input of latitude and
%longitude, in degrees, and altitude, in meters. (WGS-84 ellipsoid)

rad=pi/180;
a=6378137;
e=0.0818;

N=a/(1-(e*sin(lat*rad))^2);

X=(N+alt)*cos(lat*rad)*cos(long*rad);
Y=(N+alt)*cos(lat*rad)*sin(long*rad);
Z=(N*(1-e^2)+alt)*sin(lat*rad);

end

