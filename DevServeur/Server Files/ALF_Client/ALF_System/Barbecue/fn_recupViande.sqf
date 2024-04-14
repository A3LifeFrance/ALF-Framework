#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_recupViande.sqf
	Author: ALF NiiRoZz
*/
params [
	["_viande",objNull,[objNull]]
];

if (isNull _viande) exitWith {};

switch (typeOf _viande) do {
	case "ALF_Saucisse_Crue": {
		switch (toLower ((getObjectTextures _viande) select 0)) do {
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCrue"))): {
				if !(player canAdd "ALF_Saucisse_Crue_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Saucisse_Crue_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCuit"))): {
				if !(player canAdd "ALF_Saucisse_Cuite_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Saucisse_Cuite_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureBrulee"))): {
				if !(player canAdd "ALF_Saucisse_Brulee_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Saucisse_Brulee_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
		};
	};
	case "ALF_CotePorc_Crue": {
		switch (toLower ((getObjectTextures _viande) select 0)) do {
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCrue"))): {
				if !(player canAdd "ALF_CotePorc_Crue_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_CotePorc_Crue_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCuit"))): {
				if !(player canAdd "ALF_CotePorc_Cuite_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_CotePorc_Cuite_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureBrulee"))): {
				if !(player canAdd "ALF_CotePorc_Brulee_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_CotePorc_Brulee_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
		};
	};
	case "ALF_Poulet_Crue": {
		switch (toLower ((getObjectTextures _viande) select 0)) do {
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCrue"))): {
				if !(player canAdd "ALF_Poulet_Crue_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Poulet_Crue_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCuit"))): {
				if !(player canAdd "ALF_Poulet_Cuit_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Poulet_Cuit_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureBrulee"))): {
				if !(player canAdd "ALF_Poulet_Brulee_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Poulet_Brulee_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
		};
	};
	case "ALF_Bacon_Crue": {
		switch (toLower ((getObjectTextures _viande) select 0)) do {
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCrue"))): {
				if !(player canAdd "ALF_Bacon_Crue_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Bacon_Crue_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCuit"))): {
				if !(player canAdd "ALF_Bacon_Cuit_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Bacon_Cuit_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureBrulee"))): {
				if !(player canAdd "ALF_Bacon_Brulee_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Bacon_Brulee_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
		};
	};
	case "ALF_Maquereau_Crue": {
		switch (toLower ((getObjectTextures _viande) select 0)) do {
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCrue"))): {
				if !(player canAdd "ALF_Maquereau_Crue_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Maquereau_Crue_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureCuit"))): {
				if !(player canAdd "ALF_Maquereau_Cuit_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Maquereau_Cuit_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
			case (toLower (getText (configFile >> "CfgVehicles" >> typeOf _viande >> "textureBrulee"))): {
				if !(player canAdd "ALF_Maquereau_Brulee_M") exitWith {["Recup Viande", "Tu ne peux pas remettre ta viande dans ton inventaire", "danger", false] spawn ALF_fnc_doMsg;};
				["ALF_Maquereau_Brulee_M",true] spawn life_fnc_handleItem;
				deleteVehicle _viande;
			};
		};
	};
};