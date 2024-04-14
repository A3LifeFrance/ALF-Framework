#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_btnChangerPlaque.sqf
	Author: ALF Team
*/
if((lbCurSel 13001) isEqualTo -1) exitWith {};
private _index = lbValue[13001,(lbCurSel 13001)];
private _infoveh = life_vehicle_action select _index;
private _veh = _infoveh select 0;
private _cn = _infoveh select 1;

private _action = ["Veux-tu faire changer ta plaque pour une somme de 15.000€. Attention, cette manipulation est illégale.","Action Bricolage","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {};

private _exit = false;
if(life_cash < 15000) then {
	_exit = true;
} else {
	life_cash = life_cash - 15000;
	[0] call SOCK_fnc_updatePartial;
};
if(_exit) exitWith {["INFO","Tu n'as pas assez d'argent sur toi.","warning"] spawn ALF_fnc_doMsg;};

closeDialog 13000;

private _letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
private _numbers = ["0","1","2","3","4","5","6","7","8","9"];
private _ps1 = format ["%1", "-"];
private _ps2 = format ["%1", "-"];
private _pl1 = format ["%1", selectRandom _letters];
private _pl2 = format ["%1", selectRandom _letters];
private _pl3 = format ["%1", selectRandom _letters];
private _pl4 = format ["%1", selectRandom _letters];
private _pn1 = format ["%1", selectRandom _numbers];
private _pn2 = format ["%1", selectRandom _numbers];
private _pn3 = format ["%1", selectRandom _numbers];
private _pfinal = [_pl1, _pl2, _ps1, _pn1, _pn2, _pn3, _ps2, _pl3, _pl4];

_veh setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 0]];
_veh setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 1]];
_veh setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 3]];
_veh setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 4]];
_veh setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 5]];
_veh setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 7]];
_veh setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_pfinal select 8]];

private _info = brico getVariable ["info",[]];
_info pushBack [_cn,_var select 1,_pfinal];
brico setVariable ["info",_info,true];

//[_veh,_pfinal] remoteExecCall ["HC_fnc_changerPlaque",HC2_Life];

["INFO","La plaque de ton véhicule vient d'être changer.","success"] spawn ALF_fnc_doMsg;