/*
	fn_doBfmCrime.sqf
*/
disableSerialization;

params[
	["_txt1","",[""]]
];

if !(alive player) exitWith {};
if (player getVariable ["ReviveMedic", false]) exitWith {};
if (_txt1 isEqualTo "") exitWith {};
if !(license_bfmCrime) exitWith {};
if (isNil "messagebfm_active") exitWith {};

for "_i" from 0 to 1 step 0 do {
	if(!messagebfm_active) exitwith {
		12 cutRsc ["RSC_BFMO","PLAIN"];
		private _POPUPCLASS1 = uiNameSpace getVariable ["RSC_BFMO",displayNull];
		messagebfm_active = true;
		private _POPUP1 = _POPUPCLASS1 displayCtrl 14580;
		private _POPUP2 = _POPUPCLASS1 displayCtrl 14581;

		_POPUP1 ctrlSetStructuredText parseText "<t align='center' style='16' color='#000000' size='1.2'>DeepNews</t>";
		_POPUP2 ctrlSetStructuredText parseText format["<t align='left' style='16' color='#000000' size='1'>%1</t>",_txt1];

		uiSleep 30;
		messagebfm_active = false;
	};
	uiSleep 0.1;
};
