/// @description XXX
if(shakeAmnt>0)
{
	if(shakeAmnt>0.1){shakeAmnt-=0.1;}else{shakeAmnt = 0;}
	if(shakeAmnt>2){shakeAmnt-=0.1;}
	if(shakeAmnt>5){shakeAmnt-=0.2;}
	if(shakeAmnt>10){shakeAmnt-=0.25;}
	if(shakeAmnt>20){shakeAmnt-=0.5;}

	shakeX = 0-shakeAmnt+irandom(shakeAmnt*2);
	shakeY = 0-shakeAmnt+irandom(shakeAmnt*2);
}
else
{
	shakeX = 0;
	shakeY = 0;
}