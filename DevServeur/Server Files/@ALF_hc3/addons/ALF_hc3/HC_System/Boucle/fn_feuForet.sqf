/*
    File: fn_feuForet.sqf
    Author: NiiRoZz
*/
private _allpos = [[2064.4,13519.8,0],[2204.43,13310.5,0],[1865.9,13641.4,0],[1678.91,13975.9,0],[2254.34,11903,0],[2363.35,11675,0],[2435.07,11582.2,0],[2178.7,11523.7,0],[1025.39,11493.1,0],[1798.39,11198.6,0],[1691.79,11347.3,0],[2600.55,11297,0],[2597.44,11270.1,0],[4071.88,10929,0],[3914.11,11062.6,0],[3719.26,11004.2,0],[4175.07,11364.1,0],[3972.95,11533.2,0],[4194.36,11706.6,0],[4396.77,11639.5,0],[4586.4,11634,0],[4601.22,12143.6,0],[5202.54,11977.3,0],[4522.98,10897.9,0],[4420.91,10749.9,0],[4516.5,10573.1,0],[4490,10356.9,0],[4797.38,10385.2,0],[3521.66,9869.78,0],[3197.89,9733.97,0],[3761.18,9918.15,0],[3707.7,10264.2,0],[3746.58,10526.4,0],[3177.2,9285.92,0],[3354.47,9375.44,0],[3838.79,9161.62,0],[3817.52,8893.43,0],[3873.94,9142.55,0],[4162.58,9057.24,0],[4511.67,8952.83,0],[2913.17,8374.35,0],[2851.01,8274.84,0],[2109.71,7680.12,0],[2677.42,7430.15,0],[3037.45,7495.21,0],[3346.62,7856.03,0],[3586.41,7473,0],[2745.18,6932.01,0],[5288.23,7775.34,0],[5343.99,8012.28,0],[5078.32,6932.86,0],[4762.19,6241.92,0],[5915.41,8120.63,0],[5915.41,8120.63,0],[5786.55,8230.95,0],[6987.97,11297.6,0],[4771.58,5695.78,0],[4419.91,5267.75,0],[4734.79,5648.81,0],[3702.95,4395.36,0],[3714.21,3982.75,0],[4452.46,4044.9,0],[4774.72,4515.82,0],[7054.16,6321.35,0],[7008.63,6589.71,0],[7320.56,6070.35,0],[7230.82,5366.4,0],[6547.82,5197.29,0],[7999.43,4852.21,0],[7895.94,4679.05,0],[8270.24,4141.06,0],[9117.82,3836.45,0],[9317.55,3685.25,0],[10016.2,3471.58,0],[10925.4,3546.44,0],[10984.5,4499.06,0],[10915.2,4819.33,0],[9728.29,5314.18,0],[10013.8,4924.44,0],[10336.5,4718.13,0],[11731.6,5673.86,0],[12081.6,5646.56,0],[13550.9,5872.59,0],[13876.1,6083.63,0],[15375.5,6036.23,0],[15627.1,5740.49,0],[15352.3,5379.89,0],[14796.7,4461.08,0],[13021.3,4242.56,0],[13219.8,2605,0],[13547.7,5279.64,0],[12293.8,4427.73,0],[12815.8,3630.45,0]];

for "_i" from 0 to 1 step 0 do {
	private _c = {_x getVariable ["MedService",false]} count playableUnits;
	if(_c >= 6 && ALF_fireON) then {
		private _r = random 10;
		if (_r < 3) then {
			[selectRandom _allpos] spawn HC_fnc_createFeuForet;
		};
	};
	uiSleep 2000;
};