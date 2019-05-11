///@function scr_itemDB
///@param itmName
///@param data

var itmName = argument0;
var data = argument1;
var retval = noone;
var body = noone;

var debugMonster = false;
var specialShot = noone;


switch(itmName)
{
	#region Blood Bucket
	case "bloodBucket":
		switch(data)
		{
			case eIData.longName: retval = "Bucket of your blood"; break;
			case eIData.displayName: retval = "Blood Bucket"; break;
			case eIData.icon: retval = spr_bucketBlood; break;
			case eIData.iconFrm: retval = 0; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_introboss);
				with(body)
				{
					monsterName = "Ancient One";
					colorBlend = c_black;
					victoryJingle = msk_victory_long;
					lifeMax = 500;
					sealDamageDelay = 4;
					//scr_addMonsterPart(obj_head_finalboss_left,eBodyParts.bp_head,-12,-46,-3);
					
					//scr_addMonsterPart(obj_head_finalboss_center,eBodyParts.bp_head,6,-50,-2);
					
					//scr_addMonsterPart(obj_head_finalboss_right,eBodyParts.bp_head,10,-35,-3);
					
					var pt = scr_addMonsterPart(obj_arm_finalboss,eBodyParts.bp_leftArm,-22,-22,1);
					pt.colorBlend = c_black; 
					pt = scr_addMonsterPart(obj_arm_finalboss,eBodyParts.bp_rightArm,23,-24,1);
					pt.colorBlend = c_black; 
					pt = scr_addMonsterPart(obj_legs_finalboss,eBodyParts.bp_legs,0,0,1);
					pt.colorBlend = c_black; 
				}
				break;
		}
		break;
	#endregion
	
	#region ownheart
	case "ownHeart":
		switch(data)
		{
			case eIData.displayName: retval = "Your Heart"; break;
			case eIData.longName: retval = "Your Own Still-Beating Heart"; break;
			case eIData.icon: retval = spr_beatingHeart; break;
			case eIData.iconFrm: retval = -1; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_finalboss);
				obj_player.finalBossStart = true;
				with(body)
				{
					monsterName = "Ancient One";
					victoryJingle = msk_victory_long;
					lifeMax = 600;
					sealDamageDelay = 4;
					BGMpitch = 0.7;
					scr_addMonsterPart(obj_head_finalboss_left,eBodyParts.bp_head,-12,-46,-3);
					
					scr_addMonsterPart(obj_head_finalboss_center,eBodyParts.bp_head,6,-50,-2);
					
					scr_addMonsterPart(obj_head_finalboss_right,eBodyParts.bp_head,10,-35,-3);
					
					scr_addMonsterPart(obj_arm_finalboss,eBodyParts.bp_leftArm,-22,-22,1);
					scr_addMonsterPart(obj_arm_finalboss,eBodyParts.bp_rightArm,23,-24,1);
					scr_addMonsterPart(obj_legs_finalboss,eBodyParts.bp_legs,0,0,1);
				}
				break;
		}
		break;
	#endregion
	
	#region goatHeart >> MINOR DEMON
	case "goatHeart":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Goats' Heart"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 15; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem: obj_player.coreStat_attack +=1; obj_player.coreStat_life +=1;
				break;
			/////minor demon?  TODO
			case eIData.spawnDemon:
				monsterName = "Demon";
				var body = instance_create_depth(x+8,y+8,depth,obj_body_mummy);
				lifeMax = 100;
				sealDamageDelay = 15;
				with(body)
				{
					scr_addItemDrop("demonHorn",100,"demonTongue",100,"bones",100);
					var part = scr_addMonsterPart(obj_head_demon,eBodyParts.bp_head,0,-16,-2);
					part.pitchShift = 1.5

					scr_addMonsterPart(obj_arm_cyclops,eBodyParts.bp_leftArm,-13,-18,-1);
					scr_addMonsterPart(obj_arm_cyclops,eBodyParts.bp_rightArm,13,-18,-1);
					scr_addMonsterPart(obj_legs_demon,eBodyParts.bp_legs,0,0,1);
					scr_addMonsterPart(obj_back_succubus,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
	#endregion
	
	#region oilyRag >> SHIT MUMMY
	case "oilyRag":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Oily Rag"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 18; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			/////minor demon?  TODO
			case eIData.spawnDemon:
			var body = instance_create_depth(x+8,y+8,depth,obj_body_mummy);
			with(body)
			{
				monsterName = "Wounded Demon";
				lifeMax = 150;
				sealDamageDelay = 12;
				scr_addItemDrop("brain",100,"eyeBall",100);
				scr_addMonsterPart(obj_head_mummy,eBodyParts.bp_head,0,-16,-2);

				scr_addMonsterPart(obj_arm_mummy,eBodyParts.bp_leftArm,-13,-14,-1);
				scr_addMonsterPart(obj_arm_zombie,eBodyParts.bp_rightArm,13,-14,-1);
				scr_addMonsterPart(obj_legs_zombie,eBodyParts.bp_legs,1,0,1);
			}
			break;
		}
		break;
	#endregion
	
	#region demonHorn >> MUMMY
	case "demonHorn":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Demon Horn"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 10; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			/////minor demon?  TODO
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_mummy);
				with(body)
				{
					monsterName = "Mummified Demon";
					lifeMax = 200;
					sealDamageDelay = 10;
					scr_addItemDrop("toiletPaper",100,"bones",100,"stomach",50,"goatHeart",50,"brain",50);
					scr_addMonsterPart(obj_head_mummy,eBodyParts.bp_head,0,-16,-2);

					scr_addMonsterPart(obj_arm_mummy,eBodyParts.bp_leftArm,-13,-14,-1);
					scr_addMonsterPart(obj_arm_mummy,eBodyParts.bp_rightArm,13,-14,-1);
					scr_addMonsterPart(obj_legs_mummy,eBodyParts.bp_legs,1,0,1);
				}
				break;
		}
		break;
	#endregion
	
	#region demonTongue >> CLOWN
	case "demonTongue":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Demon Tongue"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 6; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem: obj_player.coreStat_seal +=1; obj_player.coreStat_defense +=1; break;
			/////minor demon?  TODO
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_clown);
				with(body)
				{
					monsterName = "Demon of Fun";
					lifeMax = 200;
					sealDamageDelay = 10;
					scr_addItemDrop("clownEgg",100,"brain",100,"eyeBall",50);
					colSwap1 = scr_getColor(0);
					colSwap2 = scr_getColor(7);
					colSwap3 = scr_getColor(9);
					colSwap4 = scr_getColor(12);

					colSwap5 = scr_getColor(13);
					colSwap6 = scr_getColor(14);
					
					var head = scr_addMonsterPart(obj_head_clown,eBodyParts.bp_head,0,-20,-2);
					head.colSwap5 = scr_getColor(15); head.colSwap6 = scr_getColor(16);
					
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_leftArm,-10,-14,-1);
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_rightArm,10,-14,-1);
					var legs = scr_addMonsterPart(obj_legs_clown,eBodyParts.bp_legs,0,0,1);
					legs.colSwap5 = scr_getColor(18); legs.colSwap6 = scr_getColor(4);
				}
		}
		break;
	#endregion
	
	#region bones >> SPIDER
	case "bones":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Bones"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 8; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_spider);
				with(body)
				{
					monsterName = "ArachnoDemon";
					lifeMax = 250;
					sealDamageDelay = 8;
					scr_addItemDrop("goo",100,"lungs",100,"goo",50);
					scr_addMonsterPart(obj_head_spider,eBodyParts.bp_head,0,20,-3);

					scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_leftArm,-16,-14,-1,-10);
					scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_leftArm,-18,-6,-1,20);
					
					scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_rightArm,16,-14,-1,10);
					scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_rightArm,18,-6,-1,-20);
					
					scr_addMonsterPart(obj_legs_spider,eBodyParts.bp_legs,0,4,1);
					scr_addMonsterPart(obj_back_spiderEggs,eBodyParts.bp_back,0,-25,2);
				}
				break;
		}
		break;
	#endregion
		
	#region clownEgg >> SPIDER CLOWN
	case "clownEgg":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Clown Egg"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 0; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem:  obj_player.coreStat_life +=2; break;
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_spider);
				with(body)
				{
					monsterName = "Arachnoclown";
					lifeMax = 300;
					sealDamageDelay = 7;
					colSwap1 = scr_getColor(0);
					colSwap2 = scr_getColor(7);
					colSwap3 = scr_getColor(9);
					colSwap4 = scr_getColor(12);

					colSwap5 = scr_getColor(13);
					colSwap6 = scr_getColor(14);
					scr_addItemDrop("goo",100,"lungs",100,"goo",50);
					var part = scr_addMonsterPart(obj_head_clown,eBodyParts.bp_head,0,20,-3);
					part.pitchShift = 0.8;
					part.colSwap5 = scr_getColor(15); part.colSwap6 = scr_getColor(16);
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_leftArm,-10,12,-2,0);
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_rightArm,10,12,-2,0);
					
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_leftArm,-6,22,-2,20);
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_rightArm,6,22,-2,-20);
					
					
					part = scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_leftArm,-16,-14,-1,-10);
					part.colSwap5 = scr_getColor(18); part.colSwap6 = scr_getColor(4);
					part = scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_leftArm,-18,-6,-1,20);
					part.colSwap5 = scr_getColor(18); part.colSwap6 = scr_getColor(4);
					part = scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_rightArm,16,-14,-1,10);
					part.colSwap5 = scr_getColor(18); part.colSwap6 = scr_getColor(4);
					part = scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_rightArm,18,-6,-1,-20);
					part.colSwap5 = scr_getColor(18); part.colSwap6 = scr_getColor(4);
					
					part = scr_addMonsterPart(obj_legs_spider,eBodyParts.bp_legs,0,4,1);
					part.colSwap5 = scr_getColor(18); part.colSwap6 = scr_getColor(4);
					scr_addMonsterPart(obj_back_spiderEggs,eBodyParts.bp_back,0,-25,2);
				}
				break;
		}
		break;
	#endregion
		
	#region eyeBall >> CYCLOPS
	case "eyeBall":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Eyeball"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 9; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem:  obj_player.coreStat_moveSpd +=1; specialShot = 1; break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_cyclops);
				with(body)
				{
					monsterName = "Demon Cyclops";
					lifeMax = 240;
					sealDamageDelay = 9;
					scr_addItemDrop("lungs",100,"intestines",100,"eyeBall",50);
					scr_addMonsterPart(obj_head_cyclops,eBodyParts.bp_head,0,-16,-2);

					scr_addMonsterPart(obj_arm_cyclops,eBodyParts.bp_leftArm,-13,-18,-1);
					scr_addMonsterPart(obj_arm_cyclops,eBodyParts.bp_rightArm,13,-18,-1);
					scr_addMonsterPart(obj_legs_cyclops,eBodyParts.bp_legs,0,0,1);
					scr_addMonsterPart(obj_back_cyclops,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
		#endregion
		
	#region brain >> ZOMBIE
	case "brain":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Brain"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 16; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem:
				obj_player.life += 25;
				obj_player.coreStat_seal +=1; 
				specialShot = 4;
				break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_zombie);
				with(body)
				{
					monsterName = "Zombie Demon";
					lifeMax = 250;
					sealDamageDelay = 10;
					scr_addItemDrop("lungs",100,"intestines",100,"stomach",50,"bones",50);
					scr_addMonsterPart(obj_head_zombie,eBodyParts.bp_head,0,-16,-2);

					scr_addMonsterPart(obj_arm_zombie,eBodyParts.bp_leftArm,-13,-14,-1);
					scr_addMonsterPart(obj_arm_zombie,eBodyParts.bp_rightArm,13,-14,-1);
					scr_addMonsterPart(obj_legs_zombie,eBodyParts.bp_legs,0,0,1);
				}
				break;
		}
		break;
		#endregion
			
	#region goo >> MUTANT ZOMBIE
	case "goo":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Slimy Goo"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 7; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem: specialShot = 3; obj_player.coreStat_defense +=1;  break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_cyclops);
				with(body)
				{
					monsterName = "Mishapen Demon";
					colSwap1 = scr_getColor(0);
					colSwap2 = scr_getColor(1);
					colSwap3 = scr_getColor(2);
					colSwap4 = scr_getColor(7);

					colSwap5 = scr_getColor(1);
					colSwap6 = scr_getColor(3);
				
					scr_addItemDrop("stomach",100,"intestines",100,"bones",50);
					
					scr_addMonsterPart(obj_head_zombie,eBodyParts.bp_head,-8,-18,-2,32);
					scr_addMonsterPart(obj_head_zombie,eBodyParts.bp_head,8,-6,-2,-12);
					scr_addMonsterPart(obj_arm_zombie,eBodyParts.bp_leftArm,-13,-20,-1,-74);
					scr_addMonsterPart(obj_arm_zombie,eBodyParts.bp_leftArm,-10,-14,-1,-44);
					scr_addMonsterPart(obj_arm_zombie,eBodyParts.bp_leftArm,-6,-2,-1,-24);
					scr_addMonsterPart(obj_arm_zombie,eBodyParts.bp_rightArm,13,-18,-1);
					scr_addMonsterPart(obj_legs_zombie,eBodyParts.bp_legs,0,0,1);
				}
				break;
		}
		break;
	#endregion
		
	#region stomach >> SUCCUBUS
	case "stomach":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Stomach"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 5; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem: specialShot = 2; obj_player.coreStat_life+=1; break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_succubus);
				with(body)
				{
					monsterName = "Succubus";
					colSwap1 = scr_getColor(0);
					colSwap2 = scr_getColor(2);
					colSwap3 = scr_getColor(15);
					colSwap4 = scr_getColor(10);

					colSwap5 = scr_getColor(6);
					colSwap6 = scr_getColor(16);
					
					lifeMax = 300;
					sealDamageDelay = 6;
					scr_addItemDrop("demonHorn",100,"brain",100,"bloodClot",50);
					
					scr_addMonsterPart(obj_head_succubus,eBodyParts.bp_head,0,-24,-2);

					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_leftArm,-11,-18,1);
					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_rightArm,11,-18,1);
					scr_addMonsterPart(obj_legs_succubus,eBodyParts.bp_legs,0,0,1);
					scr_addMonsterPart(obj_back_succubus,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
	#endregion
		
	#region toiletPaper >> ROBOT
	case "toiletPaper":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Toilet Paper"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 3; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_robot);
				with(body)
				{
					monsterName = "Robodemon";
					lifeMax = 300;
					sealDamageDelay = 6;
					scr_addItemDrop("batteries",100);
					
					scr_addMonsterPart(obj_head_robot,eBodyParts.bp_head,0,-32,-3);

					scr_addMonsterPart(obj_arm_robot,eBodyParts.bp_leftArm,-15,-27,-1);
					
					scr_addMonsterPart(obj_arm_robot,eBodyParts.bp_rightArm,15,-27,-1);
					
					scr_addMonsterPart(obj_legs_robot,eBodyParts.bp_legs,0,-8,1);
				}
				break;
		}
		break;
	#endregion
	
	#region batteries >> BIGROBOT
	case "batteries":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Batteries"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 2; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_robot);
				with(body)
				{
					monsterName = "Infernatron 9000";
					lifeMax = 400;
					sealDamageDelay = 4;
					colSwap1 = scr_getColor(0);
					colSwap2 = scr_getColor(1);
					colSwap3 = scr_getColor(2);
					colSwap4 = scr_getColor(7);

					colSwap5 = scr_getColor(1);
					colSwap6 = scr_getColor(3);
					scr_addItemDrop("lungs",100,"intestines",100);
					
					var hd=  scr_addMonsterPart(obj_head_robot,eBodyParts.bp_head,-12,-32,-3);
					hd.pitchShift = 0.7;
					hd = scr_addMonsterPart(obj_head_robot,eBodyParts.bp_head,+12,-32,-3);
					hd.pitchShift = 0.7;
					
					scr_addMonsterPart(obj_arm_robot,eBodyParts.bp_leftArm,-15,-27,-1,20);
					scr_addMonsterPart(obj_arm_robot,eBodyParts.bp_leftArm,-12,-22,-1);
					
					scr_addMonsterPart(obj_arm_robot,eBodyParts.bp_rightArm,15,-27,-1,-20);
					scr_addMonsterPart(obj_arm_robot,eBodyParts.bp_rightArm,12,-22,-1);
					
					scr_addMonsterPart(obj_legs_robot,eBodyParts.bp_legs,0,-8,1);
					scr_addMonsterPart(obj_back_robot,eBodyParts.bp_back,0,-26,2);
				}
				break;
		}
		break;
	#endregion
		
	#region bloodClot >> ARCHSUCCUBUS
	case "bloodClot":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Blood Clot"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 1; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem: specialShot = 0; obj_player.coreStat_atkSpd+=1; break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_succubus);
				with(body)
				{
					monsterName = "Archsuccubus";
					colSwap1 = scr_getColor(0);
					colSwap2 = scr_getColor(2);
					colSwap3 = scr_getColor(15);
					colSwap4 = scr_getColor(10);

					colSwap5 = scr_getColor(6);
					colSwap6 = scr_getColor(16);
					
					lifeMax = 400;
					sealDamageDelay = 5;
					scr_addItemDrop("demonHorn",100,"brain",100);
					
					var hd = scr_addMonsterPart(obj_head_succubus,eBodyParts.bp_head,-12,-24,-2);
					hd.pitchShift = 0.7;
					hd = scr_addMonsterPart(obj_head_spider,eBodyParts.bp_head,12,-24,-2);
					hd.pitchShift = 0.7;
					
					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_leftArm,-11,-10,1,-60);
					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_leftArm,-11,-18,1);
					
					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_rightArm,11,-10,1,60);
					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_rightArm,11,-18,1);
					
					scr_addMonsterPart(obj_legs_succubus,eBodyParts.bp_legs,0,0,1);
					scr_addMonsterPart(obj_back_succubus,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
	#endregion
		
	#region intestine >> ETTIN
	case "intestines":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Intestines"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 14; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem: obj_player.life += 25;  obj_player.coreStat_attack+=1; break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_cyclops);
				with(body)
				{
					monsterName = "Ettin";
					lifeMax = 500;
					sealDamageDelay = 6;
					
					colSwap1 = scr_getColor(1);
					colSwap2 = scr_getColor(7);
					colSwap3 = scr_getColor(18);
					colSwap4 = scr_getColor(5);

					colSwap5 = scr_getColor(6);
					colSwap6 = scr_getColor(10);
					
					scr_addItemDrop("batteries",100,"goo",100,"eyeBall",100);
					scr_addMonsterPart(obj_head_cyclops,eBodyParts.bp_head,-10,-20,-2);
					scr_addMonsterPart(obj_head_cyclops,eBodyParts.bp_head,10,-14,-3);

					scr_addMonsterPart(obj_arm_cyclops,eBodyParts.bp_leftArm,-13,-18,-1);
					scr_addMonsterPart(obj_arm_cyclops,eBodyParts.bp_rightArm,13,-18,-1);
					scr_addMonsterPart(obj_legs_cyclops,eBodyParts.bp_legs,0,0,1);
					scr_addMonsterPart(obj_back_cyclops,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
		#endregion
	
	#region lungs >> Cyclubbus
	case "lungs":
		switch(data)
		{
			case eIData.longName: 
			case eIData.displayName: retval = "Lungs"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 4; break;
			
			case eIData.isEdible: retval = true; break;
			case eIData.eatItem: obj_player.life += 25; specialShot = 1;  obj_player.coreStat_atkSpd+=1; break;
			
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_succubus);
				with(body)
				{
					monsterName = "Cyclubbus";
					lifeMax = 320;
					sealDamageDelay = 5;
					scr_addItemDrop("eyeBall",100,"bloodClot",50);
					
					scr_addMonsterPart(obj_head_cyclops,eBodyParts.bp_head,0,-24,-2);

					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_leftArm,-11,-18,1);
					scr_addMonsterPart(obj_arm_cyclops,eBodyParts.bp_rightArm,11,-18,1);
					scr_addMonsterPart(obj_legs_succubus,eBodyParts.bp_legs,0,0,1);
					scr_addMonsterPart(obj_back_succubus,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
		#endregion
	
	#region OFFICE DEMONS
	case "dollarBill":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Dollar Bill"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 19; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			/////office intern demon
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_office);
				with(body)
				{
					monsterName = "Demon Intern";
					lifeMax = 100;
					sealDamageDelay = 15;
					scr_addItemDrop("stapler",100,"demonHorn",100);
					scr_addMonsterPart(obj_head_mummy,eBodyParts.bp_head,0,-16,-2);

					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_leftArm,-13,-14,-1);
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_rightArm,13,-14,-1);
					scr_addMonsterPart(obj_legs_demon,eBodyParts.bp_legs,1,0,1);
					//scr_addMonsterPart(obj_back_cyclops,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
		
	case "stapler":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Stapler"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 20; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			/////office secretary demon
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_succubus);
				with(body)
				{
					monsterName = "Demon Secretary";
					lifeMax = 150;
					sealDamageDelay = 13;
					scr_addItemDrop("complaint",100,"demonTongue",100);
					scr_addMonsterPart(obj_head_succubus,eBodyParts.bp_head,0,-16,-2);

					scr_addMonsterPart(obj_arm_succubus,eBodyParts.bp_leftArm,-13,-14,-1);
					scr_addMonsterPart(obj_arm_clown,eBodyParts.bp_rightArm,13,-14,-1);
					scr_addMonsterPart(obj_legs_office,eBodyParts.bp_legs,1,0,1);
				}
				break;
		}
		break;
		
	case "complaint":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Formal Complaint"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 21; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			/////office Demon Ressources Manager
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_office);
				with(body)
				{
					lifeMax = 200;
					sealDamageDelay = 10;
					monsterName = "Demon Ressources Manager";
					scr_addItemDrop("binder",100,"brain",100);
					scr_addMonsterPart(obj_head_spider,eBodyParts.bp_head,0,-16,-2);

					scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_leftArm,-13,-14,-1);
					scr_addMonsterPart(obj_arm_spider,eBodyParts.bp_rightArm,13,-14,-1);
					scr_addMonsterPart(obj_legs_office,eBodyParts.bp_legs,1,0,1);
				}
				break;
		}
		break;
		
	case "binder":
		switch(data)
		{
			case eIData.longName:
			case eIData.displayName: retval = "Reports Binder"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 22; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			/////Demon Executive
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_office);
				with(body)
				{
					monsterName = "Demon Executive";
					lifeMax = 300;
					sealDamageDelay = 8;
					scr_addItemDrop("creditCard",100,"bloodClot",100);
					scr_addMonsterPart(obj_head_office,eBodyParts.bp_head,0,-16,-2);

					scr_addMonsterPart(obj_arm_office,eBodyParts.bp_leftArm,-13,-14,-1);
					scr_addMonsterPart(obj_arm_office,eBodyParts.bp_rightArm,13,-14,-1);
					scr_addMonsterPart(obj_legs_office,eBodyParts.bp_legs,1,0,1);
					scr_addMonsterPart(obj_back_succubus,eBodyParts.bp_back,0,-20,2);
				}
				break;
		}
		break;
		
	case "creditCard":
		switch(data)
		{
			case eIData.longName: retval = "Corporate Credit Card"; break;
			case eIData.displayName: retval = "Credit Card"; break;
			case eIData.icon: retval = spr_offerings; break;
			case eIData.iconFrm: retval = 23; break;
			
			case eIData.isEdible: retval = false; break;
			case eIData.eatItem: break;
			/////Demon CEO
			case eIData.spawnDemon:
				var body = instance_create_depth(x+8,y+8,depth,obj_body_spider);
				with(body)
				{
					monsterName = "Demon CEO";
					lifeMax = 400;
					sealDamageDelay = 15;
					
					colSwap1 = scr_getColor(0);
					colSwap2 = scr_getColor(2);
					colSwap3 = scr_getColor(15);
					colSwap4 = scr_getColor(10);

					colSwap5 = scr_getColor(6);
					colSwap6 = scr_getColor(16);
					scr_addItemDrop("bloodClot",100,"dollarBill",100,"dollarBill",100,"dollarBill",100,"dollarBill",100);
					scr_addMonsterPart(obj_head_office,eBodyParts.bp_head,10,20,-3);
					scr_addMonsterPart(obj_head_office,eBodyParts.bp_head,-10,20,-3);
					
					scr_addMonsterPart(obj_arm_office,eBodyParts.bp_leftArm,-13,12,-1);
					scr_addMonsterPart(obj_arm_office,eBodyParts.bp_rightArm,13,12,-1);
					
					part = scr_addMonsterPart(obj_legs_spider,eBodyParts.bp_legs,0,4,1);
					part.colSwap5 = scr_getColor(18); part.colSwap6 = scr_getColor(4);
					scr_addMonsterPart(obj_back_spiderEggs,eBodyParts.bp_back,0,-25,2);
				}
				break;
		}
		break;
	#endregion
	
}

if(specialShot!= noone)
{
	obj_player.attackActive[specialShot]+=3;
}

if(debugMonster)
{
	with(body)
	{
		lifeMax = 10;
		sealDamageDelay = 15;
		scr_addMonsterPart(obj_head_mummy,eBodyParts.bp_head,0,-16,-2);
		scr_addMonsterPart(obj_arm_mummy,eBodyParts.bp_leftArm,-13,-14,-1);
		scr_addMonsterPart(obj_arm_mummy,eBodyParts.bp_rightArm,13,-14,-1);
		scr_addMonsterPart(obj_legs_mummy,eBodyParts.bp_legs,1,0,1);
	}
}

return retval;