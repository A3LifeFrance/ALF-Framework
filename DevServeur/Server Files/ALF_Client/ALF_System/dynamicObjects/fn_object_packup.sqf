_object = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _object || {life_action_inUse}) exitWith {};

private _item = getText(missionConfigFile >> "ALF_OBJECTS" >> typeOf(_object) >> "item");

private _condition = getText(missionConfigFile >> "ALF_OBJECTS" >> typeOf(_object) >> "conditionRecup");

if !(_condition isEqualTo "") then {
	if (call compile format["%1",_condition]) exitWith {};
};

if (!(player canAdd _item)) exitWith {["INFO", "Tu n'as pas assez de place.", "danger"] spawn ALF_fnc_doMsg;};

private _action = ["Souhaitez-vous ramasser cet object ?","OBJET","Oui","Non"] call BIS_fnc_guiMessage;

if (_action) then {
	life_action_inUse = true;
	life_action_delay = time;
	
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	
	[] spawn {
		uiSleep(random(1) + 0.20);
	};
	
	if (isNull _object) exitWith {life_action_inUse = false;};
	
	player addMagazine _item;
	deleteVehicle _object;
	
	["INFO", "Vous avez récupéré cet objet.", "success"] spawn ALF_fnc_doMsg;
	
	life_action_inUse = false;
};