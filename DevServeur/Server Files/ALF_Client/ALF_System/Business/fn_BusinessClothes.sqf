/*
	File: fn_businessClothes.sqf
*/
private _building = _this select 0;
private _var = _building getVariable ["business",[]];
if(count _var isEqualTo 0) exitWith {};
private _membres = _var select 5;
private _secteur = _var select 4;
private _uid = getPlayerUID player;
private _exit = false;
{
	private _memberuid = _x select 1;
	if(_memberuid isEqualTo _uid) exitWith {_exit = true;};
} forEach _membres;
if !(_exit) exitWith {};

private _shop = "";
switch (_secteur) do { 
	case 0 : {_shop = "b_0";};
	case 1 : {_shop = "b_1";};
	case 2 : {_shop = "b_2";};
	case 3 : {_shop = "b_3";};
	case 4 : {_shop = "b_4";};
	case 5 : {_shop = "b_0";};
	case 6 : {_shop = "b_6";};
	case 7 : {_shop = "b_7";};
	case 8 : {_shop = "b_8";};
	case 9 : {_shop = "b_9";};
	case 10 : {_shop = "b_10";};
	case 11 : {_shop = "b_11";};
	case 12 : {_shop = "b_12";};
	case 13 : {_shop = "b_13";};
	case 14 : {_shop = "b_14";};
	case 15 : {_shop = "b_15";};
	case 16 : {_shop = "b_16";};
	case 17 : {_shop = "b_17";};
	case 18 : {_shop = "b_18";};
	case 19 : {_shop = "b_19";};
	case 20 : {_shop = "b_20";};
	case 21 : {_shop = "b_21";};
	case 22 : {_shop = "b_22";};
	case 23 : {_shop = "b_23";};
	case 24 : {_shop = "b_24";};
	case 25 : {_shop = "b_25";};
	case 26 : {_shop = "b_3";};
	case 27 : {_shop = "b_3";};
	case 28 : {_shop = "b_3";};
};
if(_shop isEqualTo "") exitWith {["INFO","Erreur dans le magasin.","warning"] spawn ALF_fnc_doMsg;};

[nil,nil,nil,_shop] spawn life_fnc_clothingMenu;
