/*
  File: fn_takeWeed.sqf
  ALF Nanou
*/
params[
	["_obj",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

if(_obj getVariable ["take",false]) exitWith {};
if !(_unit canAdd "ALF_Weed") exitWith {["Weed", "Tu n'as pas assez de place.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
_obj animateSource ["et_1_source",1,true];
_obj animateSource ["et_2_source",1,true];
_obj animateSource ["et_3_source",1,true];
_obj animateSource ["et_4_source",1,true];

private _pure = _obj getVariable ["pure",0];
switch (true) do {
	case (_pure < 100) : { ["ALF_Weed",true] remoteExec ["life_fnc_handleItem",_unit]; };
	case (_pure >= 100 && _pure < 160) : { ["ALF_Weed_2",true] remoteExec ["life_fnc_handleItem",_unit]; };
	case (_pure >= 160) : { ["ALF_Weed_3",true] remoteExec ["life_fnc_handleItem",_unit]; };
};

[_obj] spawn {
	params[
		["_obj",objNull,[objNull]]
	];
	uiSleep random(5);
	private _var = _obj getVariable ["take",false];
	if(_var) then {
		[name _unit,getPlayerUID _unit,"DUPLICATION","A tenté de dupliquer de la weed."] remoteExec ["HC_fnc_logIt",HC3_Life];
		["ALF_Weed",false] remoteExec ["life_fnc_handleItem",_unit];
	} else {
		[_obj] spawn {
			params[
				["_obj",objNull,[objNull]]
			];
			_obj setVariable ["take",true];
			uiSleep 60;
			_obj setVariable ["take",false];
		};
	};
};

[3,2] remoteExec ["ALF_fnc_addXP",_unit];