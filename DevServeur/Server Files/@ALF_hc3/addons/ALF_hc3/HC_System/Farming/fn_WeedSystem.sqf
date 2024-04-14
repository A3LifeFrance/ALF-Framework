/*
	This file is for Nanou's HeadlessClient.
*/
params [
	["_object",objNull,[objNull]],
	["_speed",1,[0]]
];
private _nObject = nearestObject [_object, "Land_model_1"];
if (isNull _nObject || {isNull _object}) exitWith {};

//private _c = {_x getVariable ["CopService",false]} count playableUnits;
//if(_c <= 5) exitWith {["INFO", "Il n'y a pas assez de Gendarme en service.", "warning"] remoteExec ["ALF_fnc_doMsg",remoteExecutedOwner];};

["ALF_Graine_W",false] remoteExec ["life_fnc_handleItem",remoteExecutedOwner];

_object animateSource ["et_1_source",0,true];

private _count = 0;
private _pure = 0;
for "_i" from 0 to 1 step 0 do {
	if(_count > 50 && {_object animationSourcePhase "et_1_source" isEqualTo 0} && {_object animationSourcePhase "et_2_source" isEqualTo 1} && {_object animationSourcePhase "et_3_source" isEqualTo 1} && {_object animationSourcePhase "et_4_source" isEqualTo 1}) then {
		_object animateSource ["et_1_source",1,true];
		_object animateSource ["et_2_source",0,true];
	};
	if(_count > 100 && {_object animationSourcePhase "et_1_source" isEqualTo 1} && {_object animationSourcePhase "et_2_source" isEqualTo 0} && {_object animationSourcePhase "et_3_source" isEqualTo 1} && {_object animationSourcePhase "et_4_source" isEqualTo 1}) then {
		_object animateSource ["et_2_source",1,true];
		_object animateSource ["et_3_source",0,true];
	};
	if(_count > 150 && {_object animationSourcePhase "et_1_source" isEqualTo 1} && {_object animationSourcePhase "et_2_source" isEqualTo 1} && {_object animationSourcePhase "et_3_source" isEqualTo 0} && {_object animationSourcePhase "et_4_source" isEqualTo 1}) exitWith {
		_object animateSource ["et_3_source",1,true];
		_object animateSource ["et_4_source",0,true];
	};
	private _vitesse = 1;
	if(_nObject animationSourcePhase "ventilation_source" isEqualTo 0) then {
		_vitesse = _vitesse + 0.4;
		_pure = _pure + 1;
	};
	if(_nObject animationSourcePhase "light_source" isEqualTo 0) then {
		_vitesse = _vitesse + 0.3;
		_pure = _pure + 1;
	};
	_count = _count + _vitesse;
	_object setVariable ["pure",_pure];
	uiSleep _speed;
};
