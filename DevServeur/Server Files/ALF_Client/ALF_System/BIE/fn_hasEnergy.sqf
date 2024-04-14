/*
	File: hasEnergy
	Author: ALF Team
*/
params[
	["_object",objNull,[objNull]],
	["_isHouse",false,[false]]
];
if(isNull _object) exitWith {true};

//On sélectionne les secteurs qui alimentent l'objet.
private _secteurs = ["bie_secteur_1","bie_secteur_2","bie_secteur_3"] select {_object inArea _x};
if(_secteurs isEqualTo []) exitWith {true};

//On compte les secteurs
private _count = {(_x select 0) in _secteurs && {((_x select 1) animationSourcePhase "disable_source") < 0.5}} count [["bie_secteur_1",ALF_BIE_SECTEUR_1],["bie_secteur_2",ALF_BIE_SECTEUR_2],["bie_secteur_3",ALF_BIE_SECTEUR_3]];

if (_isHouse) then {
	[true,false] select (_count isEqualTo 0)
} else {
	[true,false] select (_count isEqualTo 0)
};