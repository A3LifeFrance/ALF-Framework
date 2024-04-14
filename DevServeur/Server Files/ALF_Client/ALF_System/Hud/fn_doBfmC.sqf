/*
	fn_doBfmO.sqf
*/
disableSerialization;

params[
	["_nom","",[""]],
	["_number","",[""]],
	["_txt","",[""]]
];

if !(alive player) exitWith {};
if (player getVariable ["ReviveMedic", false]) exitWith {};
if (_nom isEqualTo "" OR {_number isEqualTo ""} OR {_txt isEqualTo ""}) exitWith {};
if (isNil "messagebfm_active") exitWith {};

if(_number isEqualTo "0") then {
	_number = "**********";
};

for "_i" from 0 to 1 step 0 do {
	if(!messagebfm_active) exitwith {
		12 cutRsc ["RSC_BFMC","PLAIN"];
		private _POPUPCLASS1 = uiNameSpace getVariable ["RSC_BFMC",displayNull];
		messagebfm_active = true;
		private _POPUP1 = _POPUPCLASS1 displayCtrl 14570;
		private _POPUP2 = _POPUPCLASS1 displayCtrl 14571;
		private _POPUP3 = _POPUPCLASS1 displayCtrl 14572;

		_POPUP1 ctrlSetStructuredText parseText format["<t align='left' style='16' color='#000000' size='1.2'>%1</t>",_nom];
		_POPUP2 ctrlSetStructuredText parseText format["<t align='left' style='16' color='#000000' size='1.2'>%1</t>",_number];
		_POPUP3 ctrlSetStructuredText parseText format["<t align='left' style='16' color='#000000' size='1'>%1</t>",_txt];

		uiSleep 30;
		messagebfm_active = false;
	};
	uiSleep 0.1;
};
