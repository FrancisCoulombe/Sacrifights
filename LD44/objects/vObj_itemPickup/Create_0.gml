/// @description XXX

// Inherit the parent event
event_inherited();
shadowSize = 6;
shadowShiftx = 8;
shadowShifty = 14;

itemSpr = scr_itemDB(itemIndex,eIData.icon);
itemImg = scr_itemDB(itemIndex,eIData.iconFrm);

initialized = true;

z = 0;
mvDir = irandom(360);
mvFric = 0.025;
mvSpd = 0;
mvUp = 0;