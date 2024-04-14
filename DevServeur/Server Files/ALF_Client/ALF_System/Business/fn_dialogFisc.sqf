#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF NiiRoZz
*/
params [
  ["_mode",-1,[-1]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
  //CreateDialog
  case 0: {
    private _siret = param [1, "", [""]];
    private _building = nearestObject [player, "Land_ALF_Entreprise"];

    if (_siret isEqualTo "" || isNull _building) exitWith {};

    ALF_Fisc_Building = _building;
    ALF_Fisc_allPaiement = [];
    ALF_Fisc_PaiementSortName = [];
    ALF_Fisc_PaiementSortDate = [];
    ALF_Fisc_allReceive = [];
    ALF_Fisc_ReceiveSortName = [];
    ALF_Fisc_ReceiveSortDate = [];

    [_siret] remoteExecCall ["HC_fnc_fiscToPlayer", HC2_Life];
  };
  //Receive Info from Server
  case 1: {
    private _allPaiement = param [1, [], [[]]];
    private _allReceive = param [2, [], [[]]];

    if ((_allPaiement isEqualTo []) && {_allReceive isEqualTo []}) exitWith {closeDialog 0; ["INFO","Il n'y a aucun paiement fait par l'entreprise ou aucun versement reçu par l'entreprise.","warning"] spawn ALF_fnc_doMsg;};

    ALF_Fisc_allPaiement = _allPaiement;
    ALF_Fisc_allReceive = _allReceive;

    if !(ALF_Fisc_allReceive isEqualTo []) then {
      private _index = -1;
      private _array = [];
      {
        _index = [(_x select 0),ALF_Fisc_ReceiveSortName] call TON_fnc_index;
        if (_index > -1) then {
          _array = (ALF_Fisc_ReceiveSortName select _index) select 1;
          _array pushBack _x;
          ALF_Fisc_ReceiveSortName set [_index, [(_x select 0),_array]];
        } else {
          ALF_Fisc_ReceiveSortName pushBack [(_x select 0),[_x]];
        };
      } forEach ALF_Fisc_allReceive;

      _index = -1;
      private _arraytempon = [];
      {
        _arraytempon pushBack (_x select 4);
      } forEach ALF_Fisc_allReceive;
      _arraytempon sort true;
      {
        private _date = _x;
        _index = -1;
        {
          if ((_x select 4) isEqualTo _date) exitWith {
            _index = _forEachIndex;
          };
        } forEach ALF_Fisc_allReceive;
        if (_index > -1) then {
          ALF_Fisc_ReceiveSortDate pushBack (ALF_Fisc_allReceive select _index);
        };
      } forEach _arraytempon;
      reverse ALF_Fisc_ReceiveSortDate;
    };

    if !(ALF_Fisc_allPaiement isEqualTo []) then {
      private _index = -1;
      private _array = [];
      {
        _index = [(_x select 0),ALF_Fisc_PaiementSortName] call TON_fnc_index;
        if (_index > -1) then {
          _array = (ALF_Fisc_PaiementSortName select _index) select 1;
          _array pushBack _x;
          ALF_Fisc_PaiementSortName set [_index, [(_x select 0),_array]];
        } else {
          ALF_Fisc_PaiementSortName pushBack [(_x select 0),[_x]];
        };
      } forEach ALF_Fisc_allPaiement;

      _index = -1;
      private _arraytempon = [];
      {
        _arraytempon pushBack (_x select 4);
      } forEach ALF_Fisc_allPaiement;
      _arraytempon sort true;
      {
        private _date = _x;
        _index = -1;
        {
          if ((_x select 4) isEqualTo _date) exitWith {
            _index = _forEachIndex;
          };
        } forEach ALF_Fisc_allPaiement;
        ALF_Fisc_PaiementSortDate pushBack (ALF_Fisc_allPaiement select _index);
      } forEach _arraytempon;
      reverse ALF_Fisc_PaiementSortDate;
    };

    [2] call ALF_fnc_dialogFisc;
  };

  //Setup du dialog
  case 2: {
    disableSerialization;
    if !(createDialog "ALF_FISC_Dialog") exitWith {["INFO","Une erreur s'est produite lors de la création du dialog du fisc.","warning"] spawn ALF_fnc_doMsg;};

    lbClear 18541;
    lbClear 18542;

    if !(ALF_Fisc_allPaiement isEqualTo []) then {
      lbAdd [18541, "Paiement"];
    };

    if !(ALF_Fisc_allReceive isEqualTo []) then {
      lbAdd [18541, "Versement"];
    };

    lbSetCurSel [18541, 0];

    lbAdd [18542, "Nom"];
    lbAdd [18542, "Date"];

    lbSetCurSel [18542, 0];

    private _display = findDisplay 18540;
    private _control = _display displayCtrl 18546;
    _control ctrlSetStructuredText (parseText (format ["<t size='0.8' align='center' color='#000000'>Le capital de l'entreprise est de %1€</t>",[(ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]]) select 3] call life_fnc_numberText]));
  };

  //Lorsqu'il change de selection entre paiement et versement
  case 3: {
    disableSerialization;
    private _modev = param [1, -1, [-1]];

    if (_modev isEqualTo -1) exitWith {};

    if (lbText [18541, _modev] isEqualTo "Paiement") then {
      if (lbText [18542, (lbCurSel 18542)] isEqualTo "Nom") then {
        [5,0] call ALF_fnc_dialogFisc;
      } else {
        [5,1] call ALF_fnc_dialogFisc;
      };
    } else {
      if (lbText [18542, (lbCurSel 18542)] isEqualTo "Nom") then {
        [6,0] call ALF_fnc_dialogFisc;
      } else {
        [6,1] call ALF_fnc_dialogFisc;
      };
    };

    private _display = findDisplay 18540;
    private _controlsGroup = _display displayCtrl 18544;
    private _control = _controlsGroup controlsGroupCtrl 18545;
    private _position = ctrlPosition _control;
    _control ctrlSetStructuredText (parseText "");
    _control ctrlSetPosition [_position select 0,_position select 1,_position select 2,0];
    _control ctrlCommit 0;
  };

  //Lorsqu'il change entre Nom et Date
  case 4: {
    disableSerialization;
    private _modev = param [1, -1, [-1]];

    if (_modev isEqualTo -1) exitWith {};

    if ((lbText [18542, _modev]) isEqualTo "Nom") then {
      if (lbText [18541, (lbCurSel 18541)] isEqualTo "Paiement") then {
        [5,0] call ALF_fnc_dialogFisc;
      } else {
        [6,0] call ALF_fnc_dialogFisc;
      };
    } else {
      if (lbText [18541, (lbCurSel 18541)] isEqualTo "Paiement") then {
        [5,1] call ALF_fnc_dialogFisc;
      } else {
        [6,1] call ALF_fnc_dialogFisc;
      };
    };

    private _display = findDisplay 18540;
    private _controlsGroup = _display displayCtrl 18544;
    private _control = _controlsGroup controlsGroupCtrl 18545;
    private _position = ctrlPosition _control;
    _control ctrlSetStructuredText (parseText "");
    _control ctrlSetPosition [_position select 0,_position select 1,_position select 2,0];
    _control ctrlCommit 0;
  };

  //Affichage de listBox pour les paiements
  case 5: {
    private _modev = param [1, -1, [-1]];
    if (_modev isEqualTo -1) exitWith {};
    lbClear 18543;

    if (_modev isEqualTo 0) then {
      {
        private _index = lbAdd [18543, [_x select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_x select 0) isEqualTo "Moi")];
        lbSetData [18543, _index, (str (_x select 1))];
        lbSetValue [18543, _index, 0];
      } forEach ALF_Fisc_PaiementSortName;
      lbSort ((findDisplay 18540) displayCtrl 18543);
    } else {
      {
        private _index = lbAdd [18543, [_x select 4] call life_fnc_DateToString];
        lbSetData [18543, _index, (str (_x))];
        lbSetValue [18543, _index, 1];
      } forEach ALF_Fisc_PaiementSortDate;
    };
  };

  //Affichage de listBox pour les versements
  case 6: {
    private _modev = param [1, -1, [-1]];
    if (_modev isEqualTo -1) exitWith {};
    lbClear 18543;

    if (_modev isEqualTo 0) then {
      {
        private _index = lbAdd [18543, [_x select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_x select 0) isEqualTo "Moi")];
        lbSetData [18543, _index, (str (_x select 1))];
        lbSetValue [18543, _index, 2];
      } forEach ALF_Fisc_ReceiveSortName;
      lbSort 18543;
    } else {
      {
        private _index = lbAdd [18543, [_x select 4] call life_fnc_DateToString];
        lbSetData [18543, _index, (str (_x))];
        lbSetValue [18543, _index, 3];
      } forEach ALF_Fisc_ReceiveSortDate;
    };
  };

  //Quand on selectionne une entry dans la listbox
  case 7: {
    disableSerialization;
    private _index = param [1, -1, [-1]];
    if (_index isEqualTo -1) exitWith {};
    private _data = parseSimpleArray (lbData [18543,_index]);
    private _display = findDisplay 18540;
    private _controlsGroup = _display displayCtrl 18544;
    private _control = _controlsGroup controlsGroupCtrl 18545;

    switch (lbValue [18543,_index]) do {
      case 0: {
        private _text = [];
        {
          if ((_x select 2) isEqualTo 1) then {
            _text pushBack (format ["<t size='0.75' color='#008E07'>%1 a reçu %2€ par l'entreprise le %3 et a été déclaré</t><br />",[_x select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_x select 0) isEqualTo "Moi"),[(_x select 1)] call life_fnc_numberText,[_x select 4] call life_fnc_DateToString]);
          } else {
            _text pushBack (format ["<t size='0.75' color='#DE0A01'>%1 a reçu %2€ par l'entreprise le %3 et n'etait pas déclaré</t><br />",[_x select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_x select 0) isEqualTo "Moi"),[(_x select 1)] call life_fnc_numberText,[_x select 4] call life_fnc_DateToString]);
          };
        } forEach _data;
        _text = _text joinString "";
        _control ctrlSetStructuredText (parseText _text);
        private _h = ctrlTextHeight _control;
        private _position = ctrlPosition _control;
        _control ctrlSetPosition [_position select 0,_position select 1,_position select 2,_h];
        _control ctrlCommit 0;
      };

      case 1: {
        private "_text";
        if ((_data select 2) isEqualTo 1) then {
          _text = format ["<t size='0.75' color='#008E07'>%1 a reçu %2€ par l'entreprise le %3 et a été déclaré</t><br />",[_data select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_data select 0) isEqualTo "Moi"),[(_data select 1)] call life_fnc_numberText,[_data select 4] call life_fnc_DateToString];
        } else {
          _text = format ["<t size='0.75' color='#DE0A01'>%1 a reçu %2€ par l'entreprise le %3 et n'etait pas déclaré</t><br />",[_data select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_data select 0) isEqualTo "Moi"),[(_data select 1)] call life_fnc_numberText,[_data select 4] call life_fnc_DateToString];
        };
        _control ctrlSetStructuredText (parseText _text);
        private _h = ctrlTextHeight _control;
        private _position = ctrlPosition _control;
        _control ctrlSetPosition [_position select 0,_position select 1,_position select 2,_h];
        _control ctrlCommit 0;
      };

      case 2: {
        private _text = [];
        {
          _text pushBack (format ["<t size='0.75' color='#000000'>%1 a payé %2€ à l'entreprise le %3</t><br />",[_x select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_x select 0) isEqualTo "Moi"),[(_x select 1)] call life_fnc_numberText,[_x select 4] call life_fnc_DateToString]);
        } forEach _data;
        _text = _text joinString "";
        _control ctrlSetStructuredText (parseText _text);
        private _h = ctrlTextHeight _control;
        private _position = ctrlPosition _control;
        _control ctrlSetPosition [_position select 0,_position select 1,_position select 2,_h];
        _control ctrlCommit 0;
      };

      case 3: {
        private _text = format ["<t size='0.75' color='#000000'>%1 a payé %2€ à l'entreprise le %3</t>",[_data select 0,ALF_Fisc_Building getVariable ["business",[1,1,1,1,1,1,1,1,"Erreur"]] select 8] select ((_data select 0) isEqualTo "Moi"),[(_data select 1)] call life_fnc_numberText,[_data select 4] call life_fnc_DateToString];
        _control ctrlSetStructuredText (parseText _text);
        private _h = ctrlTextHeight _control;
        private _position = ctrlPosition _control;
        _control ctrlSetPosition [_position select 0,_position select 1,_position select 2,_h];
        _control ctrlCommit 0;
      };
    };
  };

  //Quand le dialog se ferme
  case 8: {
    ALF_Fisc_allPaiement = [];
    ALF_Fisc_PaiementSortName = [];
    ALF_Fisc_PaiementSortDate = [];
    ALF_Fisc_allReceive = [];
    ALF_Fisc_ReceiveSortName = [];
    ALF_Fisc_ReceiveSortDate = [];
    ALF_Fisc_Building = objNull;
  };
};
