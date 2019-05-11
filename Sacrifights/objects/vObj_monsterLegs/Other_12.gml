/// @description LegsMovementcode
x += lengthdir_x(moveSpd,dir);
y += lengthdir_y(moveSpd,dir);

if(moveSpd>moveFric){moveSpd-=moveFric;}
else{moveSpd = 0;}

x = median(8,room_width-8,x);
y = median(16,room_height-8,y);