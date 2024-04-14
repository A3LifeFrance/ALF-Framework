#include "script_component.hpp"

/*
  Name: TFAR_fnc_sendSpeakerRadios

  Author: Dedmen
    sends infos about speakerradios to plugin

  Arguments:
    None

  Return Value:
    None

  Example:
    call TFAR_fnc_sendSpeakerRadios;

  Public: Yes
*/


//If there is no one near the player this would execute every 2 frames.. which is total overkill
private _lastExec = GVAR(VehicleConfigCacheNamespace) getVariable "TFAR_fnc_sendSpeakerRadioslastExec"; //Magic feat commy2
if ((diag_tickTime - _lastExec) < 0.5) exitWith {TFAR_speakerRadios = [];}; //Don't run if we already ran less than 500ms ago
GVAR(VehicleConfigCacheNamespace) setVariable ["TFAR_fnc_sendSpeakerRadioslastExec",diag_tickTime];

//TFAR_speakerRadios are radios carried by people that are on speaker
private _speakerRadios = TFAR_speakerRadios;

//Get radios on ground
{
    private _pos = getPosASL _x;
    private _waveZ = _pos select 2;
    if (_waveZ > 0) then {
        {
            if ((_x call TFAR_fnc_isRadio) and {_x call TFAR_fnc_getSwSpeakers}) then {
                private _radioCode = _x call TFAR_fnc_getSwRadioCode;
                private _frequencies = [format ["%1%2", _x call TFAR_fnc_getSwFrequency, _radioCode]];
                private _additionalChannel = _x call TFAR_fnc_getAdditionalSwChannel;
                if (_additionalChannel > -1) then {
                    _frequencies pushBack format ["%1%2", [_x, _additionalChannel + 1] call TFAR_fnc_getChannelFrequency, _radioCode];
                };

                _speakerRadios pushBack ([_x/*radio_id*/,_frequencies joinString "|",""/*nickname*/,_pos,_x call TFAR_fnc_getSwVolume, "no"/*vehicle*/] joinString TF_new_line);
            };
        } forEach ((getItemCargo _x) select 0);

        {
            if  ((_x getVariable ["TFAR_LRSpeakersEnabled", false]) and {[typeof (_x), "tf_hasLRradio", 0] call TFAR_fnc_getVehicleConfigProperty == 1}) then {
                private _manpack = [_x, "radio_settings"];
                if (_manpack call TFAR_fnc_getLrSpeakers) then {
                    private _radioCode = _manpack call TFAR_fnc_getLrRadioCode;
                    private _frequencies = [format ["%1%2", _manpack call TFAR_fnc_getLrFrequency, _radioCode]];
                    private _additionalChannel = _manpack call TFAR_fnc_getAdditionalLrChannel;
                    if (_additionalChannel > -1) then {
                        _frequencies pushBack format ["%1%2", [_manpack, _additionalChannel + 1] call TFAR_fnc_getChannelFrequency, _radioCode];
                    };
                    private _radio_id = netId _x;
                    _speakerRadios pushBack ([_radio_id,_frequencies joinString "|",""/*nickname*/,_pos,_manpack call TFAR_fnc_getLrVolume, "no"/*vehicle*/] joinString TF_new_line);
                };
            };
        } forEach (everyBackpack _x);
    };
} forEach ((TFAR_currentUnit nearSupplies TF_speakerDistance) - [TFAR_currentUnit]);
//#TODO doesn't catch static LRRadio backpacks on ground because they are not in any Holder
//Are you sure? nearestObjects seems to return a container and backpacks returns radio backpacks.. Should verify that again It may not see them because of TFAR_LRSpeakersEnabled not set

//Get vehicle radios on speaker
{
    if ((_x getVariable ["TFAR_LRSpeakersEnabled", false]) and {_x call TFAR_fnc_hasVehicleRadio}) then {
        private _pos = getPosASL _x;
        if (_pos select 2 >= TF_UNDERWATER_RADIO_DEPTH) then {
            private _lrs = [];

            if (isNull (gunner _x) && {count (_x getVariable ["gunner_radio_settings", []]) > 0}) then {
                _lrs pushBack [_x, "gunner_radio_settings"];
            };
            if (isNull (driver _x) && {count (_x getVariable ["driver_radio_settings", []]) > 0}) then {
                _lrs pushBack [_x, "driver_radio_settings"];
            };
            if (isNull (commander _x) && {count (_x getVariable ["commander_radio_settings", []]) > 0}) then {
                _lrs pushBack [_x, "commander_radio_settings"];
            };
            if (isNull (_x call TFAR_fnc_getCopilot) && {count (_x getVariable ["turretUnit_0_radio_setting", []]) > 0}) then {
                _lrs pushBack [_x, "turretUnit_0_radio_setting"];
            };

            {
                if (_x call TFAR_fnc_getLrSpeakers) then {
                    private _radioCode = _x call TFAR_fnc_getLrRadioCode;
                    private _frequencies = [format ["%1%2", _x call TFAR_fnc_getLrFrequency, _radioCode]];
                    private _additionalChannel = _x call TFAR_fnc_getAdditionalLrChannel;
                    if (_additionalChannel > -1) then {
                        _frequencies pushBack format["%1%2", [_x, _additionalChannel + 1] call TFAR_fnc_getChannelFrequency, _radioCode];
                    };

                    private _vehicle = _x select 0;

                    private _radio_id = netId (_x select 0) + (_x select 1);

                    private _netID = _vehicle getVariable ["TFAR_vehicleIDOverride", netid _vehicle];
                    private _isolation = [_netID, [(typeof _vehicle), "tf_isolatedAmount", 0.0] call TFAR_fnc_getVehicleConfigProperty, -1] joinString (toString [16]);

                    _speakerRadios pushBack ([_radio_id,_frequencies joinString "|","",_pos,_x call TFAR_fnc_getLrVolume, "no"] joinString TF_new_line);
                };
            } forEach _lrs;
        };

    };
} forEach (TFAR_currentUnit nearEntities [["LandVehicle", "Air", "Ship"], TF_speakerDistance]);

/* Megaphone GN */
{
	_freq = _x getVariable ["Megaphone",0];
    if (_freq > 0) then {
		if (TFAR_currentUnit in crew _x) then {
			_speakerRadios pushBack ([netId _x, [format ["%1%2", _freq, "_bluefor"]] joinString "|", "", getPosASL _x, 5, "no"] joinString TF_new_line);
		} else {
			_speakerRadios pushBack ([netId _x, [format ["%1%2", _freq, "_bluefor"]] joinString "|", "", getPosASL _x, 12, "no"] joinString TF_new_line);
		};
    };
} forEach (TFAR_currentUnit nearEntities [["LandVehicle", "Air", "Ship"], 100]);

private _unit_pos = eyepos TFAR_currentUnit;
{
	if(_x getVariable ["tourradio_speakers", false]) then {
		_pos = getPosASL _x;
		_p = [(_pos select 0) - (_unit_pos select 0), (_pos select 1) - (_unit_pos select 1), (_pos select 2) - (_unit_pos select 2)];
		_freq = format ["%1%2", 888, "_bluefor"];
		_speakerRadios pushBack (format ["%1%2%3%4%5%6%7%8%9%10%11%12%13", _x, TF_new_line, _freq, TF_new_line,  "", TF_new_line, _p, TF_new_line, 8, TF_new_line, "no", TF_new_line, _pos select 2]);		
	};
} forEach (nearestObjects [TFAR_currentUnit, ["Land_PCSet_01_screen_F"],10]);

if((TFAR_currentUnit distance alf_prison_cour) <= 36) then {
	private _pos = getPosASL alf_prison_cour;
    private _frequencies = [format ["%1%2", 150, "_bluefor"]];
    _speakerRadios pushBack (["alf_prison_cour"/*radio_id*/,_frequencies joinString "|",""/*nickname*/,_pos/*pos*/,10/*volume*/, "no"/*vehicle*/] joinString TF_new_line);
};

if((TFAR_currentUnit distance alf_prison_couloir) <= 25) then {
	private _pos = getPosASL alf_prison_couloir;
	private _frequencies = [format ["%1%2", 151, "_bluefor"]];
	_speakerRadios pushBack (["alf_prison_couloir"/*radio_id*/,_frequencies joinString "|",""/*nickname*/,_pos/*pos*/,10/*volume*/, "no"/*vehicle*/] joinString TF_new_line);
};

if((TFAR_currentUnit distance alf_circuit_hp) <= 70) then {
	private _pos = getPosASL alf_circuit_hp;
	private _frequencies = [format ["%1%2", 1616, "_bluefor"]];
	_speakerRadios pushBack (["alf_circuit_hp"/*radio_id*/,_frequencies joinString "|",""/*nickname*/,_pos/*pos*/,10/*volume*/, "no"/*vehicle*/] joinString TF_new_line);
};

if((TFAR_currentUnit distance alf_pompier_LP) <= 60) then {
	private _pos = getPosASL alf_pompier_LP;
	private _frequencies = [format ["%1%2", 1617, "_bluefor"]];
	_speakerRadios pushBack (["alf_pompier_LP"/*radio_id*/,_frequencies joinString "|",""/*nickname*/,_pos/*pos*/,10/*volume*/, "no"/*vehicle*/] joinString TF_new_line);
};

{
	if((TFAR_currentUnit distance _x) <= 50) then {
		private _pos = getPosASL _x;
		private _frequencies = [format ["%1%2", 1618, "_bluefor"]];
		_speakerRadios pushBack ([format["%1",_x]/*radio_id*/,_frequencies joinString "|",""/*nickname*/,_pos/*pos*/,10/*volume*/, "no"/*vehicle*/] joinString TF_new_line);
	};
} forEach [alf_gendarmerie_LP_1,alf_gendarmerie_LP_2,alf_gendarmerie_LP_3,alf_gendarmerie_LP_4];

{
	if((TFAR_currentUnit distance _x) <= 60) then {
		private _pos = getPosASL _x;
		private _frequencies = [format ["%1%2", 1720, "_bluefor"]];
		_speakerRadios pushBack ([format["%1",_x]/*radio_id*/,_frequencies joinString "|",""/*nickname*/,_pos/*pos*/,10/*volume*/, "no"/*vehicle*/] joinString TF_new_line);
	};
} forEach [alf_pref_LP_1,alf_pref_LP_2,alf_pref_LP_3,alf_pref_LP_4,alf_pref_LP_5,alf_pref_SZ_1,alf_pref_SZ_2,alf_pref_SZ_3,alf_pref_SZ_4,alf_pref_airport,alf_pref_LC_1,alf_pref_LC_2];

private _empty = (count _speakerRadios == 0);
//If we didn't have speakers in last call and don't have any now. Skip calling Extension
if (!(missionnamespace getVariable ["TFAR_hadSpeakers",false]) && _empty) exitWith {};
TFAR_hadSpeakers = !_empty;

"task_force_radio_pipe" callExtension format["SPEAKERS	%1~",_speakerRadios joinString TF_vertical_tab];//Async call will always return "OK"
TFAR_speakerRadios = [];
