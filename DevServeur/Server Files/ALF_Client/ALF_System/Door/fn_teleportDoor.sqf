params ["_player", "_pos", "_model", "_dir", "_elev"];

cutText ["","BLACK OUT"];

private _weapon = currentWeapon _player;
private _move = "";
switch (true) do {
    case (_weapon isKindOf ["Rifle", configFile >> "CfgWeapons"]): {
        _move = "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
    };
    case (_weapon isKindOf ["Pistol", configFile >> "CfgWeapons"]): {
        _move = "AmovPercMstpSrasWpstDnon_AinvPercMstpSrasWpstDnon_Putdown";
    };
    case (_weapon isKindOf ["Launcher", configFile >> "CfgWeapons"]): {
        _move = "AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon_Putdown";
    };
    case (_weapon == ""): {
        _move = "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
    };
};

_player playMoveNow _move;
disableUserInput true;

uisleep 1.5;

_player allowDamage false;
_player hideObjectGlobal true;
_player enableSimulationGlobal false;

uisleep 3;

player setDir _dir;
_player setPosATL _pos;

_player allowDamage true;
_player hideObjectGlobal false;
_player enableSimulationGlobal true;

_player setFatigue (getFatigue _player)/2;

cutText ["","BLACK IN"];

disableUserInput false;