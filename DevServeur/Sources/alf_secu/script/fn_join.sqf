params [
	["_buttons", []]
];

ctrlactivate ((ctrlparent (_buttons # 0)) displayctrl 105);

onEachFrame format ["
onEachFrame {
	ctrlActivate (findDisplay %8 displayCtrl %9);
	
	onEachFrame {
		private _ctrlServerAddress = findDisplay %10 displayCtrl 2300;
		_ctrlServerAddress controlsGroupCtrl %11 ctrlSetText ""46.4.92.227""; 
		_ctrlServerAddress controlsGroupCtrl %12 ctrlSetText ""2602"";
		ctrlActivate (_ctrlServerAddress controlsGroupCtrl %14);
		
		onEachFrame {   
			((findDisplay %8 displayCtrl %13) lbData 0) call {
				if (diag_tickTime > %18) then {
					diag_log ""no server"";
					onEachFrame {};
				};
				
				if !(_this isEqualTo '') then {
					findDisplay %8 displayCtrl %13 lbSetCurSel 0;
					
					onEachFrame {
						ctrlActivate (findDisplay %8 displayCtrl %15);
						
						onEachFrame {                       
							if (diag_tickTime > %18) then {
								diag_log ""cannot join"";
								onEachFrame {};
							};
							
							if (!isNull findDisplay %16) then {
								private _ctrlPassword = findDisplay %16 displayCtrl %17;
								_ctrlPassword ctrlSetTextColor [0,0,0,0];
								_ctrlPassword ctrlSetText ""%3"";
								ctrlActivate (findDisplay %16 displayCtrl %14);
							};
							
							if (getClientStateNumber >= 3) then {
								onEachFrame {};
							};
						};
					};
				};
			};
		};
	};
};
", "", "", "", 2, 46, 50, 70, 8, 166, 19, 101, 102, 102, 1, 105, 64, 101, diag_tickTime + 30];