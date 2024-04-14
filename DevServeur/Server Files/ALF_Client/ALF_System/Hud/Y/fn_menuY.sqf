#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_menuY.sqf
	Author: ALF Team
*/
private "_struct";
if(!dialog) then {createDialog "ymenu_dialog"};
disableSerialization;
private _display = findDisplay 123450;

_pmenupic = _display displayCtrl 123451;
_pmenubtn = _display displayCtrl 1234511;
_pmoney = _display displayCtrl 123452;
_pedit = _display displayCtrl 123453;
_pbtngive = _display displayCtrl 123454;
_plicense = _display displayCtrl 123455;

_kmenupic = _display displayCtrl 123456;
_kmenubtn = _display displayCtrl 1234561;
_klistbox = _display displayCtrl 123457;
_kgivebtn = _display displayCtrl 123458;
_kjeterbtn = _display displayCtrl 123459;

_gmenupic1 = _display displayCtrl 123460;
_gmenupic2 = _display displayCtrl 123461;
_gmenubtn = _display displayCtrl 1234601;
_gedit = _display displayCtrl 123462;
_gcreatebtn = _display displayCtrl 123463;
_glistbox = _display displayCtrl 123464;
_gname = _display displayCtrl 123465;
_gpic1 = _display displayCtrl 123466;
_gpic2 = _display displayCtrl 123467;
_gpic3 = _display displayCtrl 123468;
_gpic4 = _display displayCtrl 123469;
_gpic5 = _display displayCtrl 123470;
_gpic6 = _display displayCtrl 123471;
_gbtn1 = _display displayCtrl 123472;
_gbtn2 = _display displayCtrl 123473;
_gbtn3 = _display displayCtrl 123474;
_gbtn4 = _display displayCtrl 123475;
_gbtn5 = _display displayCtrl 123476;
_gbtn6 = _display displayCtrl 123477;

_pamenupic = _display displayCtrl 123478;
_pamenubtn = _display displayCtrl 1234781;
_pacheckbox = _display displayCtrl 123479;
_pafootslider = _display displayCtrl 123480;
_pafootedit = _display displayCtrl 123481;
_pacarslider = _display displayCtrl 123482;
_pacaredit = _display displayCtrl 123483;
_paairslider = _display displayCtrl 123484;
_paairedit = _display displayCtrl 123485;

_admin = _display displayCtrl 123486;
_bfm1 = _display displayCtrl 123487;
_bfm2 = _display displayCtrl 123488;
_bfm3 = _display displayCtrl 123489;
_a1 = _display displayCtrl 123490;
_a2 = _display displayCtrl 123491;
_a3 = _display displayCtrl 123492;
_a4 = _display displayCtrl 123493;
_a5 = _display displayCtrl 123494;
_a6 = _display displayCtrl 123495;
_a8 = _display displayCtrl 123541;
_a9 = _display displayCtrl 123542;
_a10 = _display displayCtrl 123543;
_a11 = _display displayCtrl 123544;
_a12 = _display displayCtrl 123545;
_a13 = _display displayCtrl 123546;
_a14 = _display displayCtrl 123547;
_a15 = _display displayCtrl 123548;
_a16 = _display displayCtrl 123549;
_a17 = _display displayCtrl 123550;
_a18 = _display displayCtrl 123551;
_a19 = _display displayCtrl 123552;
_a20 = _display displayCtrl 123553;
_a21 = _display displayCtrl 123554;
_a22 = _display displayCtrl 123555;
_a23 = _display displayCtrl 123556;
_a24 = _display displayCtrl 123557;
_a25 = _display displayCtrl 123558;
_a26 = _display displayCtrl 123559;
_a27 = _display displayCtrl 123560;
_adminmsg1 = _display displayCtrl 123538;
_adminmsg2 = _display displayCtrl 123539;
_adminmsg3 = _display displayCtrl 123540;
_tplui = _display displayCtrl 123533;
_god = _display displayCtrl 123534;
_execEdit = _display displayCtrl 123535;
_execBtn = _display displayCtrl 123536;

_kedit = _display displayCtrl 123496;
_kbtn = _display displayCtrl 123497;
_btnmag = _display displayCtrl 123537;

_admin ctrlShow false;
_bfm1 ctrlShow false;
_bfm2 ctrlShow false;
_bfm3 ctrlShow false;
_a1 ctrlShow false;
_a2 ctrlShow false;
_a3 ctrlShow false;
_a4 ctrlShow false;
_a5 ctrlShow false;
_a6 ctrlShow false;
_a8 ctrlShow false;
_a9 ctrlShow false;
_a10 ctrlShow false;
_a11 ctrlShow false;
_a12 ctrlShow false;
_a13 ctrlShow false;
_a14 ctrlShow false;
_a15 ctrlShow false;
_a16 ctrlShow false;
_a17 ctrlShow false;
_a18 ctrlShow false;
_a19 ctrlShow false;
_a20 ctrlShow false;
_a21 ctrlShow false;
_a22 ctrlShow false;
_a23 ctrlShow false;
_a24 ctrlShow false;
_a25 ctrlShow false;
_a26 ctrlShow false;
_a27 ctrlShow false;
_adminmsg1 ctrlShow false;
_adminmsg2 ctrlShow false;
_adminmsg3 ctrlShow false;
_tplui ctrlShow false;
_god ctrlShow false;
_execEdit ctrlShow false;
_execBtn ctrlShow false;

if !(alf_bouton_magique) then {
	_btnmag ctrlShow true;
} else {
	_btnmag ctrlShow false;
};

if(life_adminlevel >= 1) then { //BFM, ADMIN MAP, SPEC, FREEZE
	_bfm3 buttonSetAction "[] call ALF_fnc_bfmOfficiel;";

	if(alf_admin_btn) then {
		_admin ctrlSetText "DESACTIVER MAP ADMIN";
	} else {
		_admin ctrlSetText "ACTIVER MAP ADMIN";
	};

	lbClear _a1;
	{
		_a1 lbAdd format["%1",name _x];
		_a1 lbSetData [(lbSize _a1)-1,str(_x)];
	} forEach playableUnits;
	lbSort _a1;

	_a5 buttonSetAction "[] call ALF_fnc_adminSpec;";
	_a10 buttonSetAction "[] call ALF_fnc_actionFreeze;";
	
	_bfm1 ctrlShow true;
	_bfm2 ctrlShow true;
	_bfm3 ctrlShow true;
	_admin ctrlShow true;
	_a1 ctrlShow true;
	_a5 ctrlShow true;
	_a10 ctrlShow true;
};

if(life_adminlevel >= 2) then { //BFM, ADMIN MAP, SPEC, FREEZE + TP, INVI, HEAL OTHER, REVIVE
	_a2 buttonSetAction "[] call ALF_fnc_adminTP;";
	_a3 buttonSetAction "[] call ALF_fnc_adminTpHere;";
	_a4 buttonSetAction "[] call ALF_fnc_adminTP2;";
	_tplui buttonSetAction "[] call ALF_fnc_adminTP3;";
	_a12 buttonSetAction "private _target = call compile format [""%1"", lbData[123490,lbCurSel (123490)]];
							if (isNull _target) exitWith {};
							if !(_target getVariable [""ReviveMedic"",false]) exitWith {hint ""Cette personne n'est pas dans le coma.""};
							[] remoteExec [""ALF_fnc_adminRevived"",_target];
	";
	_a16 buttonSetAction "[] call ALF_fnc_actionSoinAdmin;";

	if(alf_admin_invi) then {
		_a6 ctrlSetText "INVI ON";
	} else {
		_a6 ctrlSetText "INVI OFF";
	};
	
	_a2 ctrlShow true;
	_a3 ctrlShow true;
	_a4 ctrlShow true;
	_a6 ctrlShow true;
	_a12 ctrlShow true;
	_a16 ctrlShow true;
	_tplui ctrlShow true;
};

if(life_adminlevel >= 3) then { //BFM, ADMIN MAP, SPEC, FREEZE + TP, INVI, HEAL OTHER, REVIVE + GODMOD, ADMIN MSG, ARSENAL, HEAL, DELETE CUR, DAMAGE CUR, REPAIR CUR
	_execBtn buttonSetAction "[] spawn (compile (ctrlText 123535));";
	
	_a8 buttonSetAction "life_hunger=100; life_thirst=100; player setDamage 0;";
	_a9 buttonSetAction "closeDialog 0; [""Open"",true] call BIS_fnc_arsenal;";
	_a13 buttonSetAction "if (isNull cursorobject) exitWith {hint ""Il n'y a rien en face de toi.""};
							[cursorobject] spawn {
								private _action = [format[""Es-tu certain de vouloir supprimer %1."", typeOf(_this select 0)],""ADMIN DELETE"",""OUI"",""NON""] call BIS_fnc_guiMessage;
								if (!_action) exitWith {}; deleteVehicle (_this select 0);
							};
	";
	_a14 buttonSetAction "if (isNull cursorobject) exitWith {hint ""Il n'y a rien en face de toi.""}; cursorobject setDamage 1;";
	_a15 buttonSetAction "if (isNull cursorobject) exitWith {hint ""Il n'y a rien en face de toi.""}; cursorobject setDamage 0;";

	_a17 buttonSetAction "private _f = ""test_EmptyObjectForFireBig"" createVehicle [0,0,0];
							_f setposATL (getPosATL Player);
							_f setVariable [""firealf"",100,true];
	";
	_a18 buttonSetAction "private _f = ""#particlesource"" createVehicle (getPosATL player); 
							_f setposATL (getPosATL Player);
							_f setParticleClass ""MediumDestructionFire""; 
	";
	_a19 buttonSetAction "private _f = ""#particlesource"" createVehicle (getPosATL player);
							_f setposATL (getPosATL Player);	
							_f setParticleClass ""BigDestructionSmoke""; 
	";
	_a20 buttonSetAction "private _f = ""#particlesource"" createVehicle (getPosATL player); 
	 						_f setposATL (getPosATL Player);
							_f setParticleClass ""MediumDestructionSmoke""; 
	";
	_a21 buttonSetAction "private _object = (nearestObjects[player, [""ALF_GrosFeuForet"",""ALF_MoyenFeuForet"",""test_EmptyObjectForFireBig""], 50]) select 0;
							deleteVehicle _object;
	";
	_a22 buttonSetAction "private _object = nearestObject [player, ""#particlesource""];
							deleteVehicle _object;
	";
	_a25 buttonSetAction "player moveInCargo cursortarget;";
	_a26 buttonSetAction "player action [""getOut"", (vehicle player)];";
	_a27 buttonSetAction "[] spawn ALF_fnc_adminCamera;";

	lbClear _adminmsg1;
	_adminmsg1 lbAdd "succes";
	_adminmsg1 lbAdd "warning";
	_adminmsg1 lbSetCurSel 0;
	_adminmsg3 buttonSetAction "[] call ALF_fnc_adminMSG;";

	if(isDamageAllowed player) then {
		_god ctrlSetText "GodMod OFF";
	} else {
		_god ctrlSetText "GodMod ON";
	};
	
	_execBtn ctrlShow true;
	_execEdit ctrlShow true;
	_a8 ctrlShow true;
	_a9 ctrlShow true;
	_a13 ctrlShow true;
	_a14 ctrlShow true;
	_a15 ctrlShow true;
	_a16 ctrlShow true;
	_a17 ctrlShow true;
	_a18 ctrlShow true;
	_a19 ctrlShow true;
	_a20 ctrlShow true;
	_a21 ctrlShow true;
	_a22 ctrlShow true;
	_a25 ctrlShow true;
	_a26 ctrlShow true;
	_a27 ctrlShow true;
	_adminmsg1 ctrlShow true;
	_adminmsg2 ctrlShow true;
	_adminmsg3 ctrlShow true;
	_god ctrlShow true;
};

_menu = uiNamespace getVariable "ymenu";
switch (_menu) do {
	case 0 : {
		//Btn Menu
		_pmenubtn ctrlShow false;
		_kmenubtn ctrlShow true;
		_gmenubtn ctrlShow true;
		//Player Menu
		_pmenupic ctrlShow true;
		_pmoney ctrlShow true;
		_pedit ctrlShow true;
		_pbtngive ctrlShow true;
		_plicense ctrlShow true;
		//Key Menu
		_kmenupic ctrlShow false;
		_klistbox ctrlShow false;
		_kgivebtn ctrlShow false;
		_kjeterbtn ctrlShow false;
		//Group Menu
		_gmenupic1 ctrlShow false;
		_gmenupic2 ctrlShow false;
		_gedit ctrlShow false;
		_gcreatebtn ctrlShow false;
		_glistbox ctrlShow false;
		_gname ctrlShow false;
		_gpic1 ctrlShow false;
		_gpic2 ctrlShow false;
		_gpic3 ctrlShow false;
		_gpic4 ctrlShow false;
		_gpic5 ctrlShow false;
		_gpic6 ctrlShow false;
		_gbtn1 ctrlShow false;
		_gbtn2 ctrlShow false;
		_gbtn3 ctrlShow false;
		_gbtn4 ctrlShow false;
		_gbtn5 ctrlShow false;
		_gbtn6 ctrlShow false;
		//Param Menu
		_pamenupic ctrlShow false;
		_pamenubtn ctrlShow true;
		_pacheckbox ctrlShow false;
		_pafootslider ctrlShow false;
		_pafootedit ctrlShow false;
		_pacarslider ctrlShow false;
		_pacaredit ctrlShow false;
		_paairslider ctrlShow false;
		_paairedit ctrlShow false;

		_kedit ctrlShow false;
		_kbtn ctrlShow false;

		_pmoney ctrlSetStructuredText parseText format["<t align='center' shadow='0' size='1.5px'>%1</t>",[life_cash] call life_fnc_numberText];
		_struct = "";
		if(life_donor) then {
			_struct = _struct + format["Premium - %1 jours<br/>",life_duredon];
		};
		if (life_penit > 0) then {
			switch (life_penit) do {
				case 1 : {_struct = _struct + format["%1<br/>","Surveillant Stagiaire"]};
				case 2 : {_struct = _struct + format["%1<br/>","Surveillant Titulaire"]};
				case 3 : {_struct = _struct + format["%1<br/>","Surveillant Principal"]};
				case 4 : {_struct = _struct + format["%1<br/>","Surveillant Brigadier"]};
				case 5 : {_struct = _struct + format["%1<br/>","Premier Surveillant"]};
				case 6 : {_struct = _struct + format["%1<br/>","Major de Prison"]};
				case 7 : {_struct = _struct + format["%1<br/>","Lieutenant de Prison"]};
				case 8 : {_struct = _struct + format["%1<br/>","Capitaine de Prison"]};
				case 9 : {_struct = _struct + format["%1<br/>","Commandant de Prison"]};
				case 10 : {_struct = _struct + format["%1<br/>","Directeur de Prison"]};
			};
		};
		if (player in (missionNamespace getVariable ["ALF_AllBracelets",[]])) then {
			if (ALF_TimeBracelet > 0) then {
				_struct = _struct + format["Bracelet - %1<br/>",[ALF_TimeBracelet] call BIS_fnc_secondsToString];
			} else {
				_struct = _struct + "Bracelet - Temps indeterminé<br/>";
			};
		};
		if (player getVariable ["ALF_EnPrison",false] && {ALF_TimePrison > 0}) then {
			_struct = _struct + format["Prison - %1<br/>",[ALF_TimePrison] call BIS_fnc_secondsToString];
			if(ALF_Prison_Coffre isEqualTo 0) then {
				_struct = _struct + format["Cellule - %1<br/>","Aucune"];
			} else {
				_struct = _struct + format["Cellule - %1<br/>",ALF_Prison_Coffre];
			};
		};
		{
			_displayName = getText(_x >> "displayName");
			if(LICENSE_VALUE(configName _x) && !(_displayName in ["Femme"])) then {
				_struct = _struct + format["%1<br/>",_displayName];
			};
		} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
		
		if(_struct isEqualTo "") then {
			_struct = "Aucune";
		};
		_plicense ctrlSetStructuredText parseText format["<t align='center' shadow='0' size='1px'>%1</t>",_struct];
	};
	case 1 : {
		//Btn Menu
		_pmenubtn ctrlShow true;
		_kmenubtn ctrlShow false;
		_gmenubtn ctrlShow true;
		//Player Menu
		_pmenupic ctrlShow false;
		_pmoney ctrlShow false;
		_pedit ctrlShow false;
		_pbtngive ctrlShow false;
		_plicense ctrlShow false;
		//Key Menu
		_kmenupic ctrlShow true;
		_klistbox ctrlShow true;
		_kgivebtn ctrlShow true;
		_kjeterbtn ctrlShow true;
		//Group Menu
		_gmenupic1 ctrlShow false;
		_gmenupic2 ctrlShow false;
		_gedit ctrlShow false;
		_gcreatebtn ctrlShow false;
		_glistbox ctrlShow false;
		_gname ctrlShow false;
		_gpic1 ctrlShow false;
		_gpic2 ctrlShow false;
		_gpic3 ctrlShow false;
		_gpic4 ctrlShow false;
		_gpic5 ctrlShow false;
		_gpic6 ctrlShow false;
		_gbtn1 ctrlShow false;
		_gbtn2 ctrlShow false;
		_gbtn3 ctrlShow false;
		_gbtn4 ctrlShow false;
		_gbtn5 ctrlShow false;
		_gbtn6 ctrlShow false;
		//Param Menu
		_pamenupic ctrlShow false;
		_pamenubtn ctrlShow true;
		_pacheckbox ctrlShow false;
		_pafootslider ctrlShow false;
		_pafootedit ctrlShow false;
		_pacarslider ctrlShow false;
		_pacaredit ctrlShow false;
		_paairslider ctrlShow false;
		_paairedit ctrlShow false;

		_kedit ctrlShow true;
		_kbtn ctrlShow true;

		lbClear _klistbox;
		for "_i" from 0 to (count life_vehicles)-1 do {
			_veh = life_vehicles select _i;
			if(!isNull _veh && (alive _veh)) then {
				_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
				_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
				if !(_veh isKindOf "House") then {
					private _p = [_veh] call ALF_fnc_getPlaque;
					private _puid = _veh getVariable ["vehicle_info_owners",""];
					private _p1 = _p select 0;
					private _p2 = _p select 1;
					private _p4 = _p select 3;
					private _p5 = _p select 4;
					private _p6 = _p select 5;
					private _p8 = _p select 7;
					private _p9 = _p select 8;
					private _pF = format["%1%2-%3%4%5-%6%7",_p1,_p2,_p4,_p5,_p6,_p8,_p9];
					if((getPlayerUID player) isEqualTo _puid || {!(_veh getVariable ["business_veh",""] isEqualTo "") && {(player getVariable ["isEmployed",""]) isEqualTo ((_veh getVariable ["business_veh",[""]]) select 0)}}) then {
						_klistbox lbAdd format["%1 - %2",_name,_pF];
					} else {
						_klistbox lbAdd format["[PRET] - %1 - %2",_name,_pF];
					};
					_klistbox lbSetData [(lbSize _klistbox)-1,str(_i)];
				} else {
					private _uid = _veh getVariable ["uid",0];
					private _index = life_houses find (str(getPosATL _veh));
					if(_index != -1) then {
						_klistbox lbAdd format["%1",(_name + "#" + str(_uid))];
					} else {
						_klistbox lbAdd format["[PRET] - %1",(_name + "#" + str(_uid))];
					};
					_klistbox lbSetData [(lbSize _klistbox)-1,str(_i)];
				};
				if(_pic != "pictureStaticObject") then {
					_klistbox lbSetPicture [(lbSize _klistbox)-1,_pic];
				};
			};
		};
	};
	case 3 : {
		//Btn Menu
		_pmenubtn ctrlShow true;
		_kmenubtn ctrlShow true;
		_gmenubtn ctrlShow true;
		//Player Menu
		_pmenupic ctrlShow false;
		_pmoney ctrlShow false;
		_pedit ctrlShow false;
		_pbtngive ctrlShow false;
		_plicense ctrlShow false;
		//Key Menu
		_kmenupic ctrlShow false;
		_klistbox ctrlShow false;
		_kgivebtn ctrlShow false;
		_kjeterbtn ctrlShow false;
		//Group Menu
		_gmenupic1 ctrlShow false;
		_gmenupic2 ctrlShow false;
		_gedit ctrlShow false;
		_gcreatebtn ctrlShow false;
		_glistbox ctrlShow false;
		_gname ctrlShow false;
		_gpic1 ctrlShow false;
		_gpic2 ctrlShow false;
		_gpic3 ctrlShow false;
		_gpic4 ctrlShow false;
		_gpic5 ctrlShow false;
		_gpic6 ctrlShow false;
		_gbtn1 ctrlShow false;
		_gbtn2 ctrlShow false;
		_gbtn3 ctrlShow false;
		_gbtn4 ctrlShow false;
		_gbtn5 ctrlShow false;
		_gbtn6 ctrlShow false;
		//Param Menu
		_pamenupic ctrlShow true;
		_pamenubtn ctrlShow false;
		_pacheckbox ctrlShow true;
		_pafootslider ctrlShow true;
		_pafootedit ctrlShow true;
		_pacarslider ctrlShow true;
		_pacaredit ctrlShow true;
		_paairslider ctrlShow true;
		_paairedit ctrlShow true;

		_kedit ctrlShow false;
		_kbtn ctrlShow false;

		[] call ALF_fnc_settingsMenu;
	};
};