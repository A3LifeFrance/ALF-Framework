/*
	File: fn_copBreakDoor.sqf
	Author: ALF NiiRoZz
*/
params [
	["_house",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _house || {isNull _unit}) exitWith {};

private _mobs = _house getVariable["mobiliers",[]];
if (_mobs isEqualTo []) exitWith {};

private _ss = objNull;
{
	if(((getModelInfo _x) select 1) isEqualTo "alf_mobiliers\alf_security\alf_security.p3d") exitWith {
		_ss = _x;
	};
} forEach _mobs;
if(isNull _ss) exitWith {};

if(_unit distance _ss < 30) then {
	playSound3D ["ALF_Client2\sounds\banque_alarm.ogg", _ss, false,position _ss, 3, 1, 150];
	[_house] call HC_fnc_copHouseMarker;

	private _nearPlayers = (position _ss) nearEntities [["Man"],20];
	private _nearPlayersFace = [];
	{
		if !((headgear player) in ["ALF_Casque_PMO","ALF_Bike","ALF_H_Moto_2_Violet","ALF_H_Moto_2_Vert","ALF_H_Moto_2_RougeFonce","ALF_H_Moto_2_Orange","ALF_H_Moto_2_Jaune","ALF_H_Moto_2_Bleu","ALF_H_Moto_2_Blanc","ALF_H_Moto_2_Noir","ALF_H_Moto_Violet","ALF_H_Moto_Vert","ALF_H_Moto_RougeFonce","ALF_H_Moto_Orange","ALF_H_Moto_Jaune","ALF_H_Moto_Bleu","ALF_H_Moto_Blanc","ALF_H_Moto_Noir","UR_Bag1","UR_Bag2","UR_Bag3","UR_Bag4","UR_Bag5","UR_Bag6","UR_Bag7","UR_Bag8","UR_Bag9","UR_Bag10","UR_Bag11","UR_Bag12","UR_Bag13","UR_Bag14","UR_Bag15","UR_Bag16","UR_Bag17","ALF_G_Balaclava_blk","ALF_G_Bandanna_beast","UR_Owl","UR_Fox","UR_Dino_Brown","UR_Hawk_Brown","UR_Hawk_White","ALF_G_Bandanna_blk","UR_Pig","UR_Pig_Bloody","UR_Cat_Gray","UR_monkey","UR_monkey_darkbrown","UR_monkey_lightbrown","UR_monkey_grey","UR_Skull_Bone","UR_Hockey_Mask_4_CIRCUIT","ALF_Masque"] && {(goggles player) in ["ALF_G_Balaclava_blk"]}) then {
			_nearPlayersFace pushBack (_x getVariable "adnface" select 1);
		};
	} forEach _nearPlayers;

	private _hour = date select 3;
	private _min = date select 4;
	if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
	private _time = format["%1:%2",_hour,_min];

	[_ss,_time,_nearPlayersFace] remoteExecCall ["HC_fnc_setCameraVar",HC_Life];
	
};