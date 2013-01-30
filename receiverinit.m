function [ C ] = receiverinit(lat, long, alt)
%RECEIVERINIT
% Retrieves most recent YUMA almanac from
%http://www.navcen.uscg.gov/?pageName=gpsAlmanacs
% and outputs the constellation matrix C, with ECEF coordinates of satellites 
% with elevation angles over 10 degrees, with respect to initial estimate
% given by coordinates (lat, long, alt). lat and long in degrees, alt in
% meters.

DATA=getgpsdata;
tst=calcdia(DATA(1,3));

n=size(DATA,1);

A=zeros(n,4);

for s=1:n
    A(s,1)=DATA(s,1);
    [A(s,2) A(s,3) A(s,4)] = getecef(DATA(s,2),DATA(s,3),DATA(s,4),DATA(s,5),DATA(s,6),DATA(s,7), DATA(s,8),DATA(s,9),tst);
end

clear DATA;

[xu yu zu]=eceffromlatlong(lat, long, alt);
ENU=zeros(n,4);

for s=1:n
    ENU(s,1)=A(s,1);
    [ENU(s,2) ENU(s,3) ENU(s,4)] = enufromecef(xu, yu, zu, lat, long, A(s,2), A(s,3), A(s,4));
end

C=zeros(1,4);
f=1;

for s=1:n
    theta= elevationangle(ENU(s,2),ENU(s,3),ENU(s,4));
    fprintf('Satellite with ID %d has an elevation angle of %f degrees. \n', ENU(s,1), theta);
    if theta<0
        fprintf('Satellite with ID %d is below horizon line. Will be discarded. \n', ENU(s,1));
    elseif theta<10
        fprintf('Satellite with ID %d has elevation angle below 10 degrees. Will be discarded. \n', ENU(s,1));
    elseif f==1
        C(1,1)=A(s,1);
        C(1,2)=A(s,2);
        C(1,3)=A(s,3);
        C(1,4)=A(s,4);
        if s==n
            break
        else
            f=f+1;
        end
    else
        C=[C; zeros(1,4)];
        C(f,1)=A(s,1);
        C(f,2)=A(s,2);
        C(f,3)=A(s,3);
        C(f,4)=A(s,4);
        if s==n
            break
        else
            f=f+1;
        end
    end
end
fprintf('Satellites in range: \n');
for s=1:f-1
    fprintf('%d \n', C(s,1));
end


