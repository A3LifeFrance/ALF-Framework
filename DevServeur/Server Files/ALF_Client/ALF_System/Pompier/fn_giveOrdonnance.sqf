/*
fiveordonnance
Adam
*/
_unit = _this select 0;
if ((alf_ordonnance select 0) > 2 && {
    (alf_ordonnance select 1) > 1
}) exitwith {
    ["ERREUR", "Cette personne a déjà une ordonnance en cours.", "danger"] remoteExec ["ALF_fnc_doMsg", _unit];
};

alf_ordonnance = [7, 5];
[21] call SOCK_fnc_updatePartial;

["MEDECin", "Vous avez fait une ordonnance à cette personne.", "success"] remoteExec ["ALF_fnc_doMsg", _unit];
["ordoNNACE", "Vous avez reçu une ordonnance de 7 jours.", "success"] spawn ALF_fnc_doMsg;