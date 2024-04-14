/*
	File: fn_keyGiveDef.sqf
	Author: ALF Dev Team
	0 = veh
	1 = house
*/
private _mode = _this select 0;
private _obj = _this select 1;
private _unit = _this select 2;
private _player = _this select 3;
private _uid = getPlayerUID _unit;
private _name = getText(configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName");

switch (_mode) do {
	case 0 : {
		private _var = _obj getVariable["dbInfo",[]];
		if(count _var isEqualTo 0) exitWith {diag_log "fn_keyGiveDef : exit #1";};
		private _plate = _var select 1;
		_plate = [_plate] call HC_fnc_mresArray;
		
		private _check = format["SELECT id FROM vehicles WHERE plate='%1'",_plate];
		private _result = [_check,2] call HC_fnc_asyncCall;
		if(count _result isEqualTo 0) exitWith {diag_log "fn_keyGiveDef : exit #2";};
		
		private _vid = _result select 0;
		
		_obj setVariable ["vehicle_info_owners",(getPlayerUID _unit),true];
		private _vinfo = _obj getVariable ["dbInfo",[]];
		_vinfo set[0,_uid];
		_obj setVariable ["dbInfo",_vinfo];
		
		private _type = switch(true) do {
			case (_obj isKindOf "Car"): {"Car"};
			case (_obj isKindOf "Air"): {"Air"};
			case (_obj isKindOf "Ship"): {"Ship"};
		};
		
		[format["UPDATE vehicles SET pid='%1', type='%3', insure='0', insurecount='0' WHERE id='%2'",_uid,_vid,_type],1] call HC_fnc_asyncCall;
		[format["DELETE FROM keysTime WHERE mode='0' AND idobj='%1'",_vid],1] call HC_fnc_asyncCall;
		
		[name _player,getPlayerUID _player,"VEHICULE",format["vient de donner le véhicule %1 à %2 (%3).",_vid,name _unit,getPlayerUID _unit]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[name _unit,getPlayerUID _unit,"VEHICULE",format["vient de recevoir le véhicule %1 de %2 (%3).",_vid,name _player,getPlayerUID _player]] remoteExec ["HC_fnc_logIt",HC3_Life];

		[_obj,_unit] remoteExecCAll ["TON_fnc_clientGetKey",_unit];
	};
	case 1 : {
		private _hid = _obj getVariable ["house_id",-1];
		if(_hid isEqualTo -1) exitWith {diag_log "fn_keyGiveDef : exit #3";};
		
		private _query = format["SELECT * FROM houses WHERE pid='%1'",_uid];
		private _queryResult = [_query,2] call HC_fnc_asyncCall;
		if (count(_queryResult) isEqualTo 4) exitWith {["Maison","Cette personne a déjà le nombre maximum de bien.","success"] remoteExec ["ALF_fnc_doMsg",_player];};
		
		_query = format["UPDATE houses SET pid='%1' WHERE id='%2'",_uid,_hid];
		[_query,1] call HC_fnc_asyncCall;

		[_obj,_unit] remoteExecCAll ["TON_fnc_clientGetKey",_unit];

		["Maison", format["Tu as recu définitivement les clés de : %1. La Préfecture peut mettre quelques heures a finaliser vos papiers.",_name],"success"] remoteExec ["ALF_fnc_doMsg",_unit];
		["Maison", format["Tu as donné définitivement les clés de : %1. La Préfecture peut mettre quelques heures a finaliser les papiers.",_name],"success"] remoteExec ["ALF_fnc_doMsg",_player];
	};
};
