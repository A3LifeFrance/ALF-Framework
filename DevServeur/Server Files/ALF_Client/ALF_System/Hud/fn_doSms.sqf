/*
	fn_doSms.sqf
	ALF Team

	["Nom/Numéro", "Message ..."] call ALF_fnc_doSms;
*/

disableSerialization;
params ["_title", "_message"];

if !(alive player) exitWith {};
if (player getVariable ["ReviveMedic", false]) exitWith {};

for "_i" from 0 to 1 step 0 do {
	if(!message1_smsactive) exitwith {
		21 cutRsc ["RSC_DOSMS1","PLAIN"];
		_POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOSMS1",displayNull];
		message1_smsactive = true;
		_POPUP = _POPUPCLASS1 displayCtrl 1333311;
		_POPUP2 = _POPUPCLASS1 displayCtrl 133331;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		sleep 6;
		_blah = 20;
		while{_blah > 0} do {
			_pos = ctrlPosition _POPUP;
			_pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message1_smsactive = false;
	};

	if(!message2_smsactive) exitwith {
		22 cutRsc ["RSC_DOSMS2","PLAIN"];
		_POPUPCLASS2 = uiNameSpace getVariable ["RSC_DOSMS2",displayNull];
		message2_smsactive = true;
		_POPUP = _POPUPCLASS2 displayCtrl 1333321;
		_POPUP2 = _POPUPCLASS2 displayCtrl 133332;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		sleep 6;
		_blah = 20;
		while{_blah > 0} do {
			_pos = ctrlPosition _POPUP;
			_pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message2_smsactive = false;
	};

	if(!message3_smsactive) exitwith {
		23 cutRsc ["RSC_DOSMS3","PLAIN"];
		_POPUPCLASS3 = uiNameSpace getVariable ["RSC_DOSMS3",displayNull];
		message3_smsactive = true;
		_POPUP = _POPUPCLASS3 displayCtrl 1333331;
		_POPUP2 = _POPUPCLASS3 displayCtrl 133333;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		sleep 6;
		_blah = 20;
		while{_blah > 0} do {
			_pos = ctrlPosition _POPUP;
			_pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message3_smsactive = false;
	};
	if(!message4_smsactive) exitwith {
		24 cutRsc ["RSC_DOSMS4","PLAIN"];
		_POPUPCLASS4 = uiNameSpace getVariable ["RSC_DOSMS4",displayNull];
		message4_smsactive = true;
		_POPUP = _POPUPCLASS4 displayCtrl 1333341;
		_POPUP2 = _POPUPCLASS4 displayCtrl 133334;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		sleep 6;
		_blah = 20;
		while{_blah > 0} do {
			_pos = ctrlPosition _POPUP;
			_pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message4_smsactive = false;
	};
	sleep 0.05;
};
