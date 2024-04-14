private["_g","_b"];
if (isServer) then 
{
	_g = _this;
	_b = _g nearObjects ["ReammoBox_F", 25];
	_b append (_g nearObjects ["Shelter_base_F", 25]);
	_b append (_g nearObjects ["FlagCarrierCore", 25]);
	{
		_x setDamage ( 0.1 + damage _x);
	} forEach _b;
	_b = _g nearObjects ["WeaponHolder", 25];
	_b append (_g nearObjects ["WeaponHolderSimulated", 25]);
	{
		deleteVehicle _x;
	} forEach _b;
};
