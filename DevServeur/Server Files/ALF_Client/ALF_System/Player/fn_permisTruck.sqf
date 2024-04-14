#include "\ALF_Client\script_macros.hpp"
/*
File: fn_permisCar.sqf
Author: ALF Team
Description:
Système pour passer son permis voiture.
*/
if !(license_driver) exitWith {["Moniteur", "Tu n'as pas le permis B.", "danger", false] spawn ALF_fnc_doMsg;};
if (license_trucking) exitWith {["Moniteur", "Tu as dejà le permis C.", "danger", false] spawn ALF_fnc_doMsg;};
if (life_permis_action) exitWith {["Moniteur", "Tu passes dejà ton permis.", "danger", false] spawn ALF_fnc_doMsg;};

_price = 5000;

_action = [format["Veux-tu passer ton permis C pour %1€. Attention, epreuve sous 5 erreurs eliminatoires.",_price],"Inscription au permis C","OUI","NON"] call BIS_fnc_guiMessage;

if(_action) then {

	if(count((getMarkerPos "p_sauzon_start") nearEntities [["Car","Ship","Air"],15]) > 0) exitWith {["Moniteur", "Un vehicule gêne l'auto ecole.", "danger", false] spawn ALF_fnc_doMsg;};
	if(life_cash < _price) exitWith {["Moniteur", "Tu n'as pas assez d'argent sur toi.", "danger", false] spawn ALF_fnc_doMsg;};

	_startPos = getPosATL player;
	[3] spawn SOCK_fnc_updatePartial;

	life_permis_action = true;

	life_cash = life_cash - _price;
	[0] call SOCK_fnc_updatePartial;

	_vehicle = createVehicle ["V_ALF_Actros_Ecole", [0,0,2000], [], 0, "NONE"];
	_vehicle allowDamage false;
	_vehicle setPos (getMarkerPos "p_sauzon_start");
	_vehicle setVectorUp (surfaceNormal (getMarkerPos "p_sauzon_start"));
	_vehicle setDir (markerDir "p_sauzon_start");
	_vehicle lock 2;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle addMagazineCargoGlobal ["ALF_Roue",4];
	_vehicle setVariable ["vehicle_info_owners",getPlayerUID player,true];
	_vehicle disableTIEquipment true;

	_vehicle setObjectTextureGlobal [1, "\ALF_Vehicules\ALF_data\plaque\-.paa"];
	_vehicle setObjectTextureGlobal [2, "\ALF_Vehicules\ALF_data\plaque\E.paa"];
	_vehicle setObjectTextureGlobal [3, "\ALF_Vehicules\ALF_data\plaque\C.paa"];
	_vehicle setObjectTextureGlobal [4, "\ALF_Vehicules\ALF_data\plaque\O.paa"];
	_vehicle setObjectTextureGlobal [5, "\ALF_Vehicules\ALF_data\plaque\L.paa"];
	_vehicle setObjectTextureGlobal [6, "\ALF_Vehicules\ALF_data\plaque\E.paa"];
	_vehicle setObjectTextureGlobal [7, "\ALF_Vehicules\ALF_data\plaque\-.paa"];

	_vehicle allowDamage true;
	life_vehicles pushBack _vehicle;
	[getPlayerUID player,_vehicle,1] remoteExecCall ["HC_fnc_keyManagement",HC2_Life];

	[player,_vehicle,_startPos] remoteExec ["HC_fnc_permisVerif",HC2_Life];

	_permis = true;
	_exit = false;
	_erreur = 0;
	_myerreur = 0;
	_etape1 = false;
	_etape2 = false;
	_etape3 = false;
	_etape4 = false;
	_etape5 = false;
	_etape6 = false;
	_etape7 = false;
	_etape8 = false;
	_etape9 = false;
	_etape10 = false;
	_etape11 = false;
	_etape12 = false;
	_etape13 = false;
	_etape14 = false;
	_etape15 = false;
	_etape16 = false;
	_etape17 = false;
	_etape18 = false;
	_etape19 = false;
	_etape20 = false;
	_etape21 = false;
	_etape22 = false;
	_etape23 = false;
	_etape24 = false;
	_etape25 = false;
	_etape26 = false;
	_etape27 = false;
	_passageTime = time;

	["Moniteur", "Le moniteur t'attend, tu peux monter dans la voiture.", "warning", false] spawn ALF_fnc_doMsg;

	for "_i" from 0 to 1 step 0 do {
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if (typeOf (vehicle player) isKindOf "V_ALF_Actros_Ecole") exitWith {_etape1 = true;};
		if (player distance _vehicle > 100) exitWith {_exit = true;};
		sleep 1;
	};
	if (_exit) exitWith {life_permis_action = false; hint "Tu as râte ton permis, le moniteur est parti."};

	waitUntil {sleep 0.3; _etape1;};
	["D", "20m", "Sortez du parking et prenez à droite."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_1") > 200) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_1") < 8) exitWith {_etape2 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape2;};
	["D", "10m", "Prenez à droite, et allez tout droit jusqu'au feu."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_2") > 200) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_2") < 10) exitWith {_etape3 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape3;};
	["TD", "100m", "Continuez tout droit jusqu'au feu."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_3") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_3") < 10) exitWith {_etape4 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape4;};
	["G", "15m", "Prenez à gauche."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_4") > 150) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_4") < 10) exitWith {_etape5 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape5;};
	["TD", "1Km", "Continuez tout droit."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_5") > 1500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_5") < 10) exitWith {_etape6 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape6;};
	["G", "1Km", "Continuez sur cette route, sur votre gauche."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_6") > 1500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_6") < 20) exitWith {_etape7 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape7;};
	["TD", "100m", "Après le feu, continuez tout droit."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_7") > 300) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_7") < 20) exitWith {_etape8 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape8;};
	["D", "15m", "Prenez directement à droite."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_8") > 150) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_8") < 20) exitWith {_etape9 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape9;};
	["TD", "3Km", "Continuez tout droit sur 3 Km."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_9") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_9") < 20) exitWith {_etape10 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape10;};
	["TD", "2.1Km", "Continuez tout droit sur 2.1 Km."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_10") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_10") < 20) exitWith {_etape11 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape11;};
	["TD", "2Km", "Continuez tout droit sur 2 Km."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_11") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_11") < 20) exitWith {_etape12 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape12;};
	["TD", "1.5Km", "Continuez tout droit sur 1.5 Km."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_12") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_12") < 20) exitWith {_etape13 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape13;};
	["TD", "1Km", "Continuez tout droit."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_13") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_13") < 20) exitWith {_etape14 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape14;};
	["D", "25m", "Dans 25m prenez à droite."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_14") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_14") < 20) exitWith {_etape15 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape15;};
	["TD", "3Km", "Continuez tout droit sur 3Km."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_15") > 3000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_15") < 20) exitWith {_etape16 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape16;};
	["TD", "1.5Km", "Continuez tout droit sur 1.5Km."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_16") > 3000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_16") < 20) exitWith {_etape17 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape17;};
	["D", "300m", "Dans 300m, prenez à droite."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_17") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_17") < 20) exitWith {_etape18 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape18;};
	["D", "15m", "Prenez à droite."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 95 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_18") > 150) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_18") < 20) exitWith {_etape19 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape19;};
	["TD", "2Km", "Continuez tout droit sur 2Km."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_19") > 1000) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_19") < 20) exitWith {_etape20 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape20;};
	["D", "50m", "Après le feu, tenez votre droite et continuez tout droit."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_20") > 500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_20") < 20) exitWith {_etape21 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape21;};
	["TD", "300m", "Continuez toujours tout droit."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_21") > 500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_21") < 20) exitWith {_etape22 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape22;};
	["G", "50m", "Ralentissez, puis prenez directement à gauche."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_22") > 500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_22") < 20) exitWith {_etape23 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape23;};
	["D", "25m", "Ralentissez, puis prenez directement à droite."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_23") > 500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_23") < 20) exitWith {_etape24 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape24;};
	["D", "100m", "Dans 100m, prenez le parking de l'auto-école."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_24") > 500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_24") < 20) exitWith {_etape25 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape25;};
	["D", "10m", "Garez vous sur le parking."] spawn ALF_fnc_doGps;

	_myerreur = _erreur;
	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		_speed = round speed (vehicle player);
		if (round _speed > 60 && {_erreur isEqualTo _myerreur}) then {_erreur = _erreur + 1; hint "Attention, tu vas trop vite, tu viens d'avoir une erreur en plus."};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_25") > 500) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_25") < 20) exitWith {_etape26 = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape26;};
	["TD", "5m", "Garez vous et stoppez le véhicule."] spawn ALF_fnc_doGps;

	_passageTime = time;
	for "_i" from 0 to 1 step 0 do {
		if ( round speed (vehicle player) isEqualTo 0) exitWith {_etape27 = true;};
		if ((vehicle player) distance (getMarkerPos "p_sauzon_25") > 350) exitWith {_exit = true;};
		if (time - _passageTime > 300) exitWith {_exit = true;};
		sleep 0.5;
	};
	if (_exit) exitWith {life_permis_action = false; player allowDamage false; [] spawn {sleep 5; player allowDamage true;}; deleteVehicle _vehicle; player setPosATL _startPos; ["Moniteur", "Tu as râte ton permis, tu es partie trop loin.", "warning", false] spawn ALF_fnc_doMsg;};
	waitUntil {sleep 0.3; _etape27;};

	deleteVehicle _vehicle;

	["Moniteur",format["Votre nombre d'erreur(s): %1",_erreur], "warning", false] spawn ALF_fnc_doMsg;
	sleep 2;
	if (_erreur < 6) then {
		["Moniteur", "Vous avez votre permis C, felicitation !", "success", false] spawn ALF_fnc_doMsg;
		if (!("ALF_Permis" in (magazines player)) && {player canAdd "ALF_Permis"}) then {
			["ALF_Permis",true] spawn life_fnc_handleItem;
		};
		license_trucking = true;
		life_permis_action = false;
		[1] call SOCK_fnc_updatePartial;
	} else {
		["Moniteur", "Vous avez fait trop d'erreurs, vous n'avez pas eu votre permis C..", "danger", false] spawn ALF_fnc_doMsg;
		life_permis_action = false;
	};
};
