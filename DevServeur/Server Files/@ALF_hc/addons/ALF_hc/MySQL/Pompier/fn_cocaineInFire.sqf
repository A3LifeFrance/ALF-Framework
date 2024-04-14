#include "\ALF_hc\hc_macros.hpp"
/*
	cocaineInFire
*/
private _obj = _this select 0;
if(isNull _obj) exitWith {};

playSound3D ["ALF_Client2\sounds\fire_alarm.ogg", _obj, false, getPosATL _obj, 1, 1, 150];
uiSleep 4;

[_obj modelToWorld [-12.1426,2.58545,-1.83188]] spawn HC_fnc_createFire;
[_obj modelToWorld [-11.7097,-0.89209,-1.61021]] spawn HC_fnc_createFire;
uiSleep 1;
[_obj modelToWorld [-11.3528,-5.77197,-1.55838]] spawn HC_fnc_createFire;
[_obj modelToWorld [10.5688,-4.91992,-1.76344]] spawn HC_fnc_createFire;
uiSleep 0.5;
[_obj modelToWorld [9.3396,4.10742,-1.91481]] spawn HC_fnc_createFire;
[_obj modelToWorld [5.00244,-1.66309,-1.88802]] spawn HC_fnc_createFire;
uiSleep 0.5;
[_obj modelToWorld [-2.78516,-1.97119,-1.88411]] spawn HC_fnc_createFire;
[_obj modelToWorld [-5.92554,4.26953,-1.79522]] spawn HC_fnc_createFire;

ALF_HC_Fire pushBack _obj;
publicVariable "ALF_HC_Fire";

["INCENDIE","ALERTE INCENDIE !! DEPART D'INCENDIE DANS UN HANGAR !!"] remoteExec ["ALF_fnc_doMedCall",playableUnits select {_x getVariable ["MedService",false]}];

private _co = nearestObjects [[8000,8000,0], ["Land_Casere_P"], 20000];
[_co] spawn {
	private _com = _this select 0;
	private _timer = 0;
	for "_i" from 0 to 1 step 0 do {
		if(_timer > 2) exitWith {};
		_timer = _timer + 1;
		{
			playSound3D ["ALF_Client2\sounds\pompier_alarm.ogg", _x, false, _x modelToWorld [0,0,0], 1, 1, 150];
		} forEach _com;
		uiSleep 27;
	};
};
