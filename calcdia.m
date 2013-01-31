function tst = calcdia
format long
c=clock;
horas=c(1,4);
minutos=c(1,5);
segundos=c(1,6);

switch c(1,2)
    case 1
        month='Jan';
    case 2
        month='Feb';
    case 3
        month='Mar';
    case 4
        month='Apr';
    case 5
        month='May';
    case 6
        month='Jun';
    case 7
        month='Jul';
    case 8
        month='Aug';
    case 9
        month='Sep';
    case 10
        month='Oct';
    case 11
        month='Nov';
    case 12
        month='Dec';
end

data=strcat(num2str(c(1,3)),'-',month,'-',num2str(c(1,1)));
[dia_semana,~]=weekday(data);


tst=(dia_semana-1)*86400 + horas*3600 + minutos*60 + segundos;
end