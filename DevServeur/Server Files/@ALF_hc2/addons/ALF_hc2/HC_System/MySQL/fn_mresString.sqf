/*
	File: fn_mresString.sqf
*/
params [
	["_string","",[""]]
];
private _filter = "'/\`:|;,{}-""<>";

_string = toArray _string; //Blow it up to an array
_filter = toArray _filter; //Blow it up to an array

{
	if(_x in _filter) then {
		_string deleteAt _forEachIndex;
	};
} forEach _string;

toString _string;