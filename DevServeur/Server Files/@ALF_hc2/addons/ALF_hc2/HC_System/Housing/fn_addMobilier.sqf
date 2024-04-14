/*
	File : fn_addmobilier
	Author: ALF Team
*/
params [
	["_uid","",[""]],
	["_mobilier",objNull,[objNull]],
	["_house",objNull,[objNull]],
	["_className","",[""]],
	["_pos",[],[[]]],
	["_dir",0,[0]],
	["_activeMun","",[""]]
];
if(isNull _mobilier || {_uid isEqualTo ""} || {isNull _house} || {count(_pos) isEqualTo 0} || {_className isEqualTo ""}) exitWith {};

private _mobiliers = _house getVariable ["mobiliers",[]];

//On vérifie si le nombre de mobilier est atteint ou non.
private _exit = false;
if((typeOf _house) isEqualTo "Land_ALF_Entreprise") then {
	if(count(_mobiliers) >= 35) exitWith {
		_exit = true;
	};
} else {
	private _houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
	if(count(_mobiliers) >= (_houseCfg select 1)) exitWith {
		_exit = true;
	};
};
if(_exit) exitWith {
	["ERREUR","Il y a déjà trop de mobilier","danger"] remoteExec ["ALF_fnc_doMsg",(remoteExecutedOwner)];
	deleteVehicle _mobilier;
	[_activeMun,true] remoteExec ["life_fnc_handleItem",(remoteExecutedOwner)];
};

//On vérifie si c'est le propriétaire.
if((typeOf _house) isEqualTo "Land_ALF_Entreprise") then {
	private _owner = _house getVariable["business",[""]] select 0;
	if !(_uid isEqualTo _owner) exitWith {
		_exit = true;
	};
} else {
	private _owner = _house getVariable["house_owner",[""]] select 0;
	if !(_uid isEqualTo _owner) exitWith {
		_exit = true;
	};
};
if(_exit) exitWith {
	["ERREUR","Tu n'es pas le propriétaire.","danger"] remoteExec ["ALF_fnc_doMsg",(remoteExecutedOwner)];
	deleteVehicle _mobilier;
	[_activeMun,true] remoteExec ["life_fnc_handleItem",(remoteExecutedOwner)];
};

//On vérifie si quand il met un compteur qu'il y en a deja pas un
if(((getModelInfo _mobilier) select 1) in ["alf_batiments\alf_edf\alf_utility_box_8.p3d","alf_batiments\alf_edf\alf_utility_box_3.p3d","alf_batiments\alf_edf\alf_utility_box_2.p3d"] && {{((getModelInfo _x) select 1) in ["alf_batiments\alf_edf\alf_utility_box_8.p3d","alf_batiments\alf_edf\alf_utility_box_3.p3d","alf_batiments\alf_edf\alf_utility_box_2.p3d"]} count _mobiliers > 0}) then {
	_exit = true;
};
if(_exit) exitWith {
	["ERREUR","Tu ne peux pas poser un compteur, car tu as déja un compteur dans ta maison.","danger"] remoteExec ["ALF_fnc_doMsg",(remoteExecutedOwner)];
	deleteVehicle _mobilier;
	[_activeMun,true] remoteExec ["life_fnc_handleItem",(remoteExecutedOwner)];
};

//On vérifie si quand il met un coco qu'il y en a deja pas un
if(_activeMun isEqualTo "ALF_Coco_boite" && {{((getModelInfo _x) select 1) in ["alf_batiments\alf_h_cocaine\alf_coco.p3d"]} count _mobiliers > 0}) then {
	_exit = true;
};
if(_exit) exitWith {
	["ERREUR","Tu ne peux pas poser un atelier, car tu as déja posé un.","danger"] remoteExec ["ALF_fnc_doMsg",(remoteExecutedOwner)];
	deleteVehicle _mobilier;
	[_activeMun,true] remoteExec ["life_fnc_handleItem",(remoteExecutedOwner)];
};

//C'est le propriétaire, et il n'a pas atteint le nombre maximale de coffre.
_mobiliers pushBack _mobilier;
_house setVariable ["mobiliers",_mobiliers];

private "_siret";
if((typeOf _house) isEqualTo "Land_ALF_Entreprise") then {
	_siret = _house getVariable["business",["","",""]] select 2;
	[format["INSERT INTO mobiliers (pid, pos, classname, gear, dir, code) VALUES('%1', '%2', '%3', '""[]""', '%4', '0000')",_siret,_pos,_className,_dir],1] call HC_fnc_asyncCall;
} else {
	[format["INSERT INTO mobiliers (pid, pos, classname, gear, dir, code) VALUES('%1', '%2', '%3', '""[]""', '%4', '0000')",_uid,_pos,_className,_dir],1] call HC_fnc_asyncCall;
};

uiSleep 0.3;

//Fix mobilier entreprise.
private "_queryResult";
if((typeOf _house) isEqualTo "Land_ALF_Entreprise") then {
	_queryResult = [format["SELECT id, code FROM mobiliers WHERE pos='%1' AND pid='%2'",_pos,_siret],2] call HC_fnc_asyncCall;
} else {
	_queryResult = [format["SELECT id, code FROM mobiliers WHERE pos='%1' AND pid='%2'",_pos,_uid],2] call HC_fnc_asyncCall;	
};

_mobilier setVariable ["mobilier_data",[_uid,(_queryResult select 0),_className,_house,"0000",false]];

_mobilier setVariable ["gear",[],true];
