/// @description XXX

// Inherit the parent event
event_inherited();

monsterName = choose("Cornelius","Rodriguez","Barbara","Honko");

colSwap1 = scr_getColor(0);
colSwap2 = scr_getColor(3);
colSwap3 = scr_getColor(5);
colSwap4 = scr_getColor(12);

colSwap5 = scr_getColor(7);
colSwap6 = scr_getColor(4);

lifeMax = 200;
life = noone;
dmgFlash = 0;
initialized = false;
aiTimer = 90;
feetX = x;
feetY = y;

victoryJingle = msk_victory_short;
sealedBGM = msk_battle_spooky;
battleBGM = msk_battle_highenergy;
BGMpitch = 1;

dyingSequence = 0;

voice_startTrigger = true;
voice_idleTrigger = false;
voice_painTrigger = false;
voice_angryTrigger = false;
voice_dieTrigger = false;

idleCount = 0;

voiceTimer = 0;

isMonster = true;

bodyPartCount = 0;
bodyPart = [];
bodyPartType = [];

parentBody = id;

emote = "";
emoteTimer = 0;

lAttacks = ds_list_create();
lActiveAttacks = ds_list_create();
itemDrops = ds_list_create();

attackChoiceDelay = 30;
attackChoiceTimer = 30;
attackIsDone = false;

sealDamageDelay = 10;
sealDamageTimer = 20;

actSpdMulti = 1;