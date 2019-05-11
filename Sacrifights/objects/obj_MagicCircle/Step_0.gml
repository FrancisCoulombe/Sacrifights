/// @description XXX
/*
state = "";
lastState = "";
*/
///normal ///active //broken ///glow

if(obj_player.sealStrength>0)
{
	if(glowing){state = "glow";}
	else
	{
		if(instance_exists(obj_monsterPart)){state = "active";}
		else{state = "normal";}
	}
}
else
{
	if(instance_exists(vObj_monsterBody) || obj_OfferingCandles.offeringObject=="")
	{
		with(obj_Sigils){state = "missed";}
		state = "broken";
	}
}

if(state == "active" && !instance_exists(obj_Sigils))
{
	if(timerSigil>0){timerSigil-=1;}
	else
	{
		timerSigil = 240+irandom(64);
		var sigil = instance_create_depth(x,y,depth,obj_Sigils);
		switch(irandom(6))
		{
			case 0: sigil.x = 32; sigil.y = 64; break;
			case 1: sigil.x = 48; sigil.y = 128; break;
			case 2: sigil.x = 96; sigil.y = 176; break;
			case 3: sigil.x = 160; sigil.y = 192; break;
			case 4: sigil.x = 224; sigil.y = 176; break;
			case 5: sigil.x = 272; sigil.y = 128; break;
			case 6: sigil.x = 288; sigil.y = 64; break;
		}
	}
}

if(state != lastState)
{
	if(state == "broken")
	{
		with(vObj_monsterBody)
		{
			voice_angryTrigger = true;
		}
	}
	lastState = state;
	animFrm = 0;
}