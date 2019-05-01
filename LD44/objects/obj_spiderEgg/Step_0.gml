/// @description XXX
if(timerHatch>0){timerHatch-=1;}
else
{
	repeat(irandom(3))
	{
		instance_create_depth(x-4+irandom(8),y-4+irandom(8),depth,obj_spiderling);
	}
	instance_destroy();
}

event_user(0);

if(life<0){instance_destroy();}