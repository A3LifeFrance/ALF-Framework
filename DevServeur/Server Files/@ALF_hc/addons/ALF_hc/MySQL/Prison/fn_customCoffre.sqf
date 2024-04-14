#include "\ALF_hc\hc_macros.hpp"
/*
	custmCoffre prison
*/
private _coffre = _this select 0;
private _mode = _this select 1;
if(isNull _coffre) exitWith {};

private _id = 0;
switch(true) do {
	case (_coffre isEqualTo alf_coffre_prison_1) : {_id = 1;};
	case (_coffre isEqualTo alf_coffre_prison_2) : {_id = 2;};
	case (_coffre isEqualTo alf_coffre_prison_3) : {_id = 3;};
	case (_coffre isEqualTo alf_coffre_prison_4) : {_id = 4;};
	case (_coffre isEqualTo alf_coffre_prison_5) : {_id = 5;};
	case (_coffre isEqualTo alf_coffre_prison_6) : {_id = 6;};
	case (_coffre isEqualTo alf_coffre_prison_7) : {_id = 7;};
	case (_coffre isEqualTo alf_coffre_prison_8) : {_id = 8;};
	case (_coffre isEqualTo alf_coffre_prison_9) : {_id = 9;};
	case (_coffre isEqualTo alf_coffre_prison_10) : {_id = 10;};
	case (_coffre isEqualTo alf_coffre_prison_11) : {_id = 11;};
	case (_coffre isEqualTo alf_coffre_prison_12) : {_id = 12;};
	case (_coffre isEqualTo alf_coffre_prison_13) : {_id = 13;};
	case (_coffre isEqualTo alf_coffre_prison_14) : {_id = 14;};
	case (_coffre isEqualTo alf_coffre_prison_15) : {_id = 15;};
	case (_coffre isEqualTo alf_coffre_prison_16) : {_id = 16;};
	case (_coffre isEqualTo alf_coffre_prison_17) : {_id = 17;};
	case (_coffre isEqualTo alf_coffre_prison_18) : {_id = 18;};
	case (_coffre isEqualTo alf_coffre_prison_19) : {_id = 19;};
	case (_coffre isEqualTo alf_coffre_prison_20) : {_id = 20;};
};

switch (_mode) do {
	case 0 : {
		_coffre animateSource ["safe_source",0,true];
		[format["UPDATE prison SET safe='1' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;
	};
	case 1 : {
		_coffre animateSource ["safe_source",1,true];
		[format["UPDATE prison SET safe='0' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;
	};
	case 2 : {
		_coffre animateSource ["piege_source",0,true];
		[format["UPDATE prison SET piege='1' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;
	};
	case 3 : {
		_coffre animateSource ["piege_source",1,true];
		[format["UPDATE prison SET piege='0' WHERE id='%1'",_id],1] call HC_fnc_asyncCall;
	};
};
