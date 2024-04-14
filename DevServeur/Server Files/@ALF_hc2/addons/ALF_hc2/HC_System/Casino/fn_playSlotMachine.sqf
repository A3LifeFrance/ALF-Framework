/*
	Author : ALF - Adam
*/

private _machine = _this select 0;
private _mise = _this select 1;
private _unit = _this select 2;
if (isNull _machine || {isNil "_machine"}) exitWith {};
if (_mise < 1) exitWith {};

private _isOn = _machine getVariable ["isOn",false];
if (_isOn) exitWith {[_mise] remoteExecCall ["ALF_fnc_returnCoins",_unit];};

private _param = _machine getVariable ["param_machine",[false,60,39,25,20,10]]; // param de la machine
if !(_param select 0) exitWith {["ERREUR", "La machine est éteinte, appellez un croupier.", "danger"] remoteExec ["ALF_fnc_doMsg",_unit]; [_mise] remoteExecCall ["ALF_fnc_returnCoins",_unit];};

_machine setVariable ["isOn",true];

private _chance = 0;
private _gain = 0;
switch (_mise) do {
	case 100 : {
		_chance = _param select 2;
		_gain = _mise * 2;
	};
	case 1000 : {
		_chance = _param select 3;
		_gain = _mise * 3;
	};
	case 10000 : {
		_chance = _param select 4;
		_gain = _mise * 4;
	};
	case 100000 : {
		_chance = _param select 5;
		_gain = _mise * 9;
	};
	default {
		_chance = _param select 1;
		_gain = _mise * 1;
	};
};

_machine animate ["Poignee", 1]; // Anim levier down
playSound3D ["ALF_Client2\sounds\active_levier.ogg", _machine, false, getPos _machine, 4, 1, 20];

uiSleep 1.5;

_machine animate ["Poignee", 0]; // Anim levier up

private _stateAnim1 = _machine animationPhase "Rouleau_1";
private _stateAnim2 = _machine animationPhase "Rouleau_2";
private _stateAnim3 = _machine animationPhase "Rouleau_3";

private _r1 = 0;
private _r2 = 0;
private _r3 = 0;
private _item1 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];
private _item2 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];
private _item3 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];

private _win = false;
private _rand = round(random(100));

if (_rand <= _chance) then { // Cout gagnant

	_win = true;
	
	while {true} do {
		// Conditions WIN
		if ((_item1 select 0) in ["Bar","7"] && {(_item2 select 0) in ["Bar","7"]} && {(_item3 select 0) in ["Bar","7"]}) exitWith {};
		if (_item1 isEqualTo _item2 && {_item2 isEqualTo _item3}) exitWith {};
		
		_item1 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];
		_item2 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];
		_item3 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];	
	};
	
} else { // Cout perdant

	_win = false;
	
	while {true} do {
		if !(((_item1 select 0) in ["Bar","7"] && {(_item2 select 0) in ["Bar","7"]} && {(_item3 select 0) in ["Bar","7"]}) || (_item1 isEqualTo _item2 && {_item2 isEqualTo _item3})) exitWith {};
		
		_item1 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];
		_item2 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];
		_item3 = selectRandom[["Bar",0.15],["Cloche",0.32],["7",0.52],["Diams",0.73],["treffle",0.94]];	
	};
};

if (_stateAnim1 < 5) then {
	_r1 = round(_stateAnim1) + selectRandom[3,4] + (_item1 select 1);
} else {
	_r1 = round(_stateAnim1) - selectRandom[3,4] + (_item1 select 1);
};
if (_stateAnim2 < 5) then {
	_r2 = round(_stateAnim2) + selectRandom[2,3] + (_item2 select 1);
} else {
	_r2 = round(_stateAnim2) - selectRandom[2,3] + (_item2 select 1);
};
if (_stateAnim3 < 5) then {
	_r3 = round(_stateAnim3) + selectRandom[1,2] + (_item3 select 1);
} else {
	_r3 = round(_stateAnim3) - selectRandom[1,2] + (_item3 select 1);
};

// Anim Rouleau
_machine animate ["Rouleau_1", _r1];
_machine animate ["Rouleau_2", _r2];
_machine animate ["Rouleau_3", _r3];

_r1 = round(_r1 * 10) / 10;
_r2 = round(_r2 * 10) / 10;
_r3 = round(_r3 * 10) / 10;

private _sound = createSoundSource ["suspens", position _machine, [], 0];

private _time = time;

waitUntil {
	sleep 0.2; 
	((time - _time) > 16) ||
	(!(_machine getVariable ["isOn", true]) ||
	(((round((_machine animationPhase "Rouleau_1") * 10) / 10) isEqualTo _r1) && ((round((_machine animationPhase "Rouleau_2") * 10) / 10) isEqualTo _r2) && ((round((_machine animationPhase "Rouleau_3") * 10) / 10) isEqualTo _r3)))
};

deleteVehicle _sound;

if(_unit getVariable["debug",false]) then {
	["ADMIN DEBUG", format["WIN : %1 (%6 > %7) | Item1 : %2 | Item2 : %3 | Item3 : %4 | GAIN : %5",_win,_item1,_item2,_item3,_gain,_rand,_chance], "danger"] remoteExec ["ALF_fnc_doMsg",_unit];
};

if (_win) then {
	// Anim piece
	_machine animate ["Jeclignote", 1]; 
	
	private _sound = objNull;
	if (_mise in [1000,10000,100000]) then {
		_sound = createSoundSource ["jackpot", position _machine, [], 0];
	} else {
		_sound = createSoundSource ["alarme_win", position _machine, [], 0];
		playSound3D ["ALF_Client2\sounds\coin_drop.ogg", _machine, false, getPos _machine, 3, 1, 20];
	};
	
	uiSleep 5;
	_machine animate ["Piece", 1]; 
	_machine animate ["Jeclignote", 0]; 

	deleteVehicle _sound;
	
	private _coin = _machine getVariable ["coins",0];
	_machine setVariable ["coins",_coin + _mise + _gain];
	
	private _money = _machine getVariable ["money",0]; // money stock de la machine
	_machine setVariable ["money",_money - (_gain / 1.5)];
} else {
	private _money = _machine getVariable ["money",0]; // money stock de la machine
	_machine setVariable ["money",_money + _mise];
};

_machine setVariable ["isOn",false];