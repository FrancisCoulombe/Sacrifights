///@function scr_addAttack
///@param atkName
///@param userEvent
///@param [attackChance:100]
///@param [beforeRep:2]
///@param [delayAfter:30]
///@param [lifeMin:0]
///@param [lifeMax:100]

var atkName = argument[0];
var userEvent = argument[1];
var attackChance = 100;
var beforeRep = 2;
var delayAfter = 30;
var lifeMin = 0;
var lifeMax = 100;

if(argument_count>2){attackChance = argument[2];}
if(argument_count>3){beforeRep = argument[3];}
if(argument_count>4){delayAfter = argument[4];}
if(argument_count>5){lifeMin = argument[5];}
if(argument_count>6){lifeMax = argument[6];}

var mpAtk = ds_map_create();
ds_map_add(mpAtk,"atkName",atkName);
ds_map_add(mpAtk,"objectUsing",id);
ds_map_add(mpAtk,"userEvent",userEvent);
ds_map_add(mpAtk,"attackChance",attackChance);
ds_map_add(mpAtk,"beforeRep",beforeRep);
ds_map_add(mpAtk,"delayAfter",delayAfter);
ds_map_add(mpAtk,"lifeMin",lifeMin);
ds_map_add(mpAtk,"lifeMax",lifeMax);
ds_map_add(mpAtk,"lastUsed",99);
ds_map_add(mpAtk,"isActive",false);

ds_list_add(parentBody.lAttacks,mpAtk);

return mpAtk;