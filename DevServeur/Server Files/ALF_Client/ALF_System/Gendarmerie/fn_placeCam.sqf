params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {};

if ({_x isEqualTo "ALF_Camera_Discret"} count (magazines player) isEqualTo 0) exitWith {
	["ERREUR", "Il te faut une caméra portative discrète pour cela.", "danger"] spawn ALF_fnc_doMsg;
};
if (life_action_inUse) exitWith {
	["EREEUR", "Une action est déjà en cours.", "danger"] spawn ALF_fnc_doMsg;
};

life_action_inUse = true;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;

_pgText ctrlSetText format["%2 (1%1)...","%","Installation de la caméra"];
_progress progressSetPosition 0.01;

private _cP = 0.01;
for "_i" from 0 to 1 step 0 do {
	sleep 0.4;
	_cP = _cP + 0.035;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Installation de la caméra"];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};

life_action_inUse = false;

5 cutText ["","PLAIN"];
player playActionNow "stop";

if !(alive player) exitWith {};
if (player != vehicle player) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"];};
if ({_x isEqualTo "ALF_Camera_Discret"} count (magazines player) isEqualTo 0) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"];};

[player, _unit] remoteExecCall ["HC_fnc_placeCamera", HC_life];