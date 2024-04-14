#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
if((time - life_action_delay) < 0.5) exitWith {["INFO", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};
life_action_delay = time;

private _className = lbData[2302,(lbCurSel 2302)];
private _vIndex = lbValue[2302,(lbCurSel 2302)];
private _classNameLife = _className;
private _vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
private _purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"achat");

private _building = life_veh_shop select 3;
if(isNull _building) exitWith {["INFO", "Erreur dans le systeme.", "warning"] spawn ALF_fnc_doMsg;};

if(_purchasePrice < 0) exitWith {closeDialog 0;};

private _spawnPoint = life_veh_shop select 1;
private _nearVeh = _spawnPoint nearEntities [["Car","Air","Ship"],8];
if (count _nearVeh > 0) exitWith {["INFO", "Un véhicule gène le point de spawn.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};

private _var = _building getVariable ["business",[]];
private _capitalstr = _var select 3;
private _siretstr = _var select 2;
private _membres = _var select 5;
private _levelstr = _var select 6;
private _vehnumber = _var select 7;

if(_levelstr isEqualTo 0 && {_vehnumber > 5}) exitWith {["INFO", "Il faut agrandir le batiment si tu veux acheter un nouveau véhicule.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};

if(_capitalstr < _purchasePrice) exitWith {["INFO", "Tu n'as pas assez d'argent dans l'entreprise.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};

private _action = ["Es-tu certain de vouloir acheter ce vehicule pour ton entreprise?","Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

_capitalstr = _capitalstr - _purchasePrice;
_var set[3,_capitalstr];
_vehnumber = _vehnumber + 1;
_var set[7,_vehnumber];
_building setVariable ["business",_var,true];

[_siretstr,_capitalstr] remoteExec ["HC_fnc_capitalBusiness",HC2_life];

private _color = "";
if (M_CONFIG(getNumber,"LifeCfgVehicles",_className,"textures") isEqualTo 1) then {
	_color = lbData[2304,(lbCurSel 2304)];
};

["INFO", format["Merci d'avoir acheté chez nous. Détail de votre commande: %1 pour %2€",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText], "success"] spawn ALF_fnc_doMsg;

private _dir = life_veh_shop select 2;
private _vehicle = createVehicle [_className,_spawnPoint, [], 0, "NONE"];
waitUntil {sleep 0.3; !isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle setPos _spawnPoint;
_vehicle setVectorUp (surfaceNormal _spawnPoint);
_vehicle setDir _dir;
_vehicle lock 2;
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle addMagazineCargoGlobal ["ALF_Roue",1];
_vehicle setVariable ["vehicle_info_owners",getPlayerUID player,true];
_vehicle disableTIEquipment true;
_vehicle animateSource ["assu", 1, true];
_vehicle animateSource ["tracker", 1, true];
_vehicle allowDamage true;
_vehicle setVariable ["business_veh",[_siretstr],true];

if (_color != "") then {
	_vehicle setObjectTextureGlobal [0,_color];
};

private _um = [];
{
	_um pushBack (_x select 1);
} forEach _membres;

[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",(playableUnits select {(getPlayerUID _x) in _um})];

private _arr = missionNamespace getVariable [format["%1_KEYSB",_siretstr],[]];
_arr pushBack _vehicle;
_arr = _arr - [objNull];
missionNamespace setVariable[format["%1_KEYSB",_siretstr],_arr,true];

[(getPlayerUID player),_vehicle,_siretstr,player,_color] remoteExec ["HC_fnc_vehicleCreateBusiness",HC2_Life];
[name player,getPlayerUID player,"ENTREPRISE",format["A acheté %1 pour %2€.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText]] remoteExec ["HC_fnc_logIt",HC3_Life];

closeDialog 0;
