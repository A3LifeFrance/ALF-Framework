params [
	["_p",objNull,[objNull,[]]],
	["_m",-1,[0]]
];

if (isNull _p) exitWith {};
if (_p isEqualType []) exitWith {
	{
	  _x hideObjectGlobal true;
	} forEach _p;
};

switch (_m) do {
	case 0 : {_p hideObjectGlobal true;};
	case 1 : {_p hideObjectGlobal false;};
};