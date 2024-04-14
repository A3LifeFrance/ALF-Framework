/*
	fn_doXP.sqf
	ALF Team
*/

disableSerialization;
params ["_title"];

for "_i" from 0 to 1 step 0 do {
	if(!hud_xp_active) exitwith {
		21 cutRsc ["RSC_DOXP","PLAIN"];
		_POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOXP",displayNull];
		hud_xp_active = true;
		_POPUP = _POPUPCLASS1 displayCtrl 255465;
		_POPUP ctrlSetStructuredText parseText format["<t color='#FFFFFF' align='center' shadow='1'><t size='2.5'>+%1 XP</t>",_title];
		sleep 1;
		_blah = 20;
		while{_blah > 0} do {
			_pos = ctrlPosition _POPUP;
			_POPUP ctrlSetPosition [_pos select 0,(_pos select 1) - 0.05, _pos select 2, _pos select 3];
			_POPUP ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		hud_xp_active = false;
	};
	sleep 0.05;
};
