/*
	File: fn_interaction3D.sqf
	Author: ALF - NiiRoZz
*/

ALF_3DInteraction_Selected = -1;
ALF_3DInteractionScript_Selected = "";
ALF_3DInteraction_CursorObject = objNull;
ALF_fnc_interaction3DEachFrame = compileFinal "
	lineIntersectsSurfaces [
		AGLToASL positionCameraToWorld [0,0,0], 
		AGLToASL positionCameraToWorld [0,0,5], 
		player,
		objNull,
		true,
		1,
		""VIEW"",
		""GEOM""
	] select 0 params ["""","""","""",[""_obj"",objNull,[objNull]]];

	if !(isNull _obj) then {
		{
			if (_obj isKindOf (configName _x) || {((str _obj) find (configName _x)) > -1}) then {
				{
					private ""_pos"";
					private _posModel = _x select 0;
					private _exit = false;
					if (_posModel isEqualType []) then {
						_pos = _obj modelToWorldVisual _posModel;
					} else {
						if ((_obj selectionPosition _posModel) isEqualTo [0,0,0]) exitWith {_exit = true;};
						_pos = _obj modelToWorldVisual (_obj selectionPosition _posModel);
					};
					private _w2s = worldToScreen _pos;
					if (!_exit && {count _w2s >= 2} && {(player distance _pos) <= (_x select 3)} && {[_obj] call compile (_x select 4)}) then {
						private _selected = ((_w2s distance (worldToScreen (positionCameraToWorld [0,0,1]))) < 0.08);
						if (_selected && {!(_forEachIndex isEqualTo ALF_3DInteraction_Selected)}) then {
							ALF_3DInteraction_Selected = _forEachIndex;
							ALF_3DInteractionScript_Selected = _x select 5;
							ALF_3DInteraction_CursorObject = _obj;
						} else {
							if (!_selected && {_forEachIndex isEqualTo ALF_3DInteraction_Selected}) then {
								ALF_3DInteraction_Selected = -1;
								ALF_3DInteractionScript_Selected = """";
								ALF_3DInteraction_CursorObject = objNull;
							};
						};

						drawIcon3D [(_x select 2), [1,1,1,1], _pos, 0.75, 0.75, 0, (_x select 1), 1, 0.035, ""PuristaMedium"", ""center"", false];
						if (_selected && {_forEachIndex isEqualTo ALF_3DInteraction_Selected}) then {
							drawIcon3D [""\a3\ui_f\data\IGUI\Cfg\Cursors\selectOver_ca.paa"", [1,1,1,1], _pos, 1.25, 1.25, 0, """", 0, 0];
						};
					} else {
						if (_forEachIndex isEqualTo ALF_3DInteraction_Selected) then {
							ALF_3DInteraction_Selected = -1;
							ALF_3DInteractionScript_Selected = """";
							ALF_3DInteraction_CursorObject = objNull;
						};
					};
				} forEach (getArray (_x >> ""Interactions""));
			};
		} forEach (""true"" configClasses (configFile >> ""ALF_CfgInteraction3D""));
	};
";
addMissionEventHandler ["EachFrame", {call ALF_fnc_interaction3DEachFrame}];