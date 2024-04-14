#include "\ALF_hc\hc_macros.hpp"

private["_banque","_unit","_bomb","_comico","_time","_timer"];
_banque = _this select 0;
_unit = _this select 1;
if (isNull _banque OR {isNull _unit}) exitWith {};

private _c = {_x getVariable ["CopService",false]} count playableUnits;
if(_c < 8) exitWith {};

if (_banque animationPhase "explo" isEqualTo 0) exitWith {};
_banque animate ["explo",0];
["ALF_C4",false] remoteExec ["life_fnc_handleItem",_unit];
playSound3D ["ALF_Client2\sounds\banque_activeC4.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_c4")), 3, 1, 100];
uiSleep 10;

_bomb = "mini_Grenade" createVehicle [0,0,0];
_bomb setPos (_banque modelToWorld (_banque selectionPosition "p_c4"));
uiSleep 5;
_banque animate ["explo",1];
_banque animate ["anim_1",0];
_banque animate ["anim_2",1];
_banque animate ["grille",0];

uiSleep 3;
[_banque] spawn {
	_banque = _this select 0;
	_time = 0;
	for "_i" from 0 to 1 step 0 do {
		if(_time > 10) exitWith {};
		_time = _time + 1;
		playSound3D ["ALF_Client2\sounds\banque_alarm.ogg", _banque];
		uiSleep 50;
	};
};

[_banque] spawn {
	_banque = _this select 0;
	_comico = nearestObjects [_banque, ["Land_Caserne","Land_ALF_Comico2"], 15000];
	_timer = 0;
	for "_i" from 0 to 1 step 0 do {
		if(_timer > 15) exitWith {};
		_timer = _timer + 1;
		{
			playSound3D ["ALF_Client2\sounds\gendarmerie_redalarm.ogg", _x];
		} forEach _comico;
		uiSleep 21;
	};
};

["Banque Central","URGENCE !! L'alarme de la banque central vient d'être activé !!!"] remoteExec ["ALF_fnc_doCopCall",(playableUnits select {_x getVariable ["CopService",false]})];
