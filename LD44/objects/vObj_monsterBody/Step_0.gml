/// @description XXX
if(!initialized)
{
	life = lifeMax;
	initialized = true;
}

event_inherited();

scr_dny();

if(dyingSequence>0)
{
	if(dyingSequence==1)
	{
		voice_dieTrigger = true;
	}
	
	if(irandom(300)<dyingSequence)
	{instance_create_depth(x-16+irandom(32),y-irandom(32),depth-4+irandom(8),obj_FX);}
	
	if(dyingSequence>100 && dyingSequence mod 60 == 10 && irandom(10)<2)
	{
		if(ds_list_size(itemDrops)>0)
		{
			var itm = instance_create_depth(x-16+irandom(32),y-16+irandom(32),depth,vObj_itemPickup);
			itm.itemIndex = itemDrops[| 0]; itm.initialized = false;
	
			itm.z = 8+irandom(32);
			itm.mvDir = irandom(360);
			itm.mvSpd = 0.5+random(1);
			itm.mvUp = 1+random(2);
	
			ds_list_delete(itemDrops,0);
		}
	}
	
	if(dyingSequence<320){dyingSequence+=1;}
	else
	{
		if(obj_HUD.instructionOrder<13){obj_HUD.instructionOrder = 13;}
		while(ds_list_size(itemDrops)>0)
		{
			var itm = instance_create_depth(x-16+irandom(32),y-16+irandom(32),depth,vObj_itemPickup);
			
			itm.itemIndex = itemDrops[| 0]; itm.initialized = false;
			
			itm.z = 8+irandom(32);
			itm.mvDir = irandom(360);
			itm.mvSpd = 0.5+random(1);
			itm.mvUp = 1+random(2);
	
			ds_list_delete(itemDrops,0);
		}
		
		if(object_index == obj_body_finalboss)
		{
			instance_create_depth(0,0,0,obj_endingTimer);
		}
		scr_setBGM(victoryJingle,1);
		if(obj_player.daysLeft>=0){scr_time(1);}
		instance_destroy();
	}
	exit;
}

voiceTimer -=1;
if(voiceTimer< -(200+idleCount*100))
{
	voice_idleTrigger = true;
	idleCount +=1;
}

lifeRatio = life / lifeMax;
actSpdMulti = 1;

if(obj_player.sealStrength>0)
{
	actSpdMulti/=2;
}

if(lifeRatio<0.3)
{
	actSpdMulti*=1.5;
}

///pick attacks
if(attackChoiceTimer>0){attackChoiceTimer-=1*actSpdMulti}
else
{
	attackChoiceTimer = attackChoiceDelay;
	
	var allowedAttacks = ds_list_create();
	var allowedAttackWeight = ds_list_create();
	var attackTotalWeight = 0;
	
	for(var _i = 0; _i<ds_list_size(lAttacks); _i+=1)
	{
		var atk = ds_list_find_value(lAttacks,_i);
		var isAllowed = true;
		
		if(atk[? "beforeRep"]>atk[? "lastUsed"]){isAllowed = false;}
		if(atk[? "lifeMin"]> lifeRatio*100){isAllowed = false;}
		if(atk[? "lifeMax"]< lifeRatio*100){isAllowed = false;}
		if(atk[? "isActive"]){isAllowed = false;}
		var objUse = atk[? "objectUsing"];
		
		if(!instance_exists(objUse)){isAllowed = false;}
		else{if(atk[? "objectUsing"].limbInUse){isAllowed = false;}}
		
		if(isAllowed)
		{
			attackTotalWeight += atk[? "attackChance"];
			ds_list_add(allowedAttacks,atk);
			ds_list_add(allowedAttackWeight,attackTotalWeight);
		}
		atk[? "lastUsed"] +=1;
	}
	
	if(ds_list_size(allowedAttacks)>0)
	{
		var randNumber = irandom(attackTotalWeight);
		ds_list_add(allowedAttackWeight,randNumber);
		ds_list_sort(allowedAttackWeight,true);
		var atkInd = ds_list_find_index(allowedAttackWeight,randNumber);
		var selectedAttack = ds_list_find_value(allowedAttacks,atkInd);
		ds_list_add(lActiveAttacks,selectedAttack);
	
		attackChoiceTimer += selectedAttack[? "delayAfter"];
		selectedAttack[?"isActive"] = true;
		selectedAttack[? "lastUsed"] = 0;
	}
	
	ds_list_destroy(allowedAttacks);
	ds_list_destroy(allowedAttackWeight);
}


for(var _i=0; _i<ds_list_size(lActiveAttacks); _i+=1)
{
	var atk = ds_list_find_value(lActiveAttacks,_i);
	
	with(atk[? "objectUsing"])
	{
		attackIsDone = false;
		actionUsing = atk[? "atkName"];
		event_user(atk[? "userEvent"]);
		
		if(attackIsDone)
		{
			atk[?"isActive"] = false;
			limbInUse = false;
			ds_list_delete(other.lActiveAttacks,_i);
			_i-=1;
			actionUsing = "";
		}
		else{limbInUse = true;}
		
	}
	
}

///running the step logic of parts
var foundWeakPoint = false;

for(var _i=0; _i<bodyPartCount; _i+=1)
{
	if(instance_exists(bodyPart[_i]))
	{
		var bp = bodyPart[_i];
		var bpType = bodyPartType[_i];
		
		if(shakeAmnt/3>bp.shakeAmnt){bp.shakeAmnt = shakeAmnt/3;}
		
		if(bp.isMonster && bp.damageToBodyRatio>0.2){foundWeakPoint = true;}
		if(bpType == eBodyParts.bp_legs)
		{
			if(obj_player.sealStrength<=0){with(bp){event_user(2);}}
			x = bp.x - bp.anchorX;
			y = bp.y - bp.partHeight - bp.anchorY;
			z = bp.z;
			feetX = bp.x;
			feetY = bp.y;
		}
		else
		{
			with(bp){event_user(2);}
			bp.x = x + bp.anchorX;
			bp.y = y + bp.anchorY;
			bp.z = z;
			bp.feetX = feetX;
			bp.feetY = feetY;
		}
		bp.depth = depth+bp.anchorDepth;
	}
}

if(!foundWeakPoint){isMonster = true;}

if(sealDamageTimer>0){sealDamageTimer-=1;}
else
{
	if(lifeRatio<0.5){sealDamageTimer = sealDamageDelay*0.6;}
	else{sealDamageTimer = sealDamageDelay;}
	obj_player.sealDmg += 1;
}

if(emote != "")
{
	if(emoteTimer>0){emoteTimer-=1;}else{emote = "";}
}