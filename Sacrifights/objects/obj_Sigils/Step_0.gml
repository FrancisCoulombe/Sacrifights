/// @description XXX

if(state != lastState)
{
	lastState = state;
	animFrm = 0;
}

if(state== "active")
{
	if(instance_exists(vObj_monsterBody))
	{
		timerFade +=1;
		if(timerFade>240){state= "missed";}
	}
}