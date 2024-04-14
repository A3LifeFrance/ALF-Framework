#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_adnCreate.sqf
	Author: ALF Nanou
*/
private _codeAdn = _this select 0;
private _motif = _this select 1;
_motif = toArray _motif;
private _unit = _this select 2;
private _count = ([format["SELECT COUNT(*) FROM gen_face WHERE code_face='%1'",_codeAdn],2] call HC_fnc_asyncCall) select 0;

if(_count isEqualTo 0) then {
	[format["INSERT INTO gen_face (code_face, text_info) VALUES ('%1','%2')",_codeAdn,_motif],1] call HC_fnc_asyncCall;
	["Faciès", "Le dossier a bien été créé.", "success"] remoteExec ["ALF_fnc_doMsg",_unit];
} else {
	[format["UPDATE gen_face SET text_info='%1' WHERE code_face='%2'",_motif,_codeAdn],1] call HC_fnc_asyncCall;
	["Faciès", "Les informations ont bien été mise à jour.", "success"] remoteExec ["ALF_fnc_doMsg",_unit];
};
