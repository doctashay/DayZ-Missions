keybinds = true;

if (keybinds) then {
	waitUntil {alive player};
	diag_log "DayZ Legacy: Keybinds initialized.";

	while (true) do { 
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
};