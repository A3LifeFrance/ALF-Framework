#include "\ALF_Client\script_macros.hpp"
/*
File: fn_detectingBad.sqf
Author: ALF Team
*/

private _r = selectrandom[0,1,2,3,4,5];
private _m = false;

if(_r >= 3) then {
	private _c = 0;
	for "_i" from 0 to 1 step 0 do {
		_c = _c + 1;
		if(_c >= 2) exitWith {
			_m = true;
		};
		sleep 1;
	};
};

if (_m) then {
	private _l = "Le Palais";
	if (player distance (getMarkerPos "marker_86") < 100) then {_l = "Sauzon";};
	if (player distance (getMarkerPos "marker_87") < 100) then {_l = "Loc Maria";};
	["Cyber Cafe",format["Notre pare-feu vient de détecter une intrusion sur un site classé dangereux sur %1.",_l]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
	playSound3D ["ALF_Client2\sounds\banque_alarm.ogg", player, false,position player, 3, 1, 150];
};

private _atm = nearestObject[position player,"Land_ALF_Security"];
if(isNull _atm) exitWith {};
if(_atm distance player > 100) exitWith {};
private _nearPlayers = (position _atm) nearEntities [["Man"],15];
private _nearPlayersFace = [];
{
	if !((goggles player) in ["UR_Bag1","UR_Bag2","UR_Bag3","UR_Bag4","UR_Bag5","UR_Bag6","UR_Bag7","UR_Bag8","UR_Bag9","UR_Bag10","UR_Bag11","UR_Bag12","UR_Bag13","UR_Bag14","UR_Bag15","UR_Bag16","UR_Bag17","ALF_G_Balaclava_blk","ALF_G_Bandanna_beast","UR_Owl","UR_Fox","UR_Dino_Brown","UR_Hawk_Brown","UR_Hawk_White","ALF_G_Bandanna_blk","UR_Pig","UR_Pig_Bloody","UR_Cat_Gray","UR_monkey","UR_monkey_darkbrown","UR_monkey_lightbrown","UR_monkey_grey","UR_Skull_Bone","UR_Hockey_Mask_4_CIRCUIT","ALF_Masque"] && {(goggles player) in ["ALF_G_Balaclava_blk"]}) then {
		_nearPlayersFace pushBack (_x getVariable "adnface" select 1);
	} else {
		_nearPlayersFace pushBack "Cagoule";
	};
} forEach _nearPlayers;

private _hour = date select 3;
private _min = date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
private _time = format["%1:%2",_hour,_min];

[_atm,_time,_nearPlayersFace] remoteExecCall ["HC_fnc_setCameraVar",HC_Life];
