#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_keyGiveDef.sqf
	Author: ALF Dev Team
*/
disableSerialization;

_dialog = findDisplay 123450;
_list = _dialog displayCtrl 123457;

_sel = lbCurSel _list;
if((_list lbData _sel) isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectVehicle";};
_index = (parseNumber(_list lbData _sel));
_vehicle = life_vehicles select _index;

_unit = cursorObject;
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {};
if!(_unit isKindOf "Man") exitWith {};
if(!isPlayer _unit) exitWith {};
if(!alive _unit) exitWith {};

if (typeOf(_vehicle) isEqualTo "V_ALF_Camion_Poubelle") exitWith {["Erreur","Tu ne peux pas donner un véhicule de service.","warning"] spawn ALF_fnc_doMsg;};

if !(_vehicle isKindOf "House") then {
	if ((_vehicle getVariable ["business_veh",""]) isEqualTo "") then {

		private _owners = _vehicle getVariable "vehicle_info_owners";
		if (!((getPlayerUID player) isEqualTo _owners)) exitWith {["Erreur", "Tu n'es pas le proprietaire du vehicule.", "warning"] spawn ALF_fnc_doMsg;};

		private _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

		private _action = [format["Es-tu certain de vouloir donner definitivement le %1 ?",_name],"Vehicule","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

		life_vehicles deleteAt _index;
		closeDialog 0;

		["INFO", format["Tu viens de donner définitivement les clés de : %1",_name],"success"] spawn ALF_fnc_doMsg;

		[0,_vehicle,_unit,player] remoteExec ["HC_fnc_keyGiveDef",HC2_Life];
		["INFO", format["On t'a donné définitivement les clés de : %1",_name], "success"] remoteExec ["ALF_fnc_doMsg",_unit];
	} else {
		if ((b_1 || b_13) && ((player getVariable ["isEmployed",""]) isEqualTo ((_vehicle getVariable ["business_veh",""]) select 0))) then {
			private _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

			private _action = [format["Es-tu certain de vouloir donner definitivement le %1 ?",_name],"Vehicule","OUI","NON"] call BIS_fnc_guiMessage;
			if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};

			life_vehicles deleteAt _index;
			closeDialog 0;

			["INFO", format["Tu viens de donner définitivement les clés de : %1",_name],"success"] spawn ALF_fnc_doMsg;

			[0,_vehicle,_unit,player] remoteExec ["HC_fnc_keyGiveDef",HC2_Life];
			["INFO", format["On t'a donné définitivement les clés de : %1",_name], "success"] remoteExec ["ALF_fnc_doMsg",_unit];
		} else {
			["Erreur","Impossible de donner ce véhicule d'entreprise.","warning"] spawn ALF_fnc_doMsg;
		};
	};
} else {
	_index = life_houses find (str(getPosATL _vehicle));
	if (_index isEqualTo -1) exitWith {["ERREUR","Vous n'êtes pas le propriétaire de ce bien.","warning"] spawn ALF_fnc_doMsg;};

	private _action = ["Es-tu certain de vouloir donner definitivement ce bien ?","Bien","OUI","NON"] call BIS_fnc_guiMessage;
	if (!_action) exitWith {["INFO","Annulation..","warning"] spawn ALF_fnc_doMsg;};
	
	life_houses deleteAt _index;
	
	[1,_vehicle,_unit,player] remoteExec ["HC_fnc_keyGiveDef",HC2_Life];
};