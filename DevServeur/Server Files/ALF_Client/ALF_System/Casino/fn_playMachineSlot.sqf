/*
	Author : ALF - Adam
*/

private _machine = _this select 0;
private _mise = _this select 1;
if (isNull _machine || {isNil "_machine"}) exitWith {hint "exit playMachineSlot : #1";};

if ((time - life_action_delay) < 2) exitWith {["ERREUR", "Veuillez patienter quelques secondes avant de re-jouer.", "danger"] spawn ALF_fnc_doMSG;};
life_action_delay = time;

if (life_cash < _mise) exitWith {["ERREUR", format["Vous n'avez l'argent suffisant pour miser %1€.",_mise], "danger"] spawn ALF_fnc_doMSG;};
life_cash = life_cash - _mise;

[_machine,_mise,player] remoteExec ["HC_fnc_playSlotMachine",HC2_Life];