///@function scr_addMonsterPart
///@param partIndex
///@param partType
///@param anchorX
///@param anchorY
///@param anchorDepth
///@param [anchorAngle]

var pIndex = argument[0];
var pType = argument[1];
var anchorX = argument[2];
var anchorY = argument[3];
var anchorDepth = argument[4];
var anchorAngle = 0;
if(argument_count>5){anchorAngle = argument[5];}

var ob = instance_create_depth(x+anchorX,y+anchorY,depth+anchorDepth,pIndex);
ob.anchorX = anchorX;
ob.anchorY = anchorY;
ob.anchorDepth = anchorDepth;
ob.anchorAngle = anchorAngle;
ob.partType = pType;
ob.parentBody = id;

ob.colSwap1 = colSwap1;
ob.colSwap2 = colSwap2;
ob.colSwap3 = colSwap3;
ob.colSwap4 = colSwap4;
ob.colSwap5 = colSwap5;
ob.colSwap6 = colSwap6;

bodyPart[bodyPartCount] = ob;
bodyPartType[bodyPartCount] = pType;
bodyPartCount+=1;

return ob;