#include "\ALF_Client\script_macros.hpp"
/*
File: fn_copHouseMarker.sqf
Author: ALF Team
*/
params [
	["_house",objNull,[objNull]],
	["_uid","",[""]]
];
if (isNull _house || {_uid isEqualTo ""}) exitWith {};

if(!(_uid isEqualTo (getPlayerUID player)) && {!b_6}) exitWith {};
if(b_6) then {
	["Intrusion Maison","L'alarme d'une maison vient de se déclencher. Un marker est disponible sur la carte.","warning"] spawn ALF_fnc_doMsg;
} else {
	["Intrusion Maison","L'alarme de ta maison vient de se déclencher. Un marker est disponible sur la carte.","warning"] spawn ALF_fnc_doMsg;
};

private _posHouse = getPos _house;
private _marker = createMarkerLocal [format ["house_braquage_%1",_posHouse],_posHouse];
_marker setMarkerTextLocal "Braquage en cours..";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "loc_Lighthouse";

[_marker] spawn {
	_marker = _this select 0;
	sleep 300;
	deleteMarkerLocal _marker;	
};
