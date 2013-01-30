function [DATA] = getgpsdata
%GETGPSDATA Summary of this function goes here
%   Detailed explanation goes here
YUMA=urlread('http://www.navcen.uscg.gov/?pageName=currentAlmanac&format=yuma-txt');
YUMAcell=textscan(YUMA,'%s');
DATA = zeros(31,9);

for id=1:31
    DATA(id,1)=str2double(cell2mat(YUMAcell{1,1}(9+47*(id-1),1)));
    DATA(id,2)=str2double(cell2mat(YUMAcell{1,1}(13+47*(id-1),1)));
    DATA(id,3)=str2double(cell2mat(YUMAcell{1,1}(17+47*(id-1),1)));
    DATA(id,4)=str2double(cell2mat(YUMAcell{1,1}(20+47*(id-1),1)));
    DATA(id,5)=str2double(cell2mat(YUMAcell{1,1}(25+47*(id-1),1)));
    DATA(id,6)=str2double(cell2mat(YUMAcell{1,1}(29+47*(id-1),1)));
    DATA(id,7)=str2double(cell2mat(YUMAcell{1,1}(34+47*(id-1),1)));
    DATA(id,8)=str2double(cell2mat(YUMAcell{1,1}(38+47*(id-1),1)));
    DATA(id,9)=str2double(cell2mat(YUMAcell{1,1}(41+47*(id-1),1)));
end
end

