/*
	fetchKeys
*/
params[
	["_uid","",[""]]
];
if(_uid isEqualTo "") exitWith {};

private _keys = [format["SELECT idobj, mode FROM keysTime WHERE pid='%1'",_uid],2,true] call HC_fnc_asyncCall;

private _return = [];
{
	_x params[
		["_idobj",-1,[0]],
		["_mode",-1,[0]]
	];
	if !(_idobj isEqualTo -1 OR {_mode isEqualTo -1}) then {
		if(_mode isEqualTo 0) then {
			private _k = [format["SELECT plate FROM vehicles WHERE id='%1' AND active='1' AND alive='1'",_idobj],2] call HC_fnc_asyncCall;
			if(count _k > 0) then {
				private _new = [(_k select 0)] call HC_fnc_mresToArray;
				if(_new isEqualType "") then {_new = call compile format["%1", _new];};
				_return pushBack ([0,_new]);
			};
		} else {
			private _k = [format["SELECT pos FROM houses WHERE id='%1'",_idobj],2] call HC_fnc_asyncCall;
			if(count _k > 0) then {
				_return pushBack ([1,_k select 0]);
			};
		};
	};
} forEach _keys;

_return
