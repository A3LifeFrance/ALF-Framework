/*
	File: fn_vehicleCreate.sqf
	Author: ALF TEAM
*/
private _uid = _this select 0;
private _vehicle = _this select 1;
private _siret = _this select 2;
private _unit = _this select 3;
private _texture = _this select 4;

//Error checks
if(_uid isEqualTo "" OR {isNull _vehicle}) exitWith {};
if(!alive _vehicle) exitWith {};
private _className = typeOf _vehicle;

private _peinture = [];
if (_texture != "") then {
	_texture = (_texture splitString "\") joinString "\\";
	private _material = (((getObjectMaterials _vehicle) select 0) splitString "\") joinString "\\";
	_peinture = [[_texture,_material]] call HC_fnc_mresArray;
};

private _letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
private _numbers = ["0","1","2","3","4","5","6","7","8","9"];
private _ps1 = format ["%1", "-"];
private _ps2 = format ["%1", "-"];
private _pl1 = format ["%1", _letters call bis_fnc_selectrandom];
private _pl2 = format ["%1", _letters call bis_fnc_selectrandom];
private _pl3 = format ["%1", _letters call bis_fnc_selectrandom];
private _pl4 = format ["%1", _letters call bis_fnc_selectrandom];
private _pn1 = format ["%1", _numbers call bis_fnc_selectrandom];
private _pn2 = format ["%1", _numbers call bis_fnc_selectrandom];
private _pn3 = format ["%1", _numbers call bis_fnc_selectrandom];
private _pfinal = [_pl1, _pl2, _ps1, _pn1, _pn2, _pn3, _ps2, _pl3, _pl4];
private _plaquefinal = format["""[`%1`,`%2`,`%3`,`%4`,`%5`,`%6`,`%7`,`%8`,`%9`]""",_pl1,_pl2,_ps1,_pn1,_pn2,_pn3,_ps2,_pl3,_pl4];
private _queryplate = format["SELECT plate FROM vehicles WHERE plate='%1'",_plaquefinal];
private _plateresult = [_queryplate,2] call HC_fnc_asyncCall;

if((count _plateresult) isEqualTo 0) then {
	private _querydispo = format["SELECT dispo FROM shop WHERE classname='%1'",_className];
	private _disporesult = [_querydispo,2] call HC_fnc_asyncCall;
	private _dispo = _disporesult select 0;
	private _newdispo = _dispo - 1;
	if(_newdispo < 0) exitWith {
		deleteVehicle _vehicle;
		["INFO","Erreur dans le système, le véhicule n'était plus disponible.","danger"] remoteExec ["ALF_fnc_doMsg",_unit];
	};
	private _query = format["UPDATE shop SET dispo='%1' WHERE classname='%2'",_newdispo,_className];
	[_query,1] call HC_fnc_asyncCall;

	[_uid,_siret,_className,_pfinal,_peinture] call HC_fnc_insertVehicle;

	private _insure = 0;
	_vehicle setVariable ["dbInfo",[_uid,_pfinal,_insure,0,0]];
	_vehicle setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 0]];
	_vehicle setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 1]];
	_vehicle setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 3]];
	_vehicle setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 4]];
	_vehicle setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 5]];
	_vehicle setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 7]];
	_vehicle setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 8]];
} else {
	[_uid,_vehicle,_siret,_unit,_texture] call HC_fnc_vehicleCreateBusiness;
};
