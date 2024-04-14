if(isNull obj_dealer OR {isNull brico} OR {isNull cagoule}) exitWith {};

private _r1 = selectRandom [1,2,3];
switch (_r1) do {
	case 1 : {brico setPosATL [12816.6,10365.3,0.00138712]; brico setDir 180;};
	case 2 : {brico setPosATL [14266.6,4511.09,1.32822]; brico setDir 47;};
	case 3 : {brico setPosATL [1769.22,12341.2,0.390674]; brico setDir 163;};
};

cagoule setPosATL [8423.95,9808.94,0.00144267]; cagoule setDir 325;

sleep 3600;

private _r = selectRandom [1,2,3,4,5];
switch (_r) do { 
	case 1 : {obj_dealer setPosATL [9060.37,14392.7,12.806]; obj_dealer setDir 216;};
	case 2 : {obj_dealer setPosATL [11933.9,10687,0.126344]; obj_dealer setDir 300;};
	case 3 : {obj_dealer setPosATL [3196.85,12309.9,12.3149]; obj_dealer setDir 266;};
	case 4 : {obj_dealer setPosATL [10136.6,7113.65,7.66853]; obj_dealer setDir 170;};
	case 5 : {obj_dealer setPosATL [15327,5264.97,0.00172997]; obj_dealer setDir 132;};
};