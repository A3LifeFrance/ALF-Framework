/*
	File: fn_donDuSang.sqf
*/
params [
	["_chaise",objNull,[objNull]]
];
if(isNull _chaise) exitWith {};

_chaise setVariable ["ALF_player_usingChaise",true,true];

private _time = 0;

for "_i" from 0 to 1 step 0 do {
	if (((count (fullCrew [_chaise, "cargo", false])) isEqualTo 0) || {isNull _chaise}) exitWith {};
	if !(_chaise getVariable ["ALF_player_usingChaise", false]) exitWith {};
	if (_time >= 720) exitWith {};

	_time = _time + 1;

	switch (true) do {
		case (_time >= 120 && {_time < 360} && {!((toLower ((getObjectTextures _chaise) select 0)) isEqualTo "alf_centrepompier\alf_don_sang\sang\perfusion_vide.paa")}): {
			_chaise setObjectTextureGlobal [0, "ALF_CentrePompier\ALF_Don_Sang\Sang\Perfusion_vide.paa"];
		};

		case (_time >= 360 && {_time < 480} && {!((toLower ((getObjectTextures _chaise) select 0)) isEqualTo "alf_centrepompier\alf_don_sang\sang\perfusion_presquevide.paa")}): {
			_chaise setObjectTextureGlobal [0, "ALF_CentrePompier\ALF_Don_Sang\Sang\Perfusion_presquevide.paa"];
		};

		case (_time >= 480 && {_time < 600} && {!((toLower ((getObjectTextures _chaise) select 0)) isEqualTo "alf_centrepompier\alf_don_sang\sang\perfusion_moitierpleine.paa")}): {
			_chaise setObjectTextureGlobal [0, "ALF_CentrePompier\ALF_Don_Sang\Sang\Perfusion_moitierpleine.paa"];
		};

		case (_time >= 600 && {_time < 720} && {!((toLower ((getObjectTextures _chaise) select 0)) isEqualTo "alf_centrepompier\alf_don_sang\sang\perfusion_presquepleine.paa")}): {
			_chaise setObjectTextureGlobal [0, "ALF_CentrePompier\ALF_Don_Sang\Sang\Perfusion_presquepleine.paa"];
		};

		case (_time >= 720 && {!((toLower ((getObjectTextures _chaise) select 0)) isEqualTo "alf_centrepompier\alf_don_sang\sang\perfusion_pleine.paa")}): {
			_chaise setObjectTextureGlobal [0, "ALF_CentrePompier\ALF_Don_Sang\Sang\Perfusion_Pleine.paa"];
		};
	};

	uiSleep 1;
};

if (isNull _chaise) exitWith {};

_chaise setVariable ["ALF_player_usingChaise",false,true];

if (_time >= 720) then {
	playSound3D ["ALF_CentrePompier\ALF_Don_Sang\son\beep.ogg", _chaise, false, getPosASL _chaise, 2, 1, 10];
};
