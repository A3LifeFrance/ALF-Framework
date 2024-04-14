private ["_config", "_path", "_count", "_index"];
_config = _this select 0;
_path = _this select 1;
_config = _config >> "Turrets";
_count = count _config;
for "_index" from 0 to (_count - 1) do
{
	_turrets set [count _turrets, _path + [_index]];
	[_config select _index, [_index]] call KA_fnc_addTurret;
};
