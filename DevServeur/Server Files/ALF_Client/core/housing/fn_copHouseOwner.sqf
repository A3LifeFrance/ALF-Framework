/*
	File: fn_copHouseOwner.sqf
	Author: ALF TEAM
*/
ALF_House_Data params [
	["_house_owner",[],[[]]]
];
if(count(_house_owner) isEqualTo 0) exitWith {};

hint parseText format["<t color='#FF0000'><t size='2'>" +(localize "STR_House_Raid_Owner")+ "</t></t><br/>%1",_house_owner select 1];
