/*
	fn_doGps.sqf
	ALF Team & Critical Gaming

	["Titre", "Distance" ,"Message"] call doGps;
*/

disableSerialization;

params[
	["_image","",[""]],
	["_distance","",[""]],
	["_texte","",[""]]
];
if(_image isEqualTo "" OR {_distance isEqualTo ""} OR {_texte isEqualTo ""}) exitWith {};

private _png = "";
switch (_image) do {
	case "D" : {_png = "\ALF_Client2\textures\AutoEcole\d.paa"};
	case "DT" : {_png = "\ALF_Client2\textures\AutoEcole\dt.paa"};
	case "G" : {_png = "\ALF_Client2\textures\AutoEcole\g.paa"};
	case "RP" : {_png = "\ALF_Client2\textures\AutoEcole\rp.paa"};
	case "TD" : {_png = "\ALF_Client2\textures\AutoEcole\td.paa"};
};

1 cutRsc ["RSC_DOGPS","PLAIN"];
private _POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOGPS",displayNull];
private _POPUP = _POPUPCLASS1 displayCtrl 13450;
_POPUP ctrlSetStructuredText parseText format["<img align='center' size='7' image='%1'/><br/><t align='center' shadow='1' size='4'>%2</t><br/><t align='center' shadow='1' size='1.2'>%3</t>",_png ,_distance ,_texte];
