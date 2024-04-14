/*
	Author : ALF - Adam
*/

private _machine = _this select 0;
private _unit = _this select 1;
private _mode = _this select 2;
private _coins = 0;

if (_mode isEqualTo 0) then {
	_coins = _machine getVariable ["money",0];
	_machine setVariable ["money",0];
	if (_coins < 1) exitWith {["MACHINE", "Le stock de la machine est vide.", "danger"] remoteExec ["ALF_fnc_doMsg",_unit];};
} else {
	_coins = _machine getVariable ["coins",0];
	_machine setVariable ["coins",0];
	_machine animate ["Piece", 0];
	if (_coins > 100000) then {
		[name _unit,getPlayerUID _unit,"CASINO",format["A récupéré %1€ en cash | CASH = %2€",_coins,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
};

if (_coins < 1) exitWith {};
["MACHINE", format["Vous avez récupéré %1€ en liquide.",_coins], "success"] remoteExec ["ALF_fnc_doMsg",_unit];
[_coins] remoteExecCall ["ALF_fnc_returnCoins",_unit];