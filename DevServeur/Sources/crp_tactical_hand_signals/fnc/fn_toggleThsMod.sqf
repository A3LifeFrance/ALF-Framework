private ["_handled", "_ctrl", "_text"];

// CRP_var_ThsEnabled = if CRP_var_ThsEnabled then { false } else { true };
CRP_var_ThsEnabled = [true, false] select CRP_var_ThsEnabled;

CRP_var_ThsLayer cutText ["", "PLAIN", 0, false];
CRP_var_ThsLayer cutRsc ["RscCrpThsMod", "PLAIN", 0, false];

disableSerialization;

_ctrl = uiNamespace getVariable "RscCrpThsMod";
_text = if (CRP_var_ThsEnabled) then { "<img image='\crp_tactical_hand_signals\ui\crp_ths_on_ca.paa' size='0.46' shadow='0' />" } else { "<img image='\crp_tactical_hand_signals\ui\crp_ths_off_ca.paa' size='0.46' shadow='0' />" };
(_ctrl displayCtrl 25348) ctrlSetStructuredText parseText _text;