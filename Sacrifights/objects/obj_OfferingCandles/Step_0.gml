/// @description XXX
if(instance_exists(vObj_menus)){exit;}

if(offeringObject != lastObj)
{
	lastObj = offeringObject;
	if(offeringObject=="")
	{
		offeringIcon = noone;
		offeringIconFrm = 0;
	}
	else
	{
		if(timerAccept==120){scr_playSFX(1,0,snd_itemOffering);}
		offeringIcon = scr_itemDB(offeringObject,eIData.icon);
		offeringIconFrm = scr_itemDB(offeringObject,eIData.iconFrm);
		candlesFrame = 0;
	}
}

if(offeringObject != "")
{
	obj_player.canLeave = false;
	if(candlesFrame==0)
	{
		var sigil = instance_create_depth(x,y,depth,obj_Sigils);
		sigil.x = 32; sigil.y = 64;
		
		//sigil = instance_create_depth(x,y,depth,obj_Sigils);
		//sigil.x = 48; sigil.y = 128;
		
		sigil = instance_create_depth(x,y,depth,obj_Sigils);
		sigil.x = 96; sigil.y = 176;
	
		//sigil = instance_create_depth(x,y,depth,obj_Sigils);
		//sigil.x = 160; sigil.y = 192;
	
		sigil = instance_create_depth(x,y,depth,obj_Sigils);
		sigil.x = 224; sigil.y = 176;
	
		//sigil = instance_create_depth(x,y,depth,obj_Sigils);
		//sigil.x = 272; sigil.y = 128;
		
		sigil = instance_create_depth(x,y,depth,obj_Sigils);
		sigil.x = 288; sigil.y = 64;
	}
	
	candlesFrame+=0.1;
	if(candlesFrame>=12){candlesFrame -=2;}
	
	
	if(candlesFrame>=10 && obj_player.sealStrength>=obj_player.sealMax)
	{
		sineMove +=0.05;
		sinePos = sin(sineMove);
		timerAccept+=1;
		
		if(timerAccept==120){scr_playSFX(1,0,snd_summon1);}
		if(timerAccept>60)
		{
			if(timerAccept mod 30 == 3){instance_create_depth(x+irandom(16),y+irandom(16)-8+sinePos*6,depth-2+irandom(4),obj_FX);}
		}
		if(timerAccept>120)
		{
			if(timerAccept mod 20 == 7){instance_create_depth(x+irandom(16),y+irandom(16)-8+sinePos*6,depth-2+irandom(4),obj_FX);}
		}
		if(timerAccept>180)
		{
			if(timerAccept mod 10 == 2){instance_create_depth(x+irandom(16),y+irandom(16)-8+sinePos*6,depth-2+irandom(4),obj_FX);}
		}
		
		if(timerAccept==240)
		{
			repeat(8)
			{
				instance_create_depth(x+irandom(16),y+irandom(16)-8+sinePos*6,depth-2+irandom(4),obj_FX);
			}
			timerAccept = 0;
			scr_itemDB(offeringObject,eIData.spawnDemon);
			offeringObject = "";
			candlesFrame = 0;
		}
	}
	else{sineMove = 0;}
}