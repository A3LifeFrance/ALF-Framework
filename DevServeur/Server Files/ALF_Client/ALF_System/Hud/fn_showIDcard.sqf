/*
	fn_showIDcard.sqf
	ALF Team
*/
params [
	["_unit",objNull,[objNull]],
	["_name","",[""]]
];
disableSerialization;
_uid = getPlayerUID _unit;

1 cutRsc ["RSC_SHOWID","PLAIN"];
_display = uiNameSpace getVariable ["RSC_SHOWID",displayNull];
_text1 = _display displayCtrl 13460;
_text2 = _display displayCtrl 13461;
_text3 = _display displayCtrl 13462;
_text1 ctrlSetStructuredText parseText format["<t align='left' style='16' color='#000000' size='0.8'>%1</t>",_uid];
_text2 ctrlSetStructuredText parseText format["<t align='left' style='0' color='#000000' size='1.3'>%1</t>",_name];
_text3 ctrlSetStructuredText parseText format["<t align='right' style='16' color='#000000' size='1'>%1</t>",_uid];
