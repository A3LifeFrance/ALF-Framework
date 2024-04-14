#include "\ALF_Client\script_macros.hpp"

if((time - life_action_delay) < 0.2) exitWith {};
life_action_delay = time;

//if (alf_contrats <= 0) exitWith {};

disableSerialization;
if((lbCurSel 39403) isEqualTo -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
private _price = lbValue[39403,(lbCurSel 39403)];
if(isNil "_price") then {_price = 0;};
private _item = lbData[39403,(lbCurSel 39403)];
if (_item isEqualTo "ALF_pierre_small" && {player getVariable ["ALF_EnPrison",false]}) then {
	_price = floor (_price / 21);
};

if (_item isEqualTo "ALF_Peche" && {alf_niv_recolte < 1}) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};
if (_item isEqualTo "ALF_Raisin" && {alf_niv_recolte < 4}) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};
if (_item isEqualTo "ALF_Huitre" && {alf_niv_recolte < 5}) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};
if (_item isEqualTo "ALF_Champignon" && {alf_niv_recolte < 6}) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};
if (_item isEqualTo "ALF_Fraise" && {alf_niv_recolte < 8}) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};
if (_item isEqualTo "ALF_Truffe" && {alf_niv_recolte < 9}) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};

private _btn = ((findDisplay 39400) displayCtrl 39405);
_btn ctrlEnable false;

life_cash = life_cash + _price;

if(_item in ["ALF_Pomme","ALF_Peche"]) then {
	[0,2] spawn ALF_fnc_addXP;
} else {
	if(_item in ["ALF_Raisin","ALF_Huitre","ALF_Champignon"]) then {
		[0,4] spawn ALF_fnc_addXP;
	} else {
		if(_item in ["ALF_Fraise","ALF_Truffe"]) then {
			[0,5] spawn ALF_fnc_addXP;
		};
	};
};

[_item,_price] spawn {
	life_query_time = time;
	_item = _this select 0;
	if !(alf_moneysave) then {
		alf_moneysave = true;
		waitUntil {sleep 0.3; (time - life_query_time) >= 5};
		[0] call SOCK_fnc_updatePartial;
		[name player,getPlayerUID player,"VENTE",format["A vendu %2 en bourse pour %3€. CASH: %1€",life_cash,_item,_this select 1]] remoteExec ["HC_fnc_logIt",HC3_Life];
		if(_item in ["ALF_Weed","ALF_Weed_2","ALF_Weed_3","ALF_Weed_P","ALF_Weed_P_2","ALF_Weed_P_3","ALF_Cocaine_U","ALF_Cocaine"]) then {
			//HEURE DE DEAL
			private _hour = date select 3;
			private _min = date select 4;
			if(_min >= 0 && _min <= 9) then {_min = format["0%1", _min];};
			private _time = format["%1:%2",_hour,_min];

			//ON POSE LA VARIABLE
			private _var = obj_dealer getVariable ["info",[]];
			if(count _var > 0) then {
				_var pushBack _time;
				obj_dealer setVariable ["info",_var,true];
			} else {
				obj_dealer setVariable ["info",[_time],true];
			};
		};
		
		alf_moneysave = false;
	};
};

private _h = [_item,false] spawn life_fnc_handleItem;
ALFBOURSE_NbAchat pushBack [_item,1];

waitUntil {sleep 0.05; scriptDone _h};

[] call life_fnc_itemsVenteLoad;

private _itemInfo = [_item] call life_fnc_fetchCfgDetails;
hint parseText format["Vous avez vendu un %1 pour <t color='#8cff9b'>%2€</t>.",_itemInfo select 1,[_price] call life_fnc_numberText];

_btn ctrlEnable true;
