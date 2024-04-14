#include "\ALF_hc\hc_macros.hpp"

private["_banque","_unit"];
_banque = _this select 0;
_unit = _this select 1;
if (isNull _banque || isNull _unit) exitWith {};

if (_banque animationPhase "pc" isEqualTo 0) exitWith {};
_banque animate ["pc",0];
["ALF_Pc",false] remoteExec ["life_fnc_handleItem",_unit];
playSound3D ["ALF_Client2\sounds\banque_pc_start.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
uiSleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments\ALF_Banque\data\computer_388888.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
uiSleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments\ALF_Banque\data\computer_308888.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
uiSleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments\ALF_Banque\data\computer_300888.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
uiSleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments\ALF_Banque\data\computer_300688.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
uiSleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments\ALF_Banque\data\computer_300618.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
uiSleep 45;
playSound3D ["ALF_Client2\sounds\banque_pc_end.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
uiSleep 5;
_banque setObjectTextureGlobal [0, "ALF_Batiments\ALF_Banque\data\computer_300614.paa"];
playSound3D ["ALF_Client2\sounds\banque_bigporte.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 5, 1, 100];
_banque animate ["porte",1];
