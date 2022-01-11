dzLegacyDebug = true;
 while {dzLegacyDebug} do
 {
	waitUntil {isSceneReady};
	call compile preprocessFileLineNumbers "hint.sqf";
	statusChat ["DayZ Legacy: Loaded debug functions.", "ColorImportant"];
 };


