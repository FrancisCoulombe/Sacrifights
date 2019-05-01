/// @description XXX
y-=moveUp;

if(fadeDelay>0){fadeDelay-=1;}
else
{
	alpha-=fadeSpd;
	if(alpha==0){instance_destroy();}
}