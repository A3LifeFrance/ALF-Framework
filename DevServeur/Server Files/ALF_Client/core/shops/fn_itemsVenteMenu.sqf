#include "\ALF_Client\script_macros.hpp"

private["_shopTitle"];
_shopTitle = M_CONFIG(getText,"ItemsVente",(SEL(_this,3)),"name");
uiNamespace setVariable ["Items_Vente",SEL(_this,3)];
if(!(createDialog "life_itemsvente")) exitWith {};
if(!isClass(missionConfigFile >> "ItemsVente" >> (SEL(_this,3)))) exitWith {}; //Bad config entry.
disableSerialization;
ctrlSetText[39401,_shopTitle];

[] call life_fnc_itemsVenteLoad;
