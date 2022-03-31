//DayZ Legacy 0.44
//debugFunctions.sqf - A series of debug functions that are called on the client-side. 

diag_log "DayZ Legacy: Debug functions have been called.";

dzLegacyDebug = true;
 if (dzLegacyDebug) then
 {
	waitUntil {isSceneReady};
	call compile preprocessFileLineNumbers "debugMenu.sqf";
	call compile preprocessFileLineNumbers "spawnExtensions.sqf";
	call compile preprocessFileLineNumbers "spawnKeybinds.sqf";
	call compile preprocessFileLineNumbers "spawnDebugMonitor.sqf";
    [] spawn extensionCheck;
	[] spawn keybindCheck;
	[] spawn debugMonitorCheck;
	statusChat ["DayZ Legacy: Debug functions initialized.", "ColorFriendly"];
 };

