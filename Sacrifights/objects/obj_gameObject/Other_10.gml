/// @description Damage check

if(tempInvincible>0){tempInvincible-=1;}
else
{
	var gotHit = false;
	if(isPlayer || isMonster)
	{
		with(obj_gameObject)
		{
			if(dmg>0 && (hitsPlayer && other.isPlayer) || (hitsMonster && other.isMonster))
			{
				if(object_index != other.object_index)
				{
					var allowedHit = true;
					if(hitsPlayer && other.isPlayer && z>24){allowedHit = false;}
					
					if(allowedHit)
					{
						if(place_meeting(x,y,other.id))
						{
							other.dmgReceived += dmg;
							hitSomething = true;
							gotHit = true;
						}
					}
				}
			}
		}
	}

	if(dmgReceived>0)
	{
		
		if(isPlayer)
		{
			tempInvincible = 60; dmgFlash = 20;
			dmgReceived = max(1,dmgReceived-coreStat_defense);
			scr_playSFX(0.9,0.2,snd_playerHit);
		}
		
		var lifeRatioBefore = parentBody.life / max(1,parentBody.lifeMax);
		
		shakeAmnt += dmgReceived;
		life-=dmgReceived;
		dmgFlash = 10;
		
		var lifeRatioAfter = parentBody.life / max(1,parentBody.lifeMax);
		
		if(isMonster)
		{
			scr_playSFX(0.8,0.4,snd_enemyHit);
			if(lifeRatioBefore>=0.8&&lifeRatioAfter<0.8){parentBody.voice_painTrigger = true;}
			if(lifeRatioBefore>=0.5&&lifeRatioAfter<0.5){parentBody.voice_painTrigger = true;}
			if(lifeRatioBefore>=0.3&&lifeRatioAfter<0.3){parentBody.voice_painTrigger = true;}
		}
		
		if(isMonster && parentBody != id)
		{
			parentBody.dmgReceived += dmgReceived*damageToBodyRatio;
			parentBody.emote = "pain"; parentBody.emoteTimer = 20;
		}
	}
	else
	{
		if(isMonster && gotHit)
		{
			scr_playSFX(0.8,0.4,snd_enemyHit_noEffect);
		}
	}
}

if(dmgFlash>0)
{
	dmgFlash-=1;
}

dmgReceived = 0;