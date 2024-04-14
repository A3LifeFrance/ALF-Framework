#include "\ALF_Client\script_macros.hpp"
/*
File: fn_menuNokia.sqf
Author: ALF Team
Description:
Chargement du menu du Nokia.
*/
private["_display"];
if(!dialog) then {
	createDialog "ALF_NokiaMenu_Dialog";
};
disableSerialization;
_display = findDisplay 20000;
private _menu1sim = _display displayCtrl 200011;
private _menu1nosim = _display displayCtrl 200012;
private _menu1incall = _display displayCtrl 200013;
private _menu1ring = _display displayCtrl 200014;
private _menu1try = _display displayCtrl 200015;
private _menu1phone = _display displayCtrl 200016;
private _datenokia = _display displayCtrl 20001;
private _menu1smsbtn = _display displayCtrl 20002;
private _menu1contactsbtn = _display displayCtrl 20003;
private _menu1phonetbn = _display displayCtrl 200031;
private _menu1name = _display displayCtrl 200041;
private _menu1num = _display displayCtrl 200042;
private _menu1Time = _display displayCtrl 200043;
private _menu1decrocher = _display displayCtrl 20004;
private _menu1refuser = _display displayCtrl 20005;
private _menu1raccrocher = _display displayCtrl 20006;
private _menu1quit = _display displayCtrl 200061;
private _menu1up = _display displayCtrl 200062;
private _menu1down = _display displayCtrl 200063;

private _menu2pic = _display displayCtrl 20010;
private _menu2contactslist = _display displayCtrl 20011;
private _menu2appeler = _display displayCtrl 20012;
private _menu2sms = _display displayCtrl 20013;
private _menu2supprimer = _display displayCtrl 20014;
private _menu2nameedit = _display displayCtrl 20015;
private _menu2numedit = _display displayCtrl 20016;
private _menu2ajouter = _display displayCtrl 20017;
private _menu2retour = _display displayCtrl 200171;

private _menu3pic = _display displayCtrl 20018;
private _menu3smsname = _display displayCtrl 200181;
private _menu3numedit = _display displayCtrl 200182;
private _menu3smsedit = _display displayCtrl 20019;
private _menu3smsbtn = _display displayCtrl 20020;
private _menu3retour = _display displayCtrl 200201;

private _menu4pic = _display displayCtrl 200211;
private _menu4smslist = _display displayCtrl 20021;
private _menu4smsview = _display displayCtrl 20022;
private _menu4repondre = _display displayCtrl 20023;
private _menu4supprimer = _display displayCtrl 20024;
private _menu4newsms = _display displayCtrl 20025;
private _menu4retour = _display displayCtrl 20026;
private _menurecents = _display displayCtrl 20027;
private _menurecentlist = _display displayCtrl 20028;

private _date = date;
private _hour = _date select 3;
private _min = _date select 4;
if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
_datenokia ctrlShow true;
_datenokia ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.45'>%1:%2</t>", _hour,_min];

if(ALF_Phone_Anonyme) then {
	ALF_Phone_Anonyme = false;
};

private _menu = uiNamespace getVariable "nokiamenu";
switch (_menu) do {
	case 0 : {
		_menu2pic ctrlShow false;
		_menu2contactslist ctrlShow false;
		_menu2appeler ctrlShow false;
		_menu2sms ctrlShow false;
		_menu2supprimer ctrlShow false;
		_menu2nameedit ctrlShow false;
		_menu2numedit ctrlShow false;
		_menu2ajouter ctrlShow false;
		_menu3smsname ctrlShow false;
		_menu3smsedit ctrlShow false;
		_menu3smsbtn ctrlShow false;
		_menu3numedit ctrlShow false;
		_menu4smslist ctrlShow false;
		_menu4smsview ctrlShow false;
		_menu4repondre ctrlShow false;
		_menu4supprimer ctrlShow false;
		_menu4newsms ctrlShow false;
		_menu3pic ctrlShow false;
		_menu2retour ctrlShow false;
		_menu3retour ctrlShow false;
		_menu4retour ctrlShow false;
		_menu4pic ctrlShow false;
		_menu1quit ctrlShow true;
		_menu1Time ctrlShow false;
		_menu1phone ctrlShow false;
		_menu1phonetbn ctrlShow false;
		_menurecents ctrlShow false;
		_menurecentlist ctrlShow false;
		_menu1up ctrlShow false;
		_menu1down ctrlShow false;

		if (ALF_Phone_inCall) then {
			_menu1incall ctrlShow true;
			_menu1sim ctrlShow false;
			_menu1nosim ctrlShow false;
			_menu1ring ctrlShow false;
			_menu1smsbtn ctrlShow false;
			_menu1contactsbtn ctrlShow false;
			_menu1decrocher ctrlShow false;
			_menu1refuser ctrlShow false;
			_menu1raccrocher ctrlShow true;
			_menu1name ctrlShow true;
			_menu1num ctrlShow true;
			_menu1try ctrlShow false;
			_menu1up ctrlShow true;
			_menu1down ctrlShow true;
			_menu1Time ctrlShow true;
			_menu1quit ctrlShow false;

			_hisName = "Inconnu";
			_hisNumber = ALF_Phone_CallNumber;
			_hisAnonyme = ALF_Phone_CallAnonyme;
			if (count life_contacts > 0) then {
				{
					if ((_x select 1) isEqualTo _hisNumber) exitWith {
						_hisName = _x select 0;
					};
				} forEach life_contacts;
			};
			if(_hisNumber isEqualTo "17") then {_hisName = "Gendarmerie"} else {
			if(_hisNumber isEqualTo "18") then {_hisName = "Pompier"} else {
			if(_hisAnonyme) then {_hisName = "Anonyme"; _hisNumber = "**********"};};};
			_menu1name ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>%1</t>", _hisName];
			_menu1num ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>%1</t>", _hisNumber];
			_menu1up buttonSetAction "[""UP""] spawn ALF_fnc_callSetVolume;";
			_menu1down buttonSetAction "[""DOWN""] spawn ALF_fnc_callSetVolume;";
			_menu1raccrocher buttonSetAction "[] call ALF_fnc_endCall;";
		} else {
		if (ALF_Phone_Ring) then {
				_menu1incall ctrlShow false;
				_menu1sim ctrlShow false;
				_menu1nosim ctrlShow false;
				_menu1ring ctrlShow true;
				_menu1smsbtn ctrlShow false;
				_menu1contactsbtn ctrlShow false;
				_menu1decrocher ctrlShow true;
				_menu1refuser ctrlShow true;
				_menu1raccrocher ctrlShow false;
				_menu1name ctrlShow true;
				_menu1num ctrlShow true;
				_menu1try ctrlShow false;
				_menu1Time ctrlShow false;

				_hisName = "Inconnu";
				_hisNumber = ALF_Phone_CallNumber;
				_hisAnonyme = ALF_Phone_CallAnonyme;
				if (count life_contacts > 0) then {
					{
						if ((_x select 1) isEqualTo _hisNumber) exitWith {
							_hisName = _x select 0;
						};
					} forEach life_contacts;
				};
				if(_hisAnonyme) then {_hisName = "Anonyme"; _hisNumber = "**********"};
				_menu1name ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>%1</t>", _hisName];
				_menu1num ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>%1</t>", _hisNumber];
				_menu1decrocher buttonSetAction "player setVariable [""call_info"",2,HC3_Life];";
				_menu1refuser buttonSetAction "[] call ALF_fnc_resetCall;";
			} else {
				if(ALF_Phone_tryCall) then {
					_menu1incall ctrlShow false;
					_menu1sim ctrlShow false;
					_menu1nosim ctrlShow false;
					_menu1ring ctrlShow false;
					_menu1try ctrlShow true;
					_menu1smsbtn ctrlShow false;
					_menu1contactsbtn ctrlShow false;
					_menu1decrocher ctrlShow false;
					_menu1refuser ctrlShow true;
					_menu1raccrocher ctrlShow false;
					_menu1name ctrlShow true;
					_menu1num ctrlShow true;
					_menu1Time ctrlShow false;

					_hisName = "Inconnu";
					_hisNumber = ALF_Phone_CallNumber;
					if (count life_contacts > 0) then {
						{
							if ((_x select 1) isEqualTo _hisNumber) exitWith {
								_hisName = _x select 0;
							};
						} forEach life_contacts;
					};
					if(_hisNumber isEqualTo "17") then {_hisName = "Gendarmerie"};
					if(_hisNumber isEqualTo "18") then {_hisName = "Pompier"};
					_menu1name ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>%1</t>", _hisName];
					_menu1num ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>%1</t>", _hisNumber];
					_menu1refuser buttonSetAction "[] call ALF_fnc_resetCall;";
				} else {
					if(ALF_Forfait isEqualTo -1) then {
						_menu1incall ctrlShow false;
						_menu1try ctrlShow false;
						_menu1sim ctrlShow false;
						_menu1nosim ctrlShow true;
						_menu1ring ctrlShow false;
						_menu1smsbtn ctrlShow false;
						_menu1contactsbtn ctrlShow false;
						_menu1decrocher ctrlShow false;
						_menu1refuser ctrlShow false;
						_menu1raccrocher ctrlShow false;
						_menu1name ctrlShow false;
						_menu1num ctrlShow false;
						_menu1Time ctrlShow false;
					} else {
							_menu1incall ctrlShow false;
							_menu1try ctrlShow false;
							_menu1sim ctrlShow true;
							_menu1nosim ctrlShow false;
							_menu1ring ctrlShow false;
							_menu1smsbtn ctrlShow true;
							_menu1contactsbtn ctrlShow true;
							_menu1decrocher ctrlShow false;
							_menu1refuser ctrlShow false;
							_menu1raccrocher ctrlShow false;
							_menu1name ctrlShow false;
							_menu1num ctrlShow false;
							_menu1Time ctrlShow false;
							_menu1phonetbn ctrlShow true;
							_menu1up ctrlShow true;
							_menu1up buttonSetAction "[] spawn ALF_fnc_setViberNokia;";
					};
				};
			};
		};
	};
	case 1 : {
		_menu1incall ctrlShow false;
		_menu1sim ctrlShow false;
		_menu1nosim ctrlShow false;
		_menu1ring ctrlShow false;
		_menu1try ctrlShow false;
		_menu1smsbtn ctrlShow false;
		_menu1contactsbtn ctrlShow false;
		_menu1decrocher ctrlShow false;
		_menu1refuser ctrlShow false;
		_menu1raccrocher ctrlShow false;
		_menu3smsname ctrlShow false;
		_menu3smsedit ctrlShow false;
		_menu3smsbtn ctrlShow false;
		_menu3numedit ctrlShow false;
		_menu4smslist ctrlShow false;
		_menu4smsview ctrlShow false;
		_menu4repondre ctrlShow false;
		_menu4supprimer ctrlShow false;
		_menu4newsms ctrlShow false;
		_menu4pic ctrlShow false;
		_menu3pic ctrlShow false;
		_menu2pic ctrlShow true;
		_menu2contactslist ctrlShow true;
		_menu2appeler ctrlShow true;
		_menu2sms ctrlShow true;
		_menu2supprimer ctrlShow true;
		_menu2nameedit ctrlShow true;
		_menu2numedit ctrlShow true;
		_menu2ajouter ctrlShow true;
		_menu2retour ctrlShow true;
		_menu3retour ctrlShow false;
		_menu4retour ctrlShow false;
		_menu1name ctrlShow false;
		_menu1num ctrlShow false;
		_menu1quit ctrlShow false;
		_menu1Time ctrlShow false;
		_menu1phone ctrlShow false;
		_menu1phonetbn ctrlShow false;
		_menurecents ctrlShow false;
		_menurecentlist ctrlShow false;
		_menu1up ctrlShow false;
		_menu1down ctrlShow false;

		lbClear _menu2contactslist;
		if (count life_contacts > 0) then {
			{
				_name = _x select 0;
				_number = _x select 1;
				_menu2contactslist lbAdd format["%1 - %2",_name,_number];
				_menu2contactslist lbSetData [(lbSize _menu2contactslist)-1,str(_x)];
				_menu2contactslist lbSetValue [(lbSize _menu2contactslist)-1,_forEachIndex];
			} forEach life_contacts;
			lbSort _menu2contactslist;
		};
		_menu2appeler buttonSetAction "[] spawn ALF_fnc_callContactNokia;";

	};
	case 2 : {
		_menu1incall ctrlShow false;
		_menu1sim ctrlShow false;
		_menu1nosim ctrlShow false;
		_menu1ring ctrlShow false;
		_menu1try ctrlShow false;
		_menu1smsbtn ctrlShow false;
		_menu1contactsbtn ctrlShow false;
		_menu1decrocher ctrlShow false;
		_menu1refuser ctrlShow false;
		_menu1raccrocher ctrlShow false;
		_menu1quit ctrlShow false;
		_menu2pic ctrlShow false;
		_menu2contactslist ctrlShow false;
		_menu2appeler ctrlShow false;
		_menu2sms ctrlShow false;
		_menu2supprimer ctrlShow false;
		_menu2nameedit ctrlShow false;
		_menu2numedit ctrlShow false;
		_menu2ajouter ctrlShow false;
		_menu3smsname ctrlShow false;
		_menu3smsedit ctrlShow false;
		_menu3smsbtn ctrlShow false;
		_menu3numedit ctrlShow false;
		_menu4smslist ctrlShow true;
		_menu4smsview ctrlShow true;
		_menu4repondre ctrlShow false;
		_menu4supprimer ctrlShow false;
		_menu4newsms ctrlShow true;
		_menu4pic ctrlShow true;
		_menu3pic ctrlShow false;
		_menu2retour ctrlShow false;
		_menu3retour ctrlShow false;
		_menu4retour ctrlShow true;
		_menu1name ctrlShow false;
		_menu1num ctrlShow false;
		_menu1Time ctrlShow false;
		_menu1phone ctrlShow false;
		_menu1phonetbn ctrlShow false;
		_menurecents ctrlShow false;
		_menurecentlist ctrlShow false;
		_menu1up ctrlShow false;
		_menu1down ctrlShow false;
		[ALF_Phone_Number,player] remoteExecCall ["HC_fnc_loadSmsNokia",HC3_Life];
		_menu4newsms buttonSetAction "[] call ALF_fnc_smsNokia;";
		_menu4retour buttonSetAction "uiNamespace setVariable ['nokiamenu',0]; [] call ALF_fnc_menuNokia;";
		ALF_Phone_SMS = false;
	};
	case 3 : {
		_menu1incall ctrlShow false;
		_menu1sim ctrlShow false;
		_menu1nosim ctrlShow false;
		_menu1ring ctrlShow false;
		_menu1try ctrlShow false;
		_menu1smsbtn ctrlShow false;
		_menu1contactsbtn ctrlShow false;
		_menu1decrocher ctrlShow true;
		_menu1refuser ctrlShow true;
		_menu1raccrocher ctrlShow false;
		_menu1quit ctrlShow false;
		_menu2pic ctrlShow false;
		_menu2contactslist ctrlShow false;
		_menu2appeler ctrlShow false;
		_menu2sms ctrlShow false;
		_menu2supprimer ctrlShow false;
		_menu2nameedit ctrlShow false;
		_menu2numedit ctrlShow false;
		_menu2ajouter ctrlShow false;
		_menu3smsname ctrlShow false;
		_menu3smsedit ctrlShow false;
		_menu3smsbtn ctrlShow false;
		_menu3numedit ctrlShow true;
		_menu4smslist ctrlShow false;
		_menu4smsview ctrlShow false;
		_menu4repondre ctrlShow false;
		_menu4supprimer ctrlShow false;
		_menu4newsms ctrlShow false;
		_menu4pic ctrlShow false;
		_menu3pic ctrlShow false;
		_menu2retour ctrlShow true;
		_menu3retour ctrlShow false;
		_menu4retour ctrlShow false;
		_menu1name ctrlShow false;
		_menu1num ctrlShow true;
		_menu1Time ctrlShow false;
		_menu1phone ctrlShow true;
		_menu1phonetbn ctrlShow false;
		_menurecents ctrlShow false;
		_menurecentlist ctrlShow false;
		_menu1up ctrlShow true;
		_menu1down ctrlShow false;

		_menu1decrocher buttonSetAction "[] spawn ALF_fnc_callCustomNokia;";
		_menu1refuser buttonSetAction "[] spawn ALF_fnc_callDisablePhone;";
		_menu1num ctrlSetStructuredText parseText format["<t align='right' shadow='0' color='#000000' font='NokiaCellphoneFC' size='.6'>Mon numéro: %1</t>",ALF_Phone_Number];
		_menu1up buttonSetAction "uiNamespace setVariable ['nokiamenu',4]; [] call ALF_fnc_menuNokia;";
	};

	case 4 : {
		_menu1incall ctrlShow false;
		_menu1sim ctrlShow false;
		_menu1nosim ctrlShow false;
		_menu1ring ctrlShow false;
		_menu1try ctrlShow false;
		_menu1smsbtn ctrlShow false;
		_menu1contactsbtn ctrlShow false;
		_menu1decrocher ctrlShow false;
		_menu1refuser ctrlShow false;
		_menu1raccrocher ctrlShow false;
		_menu3smsname ctrlShow false;
		_menu3smsedit ctrlShow false;
		_menu3smsbtn ctrlShow false;
		_menu3numedit ctrlShow false;
		_menu4smslist ctrlShow false;
		_menu4smsview ctrlShow false;
		_menu4repondre ctrlShow true;
		_menu4supprimer ctrlShow true;
		_menu4newsms ctrlShow true;
		_menu4pic ctrlShow false;
		_menu3pic ctrlShow false;
		_menu2pic ctrlShow false;
		_menu2contactslist ctrlShow false;
		_menu2appeler ctrlShow false;
		_menu2sms ctrlShow false;
		_menu2supprimer ctrlShow false;
		_menu2nameedit ctrlShow false;
		_menu2numedit ctrlShow false;
		_menu2ajouter ctrlShow false;
		_menu2retour ctrlShow false;
		_menu3retour ctrlShow false;
		_menu4retour ctrlShow false;
		_menu1name ctrlShow false;
		_menu1num ctrlShow false;
		_menu1quit ctrlShow false;
		_menu1Time ctrlShow false;
		_menu1phone ctrlShow false;
		_menu1phonetbn ctrlShow false;
		_menurecents ctrlShow true;
		_menurecentlist ctrlShow true;
		_menu1up ctrlShow false;
		_menu1down ctrlShow true;

		lbClear _menurecentlist;
		if (count ALF_Phone_Historique > 0) then {
			{
				private _time = _x select 0;
				private _anonyme = _x select 1;
				private _type = _x select 2;
				private _number = _x select 3;
				private _hisName = "Inconnu";
				if(_anonyme) then {_hisName = "Anonyme"; _number = "**********"};
				if (count life_contacts > 0) then {
					{
						if ((_x select 1) isEqualTo _number) exitWith {
							_hisName = _x select 0;
						};
					} forEach life_contacts;
				};
				if(_number isEqualTo "17") then {_hisName = "Gendarmerie"};
				if(_number isEqualTo "18") then {_hisName = "Pompier"};
				_menurecentlist lbAdd format["[%1] - %2 (%3)",_time,_hisName,_number];
				if (_type isEqualTo 0) then {
					_menurecentlist lbSetPicture [(lbSize _menurecentlist)-1,"\ALF_Client2\icons\out.paa"];
				} else {
					_menurecentlist lbSetPicture [(lbSize _menurecentlist)-1,"\ALF_Client2\icons\in.paa"];
				};
				_menurecentlist lbSetData [(lbSize _menurecentlist)-1,str(_x)];
			} forEach ALF_Phone_Historique;
		} else {
			_menurecentlist lbAdd "Aucun historique.";
			_menurecentlist lbSetData [(lbSize _menurecentlist)-1,"Aucun historique."];
		};
		((findDisplay 20000) displayCtrl 20028) lbSetCurSel 0;
		_menu4repondre buttonSetAction "[] spawn ALF_fnc_callRecentNokia;";
		_menu4newsms buttonSetAction "[] spawn ALF_fnc_smsRecentNokia;";
		_menu4supprimer buttonSetAction "ALF_Phone_Historique = []; [] call ALF_fnc_menuNokia;";
		_menu1down buttonSetAction "uiNamespace setVariable ['nokiamenu',3]; [] call ALF_fnc_menuNokia;";
	};
};

[] spawn {
	if ((isNull ALF_PhoneObject) && !ALF_Phone_inCall && !ALF_Phone_tryCall) then {
		player playActionNow "ALF_LookAt";
		ALF_PhoneObject = "ALF_3310_Object" createVehicle [0,0,1000];
		[ALF_PhoneObject,false] remoteExecCall ["enableSimulationGlobal",2];
		uiSleep 0.3;
		if (vehicle player isEqualTo player) then {
			ALF_PhoneObject attachTo [player, [-0.06,-0.05,0.01], "RightHandMiddle1"];     
			ALF_PhoneObject setVectorDirAndUp [[0.1, -1.9, -0.8],[-0.25, -0.5, 0.5]]; 
		};
		
		waitUntil {(isNull findDisplay 20000) || ALF_Phone_inCall || ALF_Phone_tryCall};

		if (!ALF_Phone_inCall && !ALF_Phone_tryCall) then {
			detach ALF_PhoneObject;
			deleteVehicle ALF_PhoneObject;
			ALF_PhoneObject = objNull;
			player playActionNow "gestureNod";
			[{player playActionNow "gestureNod";}] call CBA_fnc_execNextFrame;
		};
	};
};