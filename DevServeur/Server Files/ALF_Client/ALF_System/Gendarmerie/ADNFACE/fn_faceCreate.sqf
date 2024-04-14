#include "\ALF_Client\script_macros.hpp"
/*
File: fn_adnCreate.sqf
Author: ALF Team
*/
private _codeadn = ctrlText 13503;
private _motif = ctrlText 13504;
if(_codeadn isEqualTo "" OR {_motif isEqualTo ""}) exitWith {["INFO","Un champ est vide.","warning"] spawn ALF_fnc_doMsg;};
private _length = count (toArray(_codeadn));
private _length2 = count (toArray(_motif));
private _chrByte = toArray (_codeadn);
private _chrByte2 = toArray (_motif);
private _allowed = toArray("0123456789");
private _allowed2 = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,-'/[]éà€!?;:êè)(=+&<>*$ ");
if !(_length isEqualTo 8) exitWith {["INFO","Le code faciès est invalide.","warning"] spawn ALF_fnc_doMsg;};
if (_length2 > 300) exitWith {["INFO","Tu ne peux ecrire que 300 caractères max.","warning"] spawn ALF_fnc_doMsg;};
private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte2;
if(_badChar) exitWith {["INFO","Le code faciès est invalide.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Es-tu sûr de vouloir creer ce dossier, s'il existe dejà, le motif sera ecrase et mit à jour.","Faciès","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {};

[_codeadn,_motif,player] remoteExec ["HC_fnc_faceCreate",HC_Life];
closeDialog 0;
