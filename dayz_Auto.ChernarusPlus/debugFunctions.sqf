//DayZ Legacy 0.44
//debugFunctions.sqf - A series of debug functions that are called on the client-side. 

diag_log "DayZ Legacy: Debug functions have been called.";


dzLegacyDebug = true;
debugMonitor = true;
keybinds = true;

 if (dzLegacyDebug) then
 {
	waitUntil {isSceneReady};
	call compile preprocessFileLineNumbers "debugMenu.sqf";
	statusChat ["DayZ Legacy: Debug functions initialized.", "ColorImportant"];
 };
 
while {debugMonitor} do {
	waitUntil {alive player};
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

while {keybinds} do {
	diag_log "DayZ Legacy: Keybinds initialized.";
	waitUntil {alive player};

	dokeyDown={
     private ["_key"] ;
     _key = _this select 1; 
     switch (_key) do {
          case (0x3B): {sleep 1;createDialog "RscDisplayDebug";};
          case (0x3C): {sleep 1;execVM "hint.sqf";};
     };     
     _return
	};
	sleep 5;
	(FindDisplay 46) DisplaySetEventHandler [
    	 "keydown",
    	 "_this call dokeyDown"
     ];
	sleep 0.5;
};

