/*
	fn_doMsg.sqf
	ALF Team & Critical Gaming

	["Titre", "Message ...", "success", false] call doMsg;
*/

disableSerialization;
params [
	["_title","",[""]], 
	["_message","",[""]], 
	["_getcolor","",[""]]
];

if !(alive player) exitWith {};
if (player getVariable ["ReviveMedic", false]) exitWith {};
if (_title isEqualTo "" OR {_message isEqualTo ""} OR {_getcolor isEqualTo ""}) exitWith {};
if (isNil "message1_active" OR {isNil "message2_active"} OR {isNil "message3_active"} OR {isNil "message4_active"} OR {isNil "message5_active"} OR {isNil "message6_active"}) exitWith {};

private _color = "";
switch (_getcolor) do {
	case "success": {
		_color = "#27AE60";
	};
	case "warning": {
		_color = "#FFCC00";
	};
	case "danger" : {
		_color = "#E74C3C";
	};
	default {
		_color = _getcolor;
	};
};

for "_i" from 0 to 1 step 0 do {
	if(!message1_active) exitwith {
		11 cutRsc ["RSC_DOMSG1","PLAIN"];
		private _POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOMSG1",displayNull];
		message1_active = true;
		private _POPUP = _POPUPCLASS1 displayCtrl 13371;
		private _POPUP2 = _POPUPCLASS1 displayCtrl 133711;
		_POPUP ctrlSetStructuredText parseText format["<t color='%3'><t size='0.85'>%1</t><br/><t size='0.9'>%2</t>",_title, _message, _color];
		uiSleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [(_pos2 select 0) - 0.1, _pos2 select 1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message1_active = false;
	};

	if(!message2_active) exitwith {
		12 cutRsc ["RSC_DOMSG2","PLAIN"];
		private _POPUPCLASS2 = uiNameSpace getVariable ["RSC_DOMSG2",displayNull];
		message2_active = true;
		private _POPUP = _POPUPCLASS2 displayCtrl 13372;
		private _POPUP2 = _POPUPCLASS2 displayCtrl 133721;
		_POPUP ctrlSetStructuredText parseText format["<t color='%3'><t size='0.85'>%1</t><br/><t size='0.9'>%2</t>",_title, _message, _color];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [(_pos2 select 0) - 0.1, _pos2 select 1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message2_active = false;
	};

	if(!message3_active) exitwith {
		13 cutRsc ["RSC_DOMSG3","PLAIN"];
		private _POPUPCLASS3 = uiNameSpace getVariable ["RSC_DOMSG3",displayNull];
		message3_active = true;
		private _POPUP = _POPUPCLASS3 displayCtrl 13373;
		private _POPUP2 = _POPUPCLASS3 displayCtrl 133731;
		_POPUP ctrlSetStructuredText parseText format["<t color='%3'><t size='0.85'>%1</t><br/><t size='0.9'>%2</t>",_title, _message, _color];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [(_pos2 select 0) - 0.1, _pos2 select 1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message3_active = false;
	};
	if(!message4_active) exitwith {
		14 cutRsc ["RSC_DOMSG4","PLAIN"];
		private _POPUPCLASS4 = uiNameSpace getVariable ["RSC_DOMSG4",displayNull];
		message4_active = true;
		private _POPUP = _POPUPCLASS4 displayCtrl 13374;
		private _POPUP2 = _POPUPCLASS4 displayCtrl 133741;
		_POPUP ctrlSetStructuredText parseText format["<t color='%3'><t size='0.85'>%1</t><br/><t size='0.9'>%2</t>",_title, _message, _color];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [(_pos2 select 0) - 0.1, _pos2 select 1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message4_active = false;
	};
	if(!message5_active) exitwith {
		15 cutRsc ["RSC_DOMSG5","PLAIN"];
		private _POPUPCLASS5 = uiNameSpace getVariable ["RSC_DOMSG5",displayNull];
		message5_active = true;
		private _POPUP = _POPUPCLASS5 displayCtrl 13375;
		private _POPUP2 = _POPUPCLASS5 displayCtrl 133751;
		_POPUP ctrlSetStructuredText parseText format["<t color='%3'><t size='0.85'>%1</t><br/><t size='0.9'>%2</t>",_title, _message, _color];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [(_pos2 select 0) - 0.1, _pos2 select 1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message5_active = false;
	};
	if(!message6_active) exitwith {
		16 cutRsc ["RSC_DOMSG6","PLAIN"];
		private _POPUPCLASS6 = uiNameSpace getVariable ["RSC_DOMSG6",displayNull];
		message6_active = true;
		private _POPUP = _POPUPCLASS6 displayCtrl 13376;
		private _POPUP2 = _POPUPCLASS6 displayCtrl 133761;
		_POPUP ctrlSetStructuredText parseText format["<t color='%3'><t size='0.85'>%1</t><br/><t size='0.9'>%2</t>",_title, _message, _color];
		uisleep 6;
		private _blah = 20;
		while{_blah > 0} do {
			private _pos = ctrlPosition _POPUP;
			private _pos2 = ctrlPosition _POPUP2;
			_POPUP ctrlSetPosition [(_pos select 0) - 0.1, _pos select 1, _pos select 2, _pos select 3];
			_POPUP2 ctrlSetPosition [(_pos2 select 0) - 0.1, _pos2 select 1, _pos2 select 2, _pos2 select 3];
			_POPUP ctrlCommit 0;
			_POPUP2 ctrlCommit 0;
			uisleep 0.05;
			_blah = _blah - 1;
		};
		message6_active = false;
	};
	uisleep 0.05;
};
