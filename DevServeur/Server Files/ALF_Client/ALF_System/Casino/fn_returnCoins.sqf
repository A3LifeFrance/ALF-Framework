/*
	Author : ALF - Adam
*/

private _gain = _this select 0;
if (_gain < 1) exitWith {};
life_action_delay = time;

life_cash = life_cash + _gain;