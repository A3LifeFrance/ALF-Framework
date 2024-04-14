/*
	File: fn_updateRope.sqf
	Author: ALF Team
*/
if !(hasInterface) exitWith {};

params [
	["_rope",objNull,[objNull]]
];

{
	_x setObjectTexture [0, ""];
	_x setObjectTexture [1, "\ALF_Batiments\ALF_Station\proxies\data\Rope_Pompier_CO.paa"];
	_x setObjectTexture [2, ""];
} forEach ((_rope nearObjects ["ropesegment", 100]) + (_rope nearObjects ["rope", 100]));