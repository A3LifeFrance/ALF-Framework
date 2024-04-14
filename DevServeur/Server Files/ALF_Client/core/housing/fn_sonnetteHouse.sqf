#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_sonnetteHouse.sqf
*/
if((time - life_action_delay) < 15) exitWith {};
life_action_delay = time;

private _h = _this select 0;
if(isNull _h) exitWith {};

private _nh = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _h), "displayName");

private _on = false;
if([(call TFAR_fnc_activeSwRadio),"alf_iphone_1"] call TFAR_fnc_isSameRadio) then {
	[format["%1",_nh],"La sonnette de ta maison vient de s'activer."] spawn ALF_fnc_doSms;
	_on = true;
};
if([(call TFAR_fnc_activeSwRadio),"alf_neogend_1"] call TFAR_fnc_isSameRadio) then {
	[format["%1",_nh],"La sonnette de ta maison vient de s'activer."] spawn ALF_fnc_doSms;
	_on = true;
};
if([(call TFAR_fnc_activeSwRadio),"alf_sony_1"] call TFAR_fnc_isSameRadio) then {
	[format["%1",_nh],"La sonnette de ta maison vient de s'activer."] spawn ALF_fnc_doSms;
	_on = true;
};

if !(_on) exitWith {};

playSound "sonnettemaison";
private _posHouse = getPos _h;
private _marker = createMarkerLocal ["house_sonnette",_posHouse];
_marker setMarkerTextLocal "Sonnette..";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "loc_Lighthouse";

[_marker] spawn {
	_marker = _this select 0;
	sleep 30;
	deleteMarkerLocal _marker;	
};