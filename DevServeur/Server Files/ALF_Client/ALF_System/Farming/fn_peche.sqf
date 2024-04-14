/*
	File: fn_peche.sqf
	Author: ALF NiiRoZz
*/

if (alf_niv_peche < 0) exitWith {["ERREUR","Vous n'est pas assez expérimenté pour cela ...","danger"] spawn ALF_fnc_doMsg;};

private _handler = (findDisplay 46) displayAddEventHandler ["MouseButtonDown",{
	if ((_this select 1) isEqualTo 0) then {
		switch (true) do {
			case (ALF_PoissonSousLeau): {
				ALF_PoissonSortieDeLeau = true;
			};
			case (ALF_PecheEnCours): {
				ALF_perteHammecon = true;
			};
		};
	};
}];

player playActionNow "ALF_peche_jeteligne";
sleep 1;
private _dirAdd = (-30) + random(60);
private _speed = 20;
private _dir = (getdir player) + _dirAdd;
private _vehicle = createVehicle ["ALF_BouchonPeche", [0,0,0],[], 0, "CAN_COLLIDE"];
_vehicle setPos [getpos player select 0, getpos player select 1, (getpos player select 2) + 3];
private _vel = velocity _vehicle;
_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2) + 12];
playSound3D ["ALF_Peche\sounds\cast2.ogg", player, false, getPosASL player, 5, 1, 35];

sleep 2.5;

if !(surfaceIsWater (getpos _vehicle)) exitwith {
	(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",_handler];
	["Info", "Vous avez perdu votre appât.", "danger"] spawn ALF_fnc_doMsg;
	deleteVehicle _vehicle;
};

["Info", "Votre lancée a été réussi", "success", false] spawn ALF_fnc_doMsg;
playSound3D ["ALF_Peche\sounds\splash.ogg", player, false, getPosASL _vehicle, 25, 1, 85];

private _myStartSpot = getpos player;
ALF_PoissonSousLeau = false;
ALF_PoissonSortieDeLeau = false;
ALF_PecheEnCours = true;
private _pos = [0,0,0];
ALF_perteHammecon = false;
private _pasdepoisson = false;

while {player distance _myStartSpot < 5 && !ALF_PoissonSortieDeLeau && !ALF_perteHammecon && ALF_PecheEnCours} do {
	if (((getPosASL _vehicle) select 2) > -0.1 && !ALF_PoissonSousLeau) then {
		private _number = random 100;
		if (_number < 8) then {
			_pos = getPosASL _vehicle;
			_vehicle setPosASL [_pos select 0, _pos select 1, (_pos select 2) - 4];
			ALF_PoissonSousLeau = true;
		};
	} else {
		if (((getPosASL _vehicle) select 2) > -0.5 && ALF_PoissonSousLeau) then {
			ALF_PoissonSousLeau = false;
			ALF_perteHammecon = true;
		};
	};
	sleep 0.5;
};

if (ALF_PecheEnCours) then {
	_pasdepoisson = true;
};
ALF_PoissonSortieDeLeau = false;
ALF_PoissonSousLeau = false;
if (player distance _myStartSpot > 5) exitWith {
	ALF_PecheEnCours = false;
	(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",_handler];
	["Info", "Vous avez perdu votre appât en allant trop loin de votre position original.", "danger"] spawn ALF_fnc_doMsg;
	deleteVehicle _vehicle;
};

if (ALF_perteHammecon) exitWith {
	ALF_PecheEnCours = false;
	(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",_handler];
	["Info", "Vous avez perdu votre appât.", "danger"] spawn ALF_fnc_doMsg;
	deleteVehicle _vehicle;
};

_vehicle setPosASL [_pos select 0, _pos select 1, (_pos select 2) + 1];
_vel = velocity _vehicle;
_vehicle setVelocity [(_vel select 0),(_vel select 1),(_vel select 2) + 0.5];

sleep 0.5;

_dir = _dir - 180;
_vel = velocity _vehicle;
_speed = 50;

disableUserInput true;

private _timeOut = 0;
playSound3D ["ALF_Peche\sounds\splash.ogg", player, false, getPosASL _vehicle, 25, 1, 85];
sleep 0.5;
playSound3D ["ALF_Peche\sounds\wind2.ogg", player, false, getPosASL player, 5, 1, 35];

player playmove "AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon_gear";

while{_timeOut < 20 && _vehicle distance2D player > 5} do {
	_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) + 0.2];
	_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2) + ([1,3] call BIS_fnc_randomNum)];
	sleep 1;
	_timeOut = _timeOut + 1;
	player playaction "CRPTHSForwardStandLowered";
};

(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",_handler];
playSound3D ["ALF_Peche\sounds\splash.ogg", player, false, getPosASL player, 5, 1, 45];
player addmagazine "cebos";
deletevehicle _vehicle;
player playmove "";
disableUserInput false;
["ALF_appat",true] spawn life_fnc_handleItem;

private _p = "ALF_Maquereau_Crue_M";
switch (alf_niv_peche) do {
	case 0: {_p = "ALF_Maquereau_Crue_M"; [2,3] spawn ALF_fnc_addXP;};
	case 1: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine"]; [2,3] spawn ALF_fnc_addXP;};
	case 2: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine", "ALF_Thon"]; [2,4] spawn ALF_fnc_addXP;};
	case 3: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine", "ALF_Thon", "ALF_Barbeau"]; [2,4] spawn ALF_fnc_addXP;};
	case 4: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine", "ALF_Thon", "ALF_Barbeau", "ALF_Brochet"]; [2,5] spawn ALF_fnc_addXP;};
	case 5: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine", "ALF_Thon", "ALF_Barbeau", "ALF_Brochet", "ALF_Anguille"]; [2,6] spawn ALF_fnc_addXP;};
	case 6: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine", "ALF_Thon", "ALF_Barbeau", "ALF_Brochet", "ALF_Anguille"]; [2,6] spawn ALF_fnc_addXP;};
	case 7: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine", "ALF_Thon", "ALF_Barbeau", "ALF_Brochet", "ALF_Anguille","ALF_Saumon"]; [2,7] spawn ALF_fnc_addXP;};
	case 8: {_p = selectRandom ["ALF_Maquereau_Crue_M", "ALF_Sardine", "ALF_Thon", "ALF_Barbeau", "ALF_Brochet", "ALF_Anguille","ALF_Saumon","ALF_Squale"]; [2,7] spawn ALF_fnc_addXP;};
};

[_p,true] spawn life_fnc_handleItem;
ALF_PecheEnCours = false;
["Peche", "Vous avez récuperé un poisson.", "success"] spawn ALF_fnc_doMsg;
