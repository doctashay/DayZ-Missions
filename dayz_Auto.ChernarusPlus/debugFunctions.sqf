//must call from client side script, such as player_queued 
//all DZ legacy scripts will be called from here

diag_log "Arrived at debugFunctions.sqf";
// custom_monitor = true;
// while {custom_monitor} do {
// 		waitUntil {isSceneReady};
// 		diag_log "scene ready";
// 		hint "hi";
// 	//statusChat ["DayZ Legacy", "ColorImportant"]; 


// 	diag_log "made it";
// 	sleep 1;
// };

dzLegacyDebug = true;
 if (dzLegacyDebug) then
 {
	waitUntil {isSceneReady};
	statusChat ["DayZ Legacy: Loaded debug functions.", "ColorImportant"];
 };

call compile preprocessFileLineNumbers "hint.sqf";


debugMonitor = true;
keybinds = true;

while {debugMonitor} do {
waitUntil {isSceneReady};
diag_log "DayZ Legacy: Debug monitor initialized.";
_unit = player;
_blood = round(((_unit getVariable['blood',0])/5000)*100);
_health = round(((_unit getVariable['health',0])/5000)*100);
_shock = round(((_unit getVariable['shock',0])/5000)*100);
_hand = currentWeapon _unit;
_gridPos = mapGridPosition player;
_pp = getpos _unit;

hintSilent format ["Name: %1\nUID: %2\nBlood:%3", name player, getPlayerUID player, _blood];

//hintSilent format ["Name: %1\nUID: %2\nBlood: %3\nHealth: %4\nShock:%5\nFPS:%6\nCurrent Weapon:%7\nGPS:%8\nMap Coords:%9", name player, getPlayerUID player, _blood, _health, _shock, floor(diag_fps), _hand, _gridPos, _pp];
};

while {keybinds} do {
	diag_log "DayZ Legacy: Keybinds initialized."
	waitUntil {isSceneReady};
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

