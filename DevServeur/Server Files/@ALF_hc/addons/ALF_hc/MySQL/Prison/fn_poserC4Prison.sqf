#include "\ALF_hc\hc_macros.hpp"
/*
	fn_poserC4Prison.sqf
	ALF TEAM
*/
private _prison = _this select 0;
private _unit = _this select 1;
if(isNull _prison || {isNull _unit}) exitWith {};
if(_prison animationPhase "explo" < 1) exitWith {};
private _c = {_x getVariable ["PenitService",false]} count playableUnits;
if(_c < 4) exitWith {["PRISON","Il n'y a pas assez de surveillant.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if !(_unit getVariable ["ALF_EnPrison",false]) exitWith {["PRISON","Tu n'es pas prisonnier.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

_prison animate ["explo",0];
["ALF_C4_Artisanal",false] remoteExec ["life_fnc_handleItem",_unit];
playSound3D ["ALF_Client2\sounds\banque_activeC4.ogg", _prison, false, (_prison modelToWorld (_prison selectionPosition "boom")), 5, 1, 30];
uiSleep 10;

private _bomb = "mini_Grenade" createVehicle [0,0,0];
_bomb setPos (_prison modelToWorld (_prison selectionPosition "boom"));
uiSleep 5;
_prison animate ["explo",1];
_prison animate ["destruc_mur",1];
_prison animate ["blaste",0];
uiSleep 3;

[] spawn {
	private _time = 0;
	for "_i" from 0 to 1 step 0 do {
		if(_time > 5) exitWith {};
		_time = _time + 1;
		playSound3D ["ALF_Client2\sounds\banque_alarm.ogg",alf_prison_cour];
		playSound3D ["ALF_Client2\sounds\banque_alarm.ogg",alf_prison_couloir];
		uiSleep 50;
	};
};

[_prison] spawn {
	_prison = _this select 0;
	private _comico = nearestObjects [_prison, ["Land_Caserne","Land_ALF_Comico2"], 15000];
	private _timer = 0;
	for "_i" from 0 to 1 step 0 do {
		if(_timer > 10) exitWith {};
		_timer = _timer + 1;
		{
			playSound3D ["ALF_Client2\sounds\gendarmerie_redalarm.ogg", _x];
		} forEach _comico;
		uiSleep 21;
	};
};

["PRISON","URGENCE !! L'alarme de la prison vient d'être activé !!!"] remoteExec ["ALF_fnc_doCopCall",playableUnits select {_x getVariable ["CopService",false]}];
