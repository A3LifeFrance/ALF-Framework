#include "\ALF_hc\hc_macros.hpp"
/*
	ALF TEAM
*/

private "_d";
for "_i" from 0 to 1 step 0 do {
	uiSleep (30 * 60);
	_d = selectRandom[0,1,2,3,4];
	if(_d isEqualTo 3) exitWith {};
};

private _i = selectRandom["ALF_pierre_small","ALF_Cuivre","ALF_Fer","ALF_diamant_taille","ALF_Mais","ALF_Buche","ALF_Weed","ALF_Vin","ALF_Planche_B","ALF_diamant_precieux"];

private _old = -1;
private _curItemPrice = 0;
{
	if((_x select 0) isEqualTo _i) exitWith {
		_curItemPrice = _x select 1;
		_old = _curItemPrice;
		_curItemPrice = _curItemPrice * (selectRandom[1.3,1.4,1.5,1.6,1.7,1.8,1.9,2]);
		ALFBOURSE_Prices set [_forEachIndex,[_i,_curItemPrice,0]];
	};
} forEach ALFBOURSE_Prices;
if(_old isEqualTo -1) exitWith {};

private _msg = switch (_i) do {
	case "ALF_pierre_small" : {format["Les actions concernant le minerais de Pierre viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_Cuivre" : {format["Les actions concernant le minerais de Cuivre viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_Fer" : {format["Les actions concernant le minerais de Fer viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_diamant_taille" : {format["Les actions concernant le minerais de Diamant viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_diamant_precieux" : {format["Les actions concernant le minerais de Diamant Précieux viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_Mais" : {format["Les actions concernant le Mais viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_Buche" : {format["Les actions concernant les buches de bois viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_Vin" : {format["Les actions concernant le Vin viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_Planche_B" : {format["Les actions concernant les Planches viennent d'exploser, passant de %1€ à %2€ !!!",floor(_old),floor(_curItemPrice)]};
	case "ALF_Weed" : {"La vente de cannabis touche le fond. D'après nos envoyés spéciaux, le cout du cannabis aurait au moins doublé !!"};
};

if (_i isEqualTo "ALF_Weed") then {
	["BOURSE DROGUE",_msg] remoteExec ["ALF_fnc_doBfmCrime",(playableUnits select {alive _x})];
} else {
	["EVENT : CAC 40",_msg] remoteExec ["ALF_fnc_doBfmO",playableUnits];
};

[1,ALFBOURSE_Prices] remoteExecCall ["ALF_fnc_updateClientBourse",RANY];

ALFMARKET_UpdateCount = 0;
[0] call HC_fnc_saveBourse;

ALFMARKET_Events = time;
