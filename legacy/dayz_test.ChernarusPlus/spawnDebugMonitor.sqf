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
		hintSilent format ["Name: %1\nUID: %2\nFPS: %3\nCoords: %4\nBlood: %5\nHealth: %6\nShock: %7", name player, getPlayerUID player, floor(diag_fps), _pp, _blood, _health, _shock];
		sleep 0.1;
		//hintSilent format ["Name: %1\nUID: %2\nBlood: %3\nHealth: %4\nShock:%5\nFPS:%6\nCurrent Weapon:%7\nGPS:%8\nMap Coords:%9", name player, getPlayerUID player, _blood, _health, _shock, floor(diag_fps), _hand, _gridPos, _pp];
	};
};

