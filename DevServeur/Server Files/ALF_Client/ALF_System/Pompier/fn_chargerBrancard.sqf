/*
	chargerBrancard
	nanou
*/
private _v = _this select 0;
if(isNull _v) exitWith {};

private _b = position player nearestObject "ALF_Brancard_P";
if(isNull _b) exitWith {};

if(typeOf _v isEqualTo "V_ALF_PW207_Pompier") exitWith {
	_b attachTo [_v,[1.38,-0.87,0.2]];
	_b setDir 177;
};

if(typeOf _v isEqualTo "V_ALF_EC135_Pompier") exitWith {
	_b attachTo [_v,[-0.2,0.6,0.002]];
	_b setDir 177;
};

if (typeOf _v in ["V_ALF_VSAV_CUBE_SAMU","V_ALF_VSAV_CUBE_POMPIER"]) exitWith {
	_b attachTo [_v,[-0.31958,0.515625,0.15]];
	_b setDir 180;
};

_b attachTo [_v,[0.0854492,0.147461,0.15]];
_b setDir 180;
