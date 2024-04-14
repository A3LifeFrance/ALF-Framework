#include "\ALF_Client\script_macros.hpp"
/*
File: fn_lbArmurerie.sqf
Author: ALF Team
*/
private["_itemPic","_thisitem","_itemInfo","_item","_texte"];
_item = lbData[24512,lbCurSel(24512)];
_item = call compile format["%1",_item];
_thisitem = _item select 0;
_itemInfo = [_thisitem] call life_fnc_fetchCfgDetails;
_itemPic = _itemInfo select 2;
_texte = (findDisplay 24500) displayCtrl 24514;
_texte ctrlSetStructuredText parseText format["<img image='%1' align='center' style='114' size='6'/>",_itemPic];
