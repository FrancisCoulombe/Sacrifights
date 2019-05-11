///@function scr_getColor
///@param colIndex

var ind = argument0;
var retval = 0;

switch(ind)
{
	case 0: retval = 0x1c0c14; break; ///swap1
	case 1: retval = 0x451923; break;
	case 2: retval = 0x342444; break;
	case 3: retval = 0x4e4a4e; break; ///swap2
	case 4: retval = 0xcac26d; break; ///swap6
	
	case 5: retval = 0xa19585; break; ///swap3
	case 6: retval = 0x617175; break;
	case 7: retval = 0x6d3430; break; ///swap5
	case 8: retval = 0x304c85; break;
	case 9: retval = 0x2c7dd2; break;
	
	case 10: retval = 0x99aad2; break;
	case 11: retval = 0x5ed4da; break;
	case 12: retval = 0xd6eede; break; ///swap4
	case 13: retval = 0x2caa6d; break;
	case 14: retval = 0x246534; break;
	
	case 15: retval = 0x19188a; break;
	case 16: retval = 0x935de0; break;
	case 17: retval = 0xce59a3; break;
	case 18: retval = 0xce7d59; break;
	case 19: retval = 0xaaaaff; break;
	
	default: retval = 0xffffff; break;
}

return retval;