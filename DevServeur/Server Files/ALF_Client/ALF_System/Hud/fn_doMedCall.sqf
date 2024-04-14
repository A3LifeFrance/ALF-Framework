/*
	fn_DOMEDCall.sqf
	ALF Team

	["Nom/Numéro", "Message ..."] call ALF_fnc_DOMEDCALL;
*/

disableSerialization;

params[
	["_title","",[""]],
	["_message","",[""]]
];

if !(alive player) exitWith {};
if (player getVariable ["ReviveMedic", false]) exitWith {};
if (_title isEqualTo "" OR {_message isEqualTo ""}) exitWith {};
if (isNil "message1_copactive" OR {isNil "message2_copactive"} OR {isNil "message3_copactive"} OR {isNil "message4_copactive"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
	if(!message1_copactive) exitwith {
		21 cutRsc ["RSC_DOMEDCALL1","PLAIN"];
		private _POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOMEDCALL1",displayNull];
		message1_copactive = true;
		private _POPUP = _POPUPCLASS1 displayCtrl 1693311;
		private _POPUP2 = _POPUPCLASS1 displayCtrl 169331;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message1_copactive = false;
	};

	if(!message2_copactive) exitwith {
		22 cutRsc ["RSC_DOMEDCALL2","PLAIN"];
		private _POPUPCLASS2 = uiNameSpace getVariable ["RSC_DOMEDCALL2",displayNull];
		message2_copactive = true;
		private _POPUP = _POPUPCLASS2 displayCtrl 1693321;
		private _POPUP2 = _POPUPCLASS2 displayCtrl 169332;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message2_copactive = false;
	};

	if(!message3_copactive) exitwith {
		23 cutRsc ["RSC_DOMEDCALL3","PLAIN"];
		private _POPUPCLASS3 = uiNameSpace getVariable ["RSC_DOMEDCALL3",displayNull];
		message3_copactive = true;
		private _POPUP = _POPUPCLASS3 displayCtrl 1693331;
		private _POPUP2 = _POPUPCLASS3 displayCtrl 169333;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message3_copactive = false;
	};
	if(!message4_copactive) exitwith {
		24 cutRsc ["RSC_DOMEDCALL4","PLAIN"];
		private _POPUPCLASS4 = uiNameSpace getVariable ["RSC_DOMEDCALL4",displayNull];
		message4_copactive = true;
		private _POPUP = _POPUPCLASS4 displayCtrl 1693341;
		private _POPUP2 = _POPUPCLASS4 displayCtrl 169334;
		_POPUP ctrlSetStructuredText parseText format["<t color='#ffffff'><t size='0.9'>%1</t><br/><t size='1'>%2</t>",_title, _message];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [_pos select 0, (_pos select 1) + 0.1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [_pos2 select 0, (_pos2 select 1) + 0.1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message4_copactive = false;
	};
	uisleep 0.05;
};
