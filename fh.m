function value = fh(x,ko)

switch ko
    case 1,    value =  Hen(2,x)/6;
    case 2,    value =  Hen(3,x)/24;
    case 11,   value = -(2*Hen(3,x)+Hen(1,x))/36;
    case 3,    value =  Hen(4,x)/120;
    case 12,   value = -(Hen(4,x)+Hen(2,x))/24;
    case 111,  value =  (12*Hen(4,x)+19*Hen(2,x))/324;
    case 4,    value =  Hen(5,x)/720;
    case 22,   value = -(3*Hen(5,x)+6*Hen(3,x)+2*Hen(1,x))/384;
    case 13,   value = -(2*Hen(5,x)+3*Hen(3,x))/180;
    case 112,  value =  (14*Hen(5,x)+37*Hen(3,x)+8*Hen(1,x))/288;
    case 1111, value =  (252*Hen(5,x)+832*Hen(3,x)+227*Hen(1,x))/7776;
end,
