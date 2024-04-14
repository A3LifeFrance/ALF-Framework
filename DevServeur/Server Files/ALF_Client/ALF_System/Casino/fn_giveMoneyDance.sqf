/*
	Author : ALF - Adam
*/

private _bot = _this select 0;
if (isNull _bot || {isNil "_bot"}) exitWith {};

if ((time - life_action_delay) < 2) exitWith {["ERREUR", "Veuillez patienter quelques secondes.", "danger"] spawn ALF_fnc_doMSG;};
life_action_delay = time;

if (life_cash < 500) exitWith {["ERREUR", "Vous n'avez l'argent suffisant sur vous (500 €).", "danger"] spawn ALF_fnc_doMSG;};
life_cash = life_cash - 500;

[0,_bot] remoteExec ["HC_fnc_payerDance",HC2_Life];