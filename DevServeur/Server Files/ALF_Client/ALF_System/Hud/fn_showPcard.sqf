/*
	fn_showPcard.sqf
	ALF Team
*/

disableSerialization;
private["_name","_car","_truck","_points","_display","_text1","_text2","_text3","_text4","_text5","_text6"];
_name = _this select 0;
_car = _this select 1;
_truck = _this select 2;
_points = _this select 3;
_moto = _this select 4;
_boat = _this select 5;
_avion = _this select 6;

if(isNil "_name" OR {isNil "_car"} OR {isNil "_truck"} OR {isNil "_points"} OR {isNil "_moto"} OR {isNil "_boat"}) exitWith {};

1 cutRsc ["RSC_SHOWP","PLAIN"];
_display = uiNameSpace getVariable ["RSC_SHOWP",displayNull];
_text1 = _display displayCtrl 12340; //name
_text2 = _display displayCtrl 12341; //moto
_text3 = _display displayCtrl 12342; //car
_text4 = _display displayCtrl 12343; //truck
_text5 = _display displayCtrl 12344; //boat
_text6 = _display displayCtrl 12345; //avion
_text1 ctrlSetStructuredText parseText format["<t align='left' style='16' color='#000000' size='1'>%1</t>",_name];
if(_car) then {
	if(life_copLevel > 0) then {
		_text3 ctrlSetStructuredText parseText format["<t align='center' style='0' color='#000000' size='1'>OUI - %1 point(s)</t>",_points];
	} else {
		_text3 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>OUI</t>";
	};
} else {
	_text3 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>NON</t>";
};
if(_truck) then {
	_text4 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>OUI</t>";
} else {
	_text4 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>NON</t>";
};
if(_moto) then {
	_text2 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>OUI</t>";
} else {
	_text2 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>NON</t>";
};
if(_boat) then {
	_text5 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>OUI</t>";
} else {
	_text5 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>NON</t>";
};
if(_avion) then {
	_text6 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>OUI</t>";
} else {
	_text6 ctrlSetStructuredText parseText "<t align='center' style='0' color='#000000' size='1'>NON</t>";
};
