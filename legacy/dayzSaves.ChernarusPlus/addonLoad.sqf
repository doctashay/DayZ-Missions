diag_log "DZ Legacy: addonLoad.sqf loaded.";

statusChat "DZ Legacy: Test";
while {true} do {
waitUntil {alive player};
hint "HELLO HELLO ";
diag_log "DZ Legacy: Player alive";
//call compile preprocessFileLineNumbers "debug.sqf";
};

