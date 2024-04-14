/*
	File: fn_initHouses.sqf
*/
params[
	["_data",[],[[]]]
];
life_houses = _data;

if(count(life_houses) > 0) then {
	{
		private _position = call compile format["%1",_x];
		private _house = nearestObject [_position, "House"];

		if !(_house in life_vehicles) then {
			life_vehicles pushBack _house;
		};
		
		private _uid = round(random 99999);
		_house setVariable ["uid",_uid];
		private _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

		private _marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
		_marker setMarkerTextLocal (_houseName + "#" + str(_uid));
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "loc_Lighthouse";
	} forEach life_houses;
};
