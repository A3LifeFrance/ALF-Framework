/*
	Author : ALF - Adam
*/

private _mode = _this select 0;
private _bot = _this select 1;
if (isNull _bot || {isNil "_bot"} || {isNil "_mode"}) exitWith {};

private _coin = _bot getVariable ["money",0];

if (_mode isEqualTo 0) then {
	_bot setVariable ["money",_coin + 500];
	
	if ((animationState _bot) != "Acts_Dance_02") then {
		//_bot enableSimulation true;
		[_bot, "Acts_Dance_02"] remoteExec ["switchMove", 0];
	};
} else {
	if (_coin < 1) exitWith {["DANCEUSE", "Je n'ai pas d'argent.", "danger"] remoteExec ["ALF_fnc_doMsg",remoteExecutedOwner];};
	[_coin] remoteExecCall ["ALF_fnc_returnCoins",remoteExecutedOwner];
	_bot setVariable ["money",0];
	["DANCEUSE", format["Vous avez récupéré %1 € en liquide.", _coin], "success"] remoteExec ["ALF_fnc_doMsg",remoteExecutedOwner];
};