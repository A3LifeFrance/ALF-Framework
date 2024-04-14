_unit = _this select 0;
_weap = _this select 1;

_class = getText(configFile>>"CfgWeapons">>_weap>>"KA_BoltAction_EjectShell");
if(_class=="")exitWith{};

sleep 0.5;
_cartridge = _class createVehicle [0,0,0];
_cartridge attachTo [_unit, [-0.03, 0.1, -0.05], "granat"];
detach _cartridge;
_random = ((random 1) + 2) / 3;
_speed = 2;
_dir = (direction _unit) + 20 + 20 * _random;
_vel = ([(sin _dir) * _speed, (cos _dir) * _speed, 0.5] vectorMultiply _random);
_v = 0.5;
_cartridge setVelocity _vel;
_t = (sqrt( _v*_v + 19.6 * ( (getPosATL _cartridge) select 2) ) + _v)/9.8;		// gpgpgpgp: NEWTON's LAW, lol
sleep _t;
playSound3D [ format ["KA_weapon_functions\sound\dirt_762_%1.ogg",str floor random 10] , _cartridge, false, getPosASL _cartridge, 1, 1, 20];
sleep 4.0;
deleteVehicle _cartridge;
