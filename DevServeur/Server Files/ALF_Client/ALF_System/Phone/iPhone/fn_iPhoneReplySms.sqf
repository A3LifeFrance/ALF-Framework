#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneReplySms.sqf
Author: ALF Team
Description:

*/
disableSerialization;

if(EQUAL((lbCurSel 682561),-1)) exitWith {hint "Il faut selectionner quelqu'un."};
_data = CONTROL_DATA(682561);
_data = call compile format["%1", _data];
_numero = _data select 0;
_name = _data select 1;
_anonyme = _data select 3;
if(_anonyme isEqualTo "1") exitWith {hint "Tu ne peux pas lui repondre."};

private _display = findDisplay 56400;
private _menu1sim = _display displayCtrl 56401;
private _menu1btntel = _display displayCtrl 564011;
private _menu1btnsms = _display displayCtrl 564012;
private _menu1btncontacts = _display displayCtrl 564013;
private _menu1btnreglages = _display displayCtrl 564014;
private _menu1nosim = _display displayCtrl 56402;
private _menu1nosimok = _display displayCtrl 564021;
private _menu1appelentrant = _display displayCtrl 56403;
private _menu1appel = _display displayCtrl 56404;
private _menu1Name = _display displayCtrl 564041;
private _menu1Num = _display displayCtrl 564042;
private _menu1Time = _display displayCtrl 564043;
private _menu1rouge = _display displayCtrl 564044;
private _menu1vert = _display displayCtrl 564045;
private _menu1rouge2 = _display displayCtrl 564046;
private _menu1volp = _display displayCtrl 564048;
private _menu1volm = _display displayCtrl 564049;

private _menu2telephone = _display displayCtrl 56405;
private _menu2btnappel = _display displayCtrl 564051;
private _menu2numedit = _display displayCtrl 564052;

private _menu3contacts = _display displayCtrl 56406;
private _menu3contactslist = _display displayCtrl 564061;
private _menu3Name = _display displayCtrl 564062;
private _menu3Num = _display displayCtrl 564063;
private _menu3btnadd = _display displayCtrl 564064;

private _menu3fiche = _display displayCtrl 56407;
private _menu3fichename = _display displayCtrl 564071;
private _menu3fichenum = _display displayCtrl 564072;
private _menu3fichebtnsms = _display displayCtrl 564073;
private _menu3fichebtnappel = _display displayCtrl 564074;
private _menu3fichebtnsms2 = _display displayCtrl 564075;
private _menu3fichebtnfiche = _display displayCtrl 564076;
private _menu3retour = _display displayCtrl 564077;

private _menu3addcontact = _display displayCtrl 56408;
private _menu3addname = _display displayCtrl 564081;
private _menu3addnum = _display displayCtrl 564082;
private _menu3btnOK = _display displayCtrl 564083;
private _menu3btnannuler = _display displayCtrl 564084;

private _menuNewMessage = _display displayCtrl 56409;
private _menuNMbtnannuler = _display displayCtrl 564091;
private _menuNMnumedit = _display displayCtrl 564092;
private _menuNMnum = _display displayCtrl 564093;
private _menuNMsmsedit = _display displayCtrl 564094;
private _menuNMbtnenvoyer = _display displayCtrl 564095;

private _mutepic = _display displayCtrl 564096;
private _mutebtn = _display displayCtrl 564097;
private _speakpic = _display displayCtrl 564098;
private _speakbtn = _display displayCtrl 564099;

private _menu5 = _display displayCtrl 565050;
private _menu5btnAnonyme = _display displayCtrl 565051;
private _menu5viberON = _display displayCtrl 565052;
private _menu5viberOFF = _display displayCtrl 565053;
private _menu5textbg = _display displayCtrl 565054;
private _menu5btnbg = _display displayCtrl 565055;
private _menu5textring = _display displayCtrl 565056;
private _menu5btnring = _display displayCtrl 565057;
private _menu5AnonymeON = _display displayCtrl 565058;
private _menu5AnonymeOFF = _display displayCtrl 565059;
private _menu5btnviber = _display displayCtrl 565060;
private _menu5btnavion = _display displayCtrl 565061;
private _menu5avionON = _display displayCtrl 565063;
private _menu5avionOFF = _display displayCtrl 565062;

private _menuRadiobtnapp = _display displayCtrl 582504;
private _menuRadiopic = _display displayCtrl 58256;
private _menuRadiobtnpic1 = _display displayCtrl 582500;
private _menuRadiobtnpic2 = _display displayCtrl 582501;
private _menuRadiobtn1 = _display displayCtrl 582502;
private _menuRadiobtn2 = _display displayCtrl 582503;
private _menuRadioEdit = _display displayCtrl 582505;
private _menuRadioText = _display displayCtrl 582506;
private _menuRadioVolp = _display displayCtrl 582507;
private _menuRadioVolm = _display displayCtrl 582508;

private _menu6pic = _display displayCtrl 682560;
private _menu6smslist = _display displayCtrl 682561;
private _menu6smsview = _display displayCtrl 682562;
private _menu6btnnew = _display displayCtrl 682563;
private _menu6btnrep = _display displayCtrl 682564;
private _menu6btndel = _display displayCtrl 682565;

private _menu8recent = _display displayCtrl 682566;
private _menu8recentlb = _display displayCtrl 682567;

_menu1sim ctrlShow false;
_menu1btntel ctrlShow false;
_menu1btnsms ctrlShow false;
_menu1btncontacts ctrlShow false;
_menu1btnreglages ctrlShow false;
_menu1nosim ctrlShow false;
_menu1nosimok ctrlShow false;
_menu1appelentrant ctrlShow false;
_menu1appel ctrlShow false;
_menu1Name ctrlShow false;
_menu1Num ctrlShow false;
_menu1Time ctrlShow false;
_menu1rouge ctrlShow false;
_menu1vert ctrlShow false;
_menu1rouge2 ctrlShow false;
_menu1volp ctrlShow false;
_menu1volm ctrlShow false;
_menuNewMessage ctrlShow true;
_menuNMbtnannuler ctrlShow true;
_menuNMnumedit ctrlShow false;
_menuNMnum ctrlShow true;
_menuNMsmsedit ctrlShow true;
_menuNMbtnenvoyer ctrlShow true;
_menu2telephone ctrlShow false;
_menu2btnappel ctrlShow false;
_menu2numedit ctrlShow false;
_menu3contacts ctrlShow false;
_menu3contactslist ctrlShow false;
_menu3Name ctrlShow false;
_menu3Num ctrlShow false;
_menu3btnadd ctrlShow false;
_menu3addcontact ctrlShow false;
_menu3addname ctrlShow false;
_menu3addnum ctrlShow false;
_menu3btnOK ctrlShow false;
_menu3btnannuler ctrlShow false;
_mutepic ctrlShow false;
_mutebtn ctrlShow false;
_speakpic ctrlShow false;
_speakbtn ctrlShow false;
_menu3fiche ctrlShow false;
_menu3fichename ctrlShow false;
_menu3fichenum ctrlShow false;
_menu3fichebtnsms ctrlShow false;
_menu3fichebtnappel ctrlShow false;
_menu3fichebtnsms2 ctrlShow false;
_menu3fichebtnfiche ctrlShow false;
_menu3retour ctrlShow false;
_menu5 ctrlShow false;
_menu5btnAnonyme ctrlShow false;
_menu5textbg ctrlShow false;
_menu5btnbg ctrlShow false;
_menu5textring ctrlShow false;
_menu5btnring ctrlShow false;
_menu5viberON ctrlShow false;
_menu5viberOFF ctrlShow false;
_menu5btnviber ctrlShow false;
_menu5btnavion ctrlShow false;
_menu5avionON ctrlShow false;
_menu5avionOFF ctrlShow false;
_menuRadiobtnapp ctrlShow false;
_menuRadiopic ctrlShow false;
_menuRadiobtnpic1 ctrlShow false;
_menuRadiobtnpic2 ctrlShow false;
_menuRadiobtn1 ctrlShow false;
_menuRadiobtn2 ctrlShow false;
_menuRadioEdit ctrlShow false;
_menuRadioText ctrlShow false;
_menuRadioVolp ctrlShow false;
_menuRadioVolm ctrlShow false;
_menu6pic ctrlShow false;
_menu6smslist ctrlShow false;
_menu6smsview ctrlShow false;
_menu6btnnew ctrlShow false;
_menu6btnrep ctrlShow false;
_menu6btndel ctrlShow false;
_menu8recent ctrlShow false;
_menu8recentlb ctrlShow false;

pInActNumber = _numero;

_menuNMnum ctrlSetStructuredText parseText format["<t align='left' shadow='0' color='#000000' font='HelveticaNeueLTStdLt' size='1'>%1</t>", _name];
_menuNMbtnenvoyer buttonSetAction "[pInActNumber] spawn ALF_fnc_iPhoneSmsSend;";
_menuNMbtnannuler buttonSetAction "uiNamespace setVariable ['iphonemenu',6]; [] call ALF_fnc_menuiPhone;";
