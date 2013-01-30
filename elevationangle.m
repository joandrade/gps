function [theta] = elevationangle(X, Y, Z)
%ELEVATIONANGLE Elevation angle from ENU coordinates
%For the point with coordinates (X, Y, Z) (in ENU),
%retrieves elevation angle value theta in degrees.
    theta=atan(Z/sqrt(X^2+Y^2))*180/pi;
end

