#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_couperWeed.sqf
  ALF Nanou
*/

if (alf_niv_illegal < 0) exitWith {["ERREUR","Vous n'est pas assez expérimenté pour cela ...","danger"] spawn ALF_fnc_doMsg;};

private _mode = _this select 0;
switch (_mode) do {
	case 0 : {
		for "_i" from 1 to 5 step 1 do {
			["ALF_Weed",false] spawn life_fnc_handleItem;
		};
		["ALF_Weed_P",true] spawn life_fnc_handleItem;
	};
	case 1 : {
		for "_i" from 1 to 5 step 1 do {
			["ALF_Weed_2",false] spawn life_fnc_handleItem;
		};
		["ALF_Weed_P_2",true] spawn life_fnc_handleItem;
	};
	case 2 : {
		for "_i" from 1 to 5 step 1 do {
			["ALF_Weed_3",false] spawn life_fnc_handleItem;			
		};
		["ALF_Weed_P_3",true] spawn life_fnc_handleItem;
	};
};

[3,3] spawn ALF_fnc_addXP;