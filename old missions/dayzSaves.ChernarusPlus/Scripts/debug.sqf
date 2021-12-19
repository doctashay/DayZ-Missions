diag_log "We made it";

custom_monitor = true;
while {true} do {
	hintSilent format ["Name: %1\nUID: %2\nBlood: %3\nShock: %4\nFPS:%5",(name player),(getPlayerUID player),(player getVariable blood),(player getVariable shock),floor(diag_fps))];
	sleep 0.1;
};