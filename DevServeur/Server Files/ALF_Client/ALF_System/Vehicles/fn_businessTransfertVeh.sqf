/*
  Name: ALF_fnc_businessTransfertVeh

  Author: ALF - Adam

  Arguments:
    <none>

  Return Value:
    <none>

  Example:
    [] spawn ALF_fnc_businessTransfertVeh
*/

disableSerialization;

if (player getVariable ["isEmployed",""] isEqualTo "") exitWith {};

if(lbCurSel 2802 isEqualTo -1) exitWith {};
private _vid = lbValue[2802,(lbCurSel 2802)];

private _price = 20000;
if(b_1) then {_price = 1000;};

private _action = [format["Veux-tu transferer ce vehicule dans l'entreprise ? Le montant du transfert est de %1 €.", _price],"Garage","OUI","NON"] call BIS_fnc_guiMessage;

if (_action) then {
	closeDialog 0;
	
	private _building = objNull;
	{
		if (((_x getVariable ["business",["","",""]]) select 2) isEqualTo (player getVariable ["isEmployed",""])) exitWith {
			_building = _x;
		};
	} forEach ALF_allBusinesss;

	if (isNull _building) exitWith {};
	
	private _exit = false;
	if (_price > life_cash) then {
		private _handle = [_price,false] call ALF_fnc_handleCB;
		if (_handle) exitWith {_exit = true;};
	} else {
		life_cash = life_cash - _price;
	};
	if (_exit) exitWith {};

	private _var = _building getVariable ["business",[]];
	if(count _var isEqualTo 0) exitWith {};
	private _owner = _var select 0;
	private _siretstr = _var select 2;

	[_vid,(getPlayerUID player),_owner,_siretstr] remoteExecCall ["HC_fnc_vehicleTransfert",HC2_life];
};