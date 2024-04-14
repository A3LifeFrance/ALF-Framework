/*
	File: fn_businessGarageGlitch.sqf
*/
private _building = _this select 0;
private _var = _building getVariable ["Garage",objNull];
if !(isNull _var) exitWith {
	closeDialog 2800;
};
_building setVariable ["Garage",player,true];
private "_var2";
for "_i" from 0 to 1 step 0 do {
	if(isNull (findDisplay 2800)) exitWith {};
	_var2 = _building getVariable ["Garage",objNull]; 
	if !(_var2 isEqualTo player) exitWith {closeDialog 2800;};
	sleep 0.3;
};

_building setVariable ["Garage",objNull,true];
