#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_poserSafe.sqf
	Author: ALF Team
*/
private _coffre = _this select 0;
if(isNull _coffre) exitWith {};
if((_coffre animationSourcePhase 'safe_source') < 0.5) exitWith {};

private _id = 0;
switch(true) do {
	case (_coffre isEqualTo alf_coffre_prison_1) : {_id = 1;};
	case (_coffre isEqualTo alf_coffre_prison_2) : {_id = 2;};
	case (_coffre isEqualTo alf_coffre_prison_3) : {_id = 3;};
	case (_coffre isEqualTo alf_coffre_prison_4) : {_id = 4;};
	case (_coffre isEqualTo alf_coffre_prison_5) : {_id = 5;};
	case (_coffre isEqualTo alf_coffre_prison_6) : {_id = 6;};
	case (_coffre isEqualTo alf_coffre_prison_7) : {_id = 7;};
	case (_coffre isEqualTo alf_coffre_prison_8) : {_id = 8;};
	case (_coffre isEqualTo alf_coffre_prison_9) : {_id = 9;};
	case (_coffre isEqualTo alf_coffre_prison_10) : {_id = 10;};
	case (_coffre isEqualTo alf_coffre_prison_11) : {_id = 11;};
	case (_coffre isEqualTo alf_coffre_prison_12) : {_id = 12;};
	case (_coffre isEqualTo alf_coffre_prison_13) : {_id = 13;};
	case (_coffre isEqualTo alf_coffre_prison_14) : {_id = 14;};
	case (_coffre isEqualTo alf_coffre_prison_15) : {_id = 15;};
	case (_coffre isEqualTo alf_coffre_prison_16) : {_id = 16;};
	case (_coffre isEqualTo alf_coffre_prison_17) : {_id = 17;};
	case (_coffre isEqualTo alf_coffre_prison_18) : {_id = 18;};
	case (_coffre isEqualTo alf_coffre_prison_19) : {_id = 19;};
	case (_coffre isEqualTo alf_coffre_prison_20) : {_id = 20;};
};

if(_id isEqualTo 0) exitWith {};
if !(_id isEqualTo ALF_Prison_Coffre) exitWith {};

["ALF_Locker_Artisanal",false] call life_fnc_handleItem;
[_coffre,0] remoteExec ["HC_fnc_customCoffre",HC_Life];
