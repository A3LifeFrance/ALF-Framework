/*
  File: fn_cocaine.sqf
  ALF Team
*/
params [
	["_obj",objNull,[objNull]],
	["_mode",0,[0]],
	["_unit",objNull,[objNull]]
];
if(isNull _obj OR {isNull _unit}) exitWith {};

if(_obj getVariable ["wip",false]) exitWith {["INFO","La machine est déjà en cours d'utilisation.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

//private _c = {_x getVariable ["CopService",false]} count playableUnits;
//if(_c <= 5) exitWith {["INFO", "Il n'y a pas assez de Gendarme en service.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

private _var = _obj getVariable ["step",0];
switch (_var) do {
	case 0 : {
		if !("ALF_Cocaine_U" in (magazines _unit)) exitWith {["INFO","Tu n'as pas de pot.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
		["ALF_Cocaine_U",false] remoteExec ["life_fnc_handleItem",_unit];
		_obj setVariable ["wip",true];
		_obj animate ["b_1_source",1];
		_obj animate ["box_source",1];
		playSound3D ["ALF_Client2\sounds\wip.ogg", _obj, false, (_obj modelToWorld (_obj selectionPosition "action")), 5, 1, 135];
		uiSleep 15;
		_obj animate ["box_source",0];
		uiSleep 15;
		_obj setVariable ["wip",false];
		_obj setVariable ["step",1];
	};
	case 1 : {
		_obj setVariable ["wip",true];
		_obj animate ["b_2_source",1];
		_obj animate ["box_source",1];
		playSound3D ["ALF_Client2\sounds\wip.ogg", _obj, false, (_obj modelToWorld (_obj selectionPosition "action")), 5, 1, 135];
		uiSleep 15;
		_obj animate ["box_source",0];
		uiSleep 15;
		_obj setVariable ["wip",false];
		_obj setVariable ["step",2];
	};
	case 2 : {
		_obj setVariable ["wip",true];

		//Random Fire
		private _dice = random(10000);
		if(_dice > 10 && {_dice < 20}) exitWith {
			[_obj] remoteExec ["HC_fnc_cocaineInFire",HC_Life];
		};

		_obj animate ["b_3_source",1];
		_obj animate ["box_source",1];
		playSound3D ["ALF_Client2\sounds\wip.ogg", _obj, false, (_obj modelToWorld (_obj selectionPosition "action")), 5, 1, 135];
		uiSleep 15;
		_obj animate ["box_source",0];
		uiSleep 15;
		_obj setVariable ["wip",false];
		_obj setVariable ["step",3];
	};
	case 3 : {
		if !(_unit canAdd "ALF_Cocaine") exitWith {["INFO", "Tu n'as pas assez de place.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
		_obj setVariable ["wip",true];
		["ALF_Cocaine",true] remoteExec ["life_fnc_handleItem",_unit];
		[3,3] remoteExec ["ALF_fnc_addXP",_unit];
		[name _unit,getPlayerUID _unit,"COCAINE","vient de récupérer de la cocaine."] spawn HC_fnc_logIt;
		_obj animate ["b_1_source",0];
		_obj animate ["b_2_source",0];
		_obj animate ["b_3_source",0];
		_obj setVariable ["step",0];
		uiSleep 5;
		_obj setVariable ["wip",false];
	};
};
