debugMonitor = true;

debugMonitorCheck =
{
	while {debugMonitor} do {
		_unit = player;
		_blood = round(((_unit getVariable['blood',0])/5000)*100);
		_health = round(((_unit getVariable['health',0])/5000)*100);
		_shock = round(((_unit getVariable['shock',0])/5000)*100);
		_hand = currentWeapon _unit;
		_gridPos = mapGridPosition player;
		_pp = getpos _unit;
		_airtemp = airtemperature;
		_temp = round(((_unit getVariable['bodytemperature',0])/100)*100);	
		_heat = round(((_unit getVariable['heatcomfort',0])/100)*100);	
		hintSilent format ["Name: %1\nUID: %2\nFPS: %3\nCoords: %4\nItem in Hands: %5\nBlood: %6\nHealth: %7\nShock: %8\nAir Temperature: %9\nBody Temperature: %10\nHeat Comfort: %11", name player, getPlayerUID player, floor(diag_fps), _pp, _hand, _blood, _health, _shock, _airtemp, _temp, _heatcomfort];
		sleep 0.1;
		//hintSilent format ["Name: %1\nUID: %2\nBlood: %3\nHealth: %4\nShock:%5\nFPS:%6\nCurrent Weapon:%7\nGPS:%8\nMap Coords:%9", name player, getPlayerUID player, _blood, _health, _shock, floor(diag_fps), _hand, _gridPos, _pp];
	};
};

