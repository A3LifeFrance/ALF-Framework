/*
	File: fn_initLocaux.sqf
*/
private _pos = [
				[[6914,8482,0],"Land_MilOffices_V1_F"]
			   ];

{
	private _obj = nearestObject[_x select 0, _x select 1];
	_obj setVariable ["ALF_PorteFermer",true,true];
} forEach _pos;