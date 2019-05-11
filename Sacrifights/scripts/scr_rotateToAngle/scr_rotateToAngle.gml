///@function scr_rotateToAngle
///@param angleFrom
///@param angleTo
///@param turnAmount
var dir = argument0;
var dirTo = argument1;
var amount = argument2;

var diff = dir-dirTo;

if(diff>amount)
{
    if(diff>180){dir+=amount;}
    else{dir-=amount;}
}
else if(diff<0-amount)
{
    if(diff<-180){dir-=amount;}
    else{dir+=amount;}
}
else
{
    dir = dirTo;
}

return (dir+360) mod 360;