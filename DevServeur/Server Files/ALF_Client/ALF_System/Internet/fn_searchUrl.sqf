#include "\ALF_Client\script_macros.hpp"
/*
File: fn_searchUrl.sqf
Author: ALF Team
*/
private _url = ctrlText 24502;
if(_url isEqualTo "") exitWith {["Intranet", "L'url est vide.", "success"] spawn ALF_fnc_doMsg;};

if(_url isEqualTo "armurerie.fr" OR {_url isEqualTo "www.armurerie.fr"}) exitWith {
	alf_shop_panier = [];
	uiNamespace setVariable ['internetmenu',3];
	[] call ALF_fnc_menuInternet;
};

if(_url in [ALF_Blackmarket,ALF_Blackmarket2,ALF_Blackmarket3,ALF_Blackmarket4,ALF_Blackmarket5]) exitWith {
	if((time - life_action_delay) < 2) exitWith {["ERREUR", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};
	life_action_delay = time;
	[_url] remoteExecCall ["HC_fnc_searchURLDN", HC_Life];
};

if(_url isEqualTo "boursedirect.fr" OR {_url isEqualTo "www.boursedirect.fr"}) exitWith {
	uiNamespace setVariable ['internetmenu',7];
	[] call ALF_fnc_menuInternet;
};
if(_url isEqualTo "leboncoin.fr" OR {_url isEqualTo "www.leboncoin.fr"}) exitWith {
	uiNamespace setVariable ['internetmenu',8];
	[] call ALF_fnc_menuInternet;
};

["Intranet", "Le serveur ne renvoit aucun résultat.", "success"] spawn ALF_fnc_doMsg;
