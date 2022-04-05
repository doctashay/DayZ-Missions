keybinds = true;

keybindCheck = {
	statusChat ["DayZ Legacy: Keybinds initialized.", "ColorFriendly"];
	while {keybinds} do {
		dokeyDown={
     	private ["_key"];
     	_key = _this select 1; 
     	switch (_key) do {
         	 case (0x3B): {sleep 1;createDialog "RscDisplayDebug";};
          	 case (0x3C): {sleep 1;call compile preprocessFileLineNumbers "hint.sqf";};
    	 };     
    	 _return;
		};
		sleep 5;
		(FindDisplay 46) DisplaySetEventHandler [
 		   	 "keydown",
    		 "_this call dokeyDown"
   		  ];
		sleep 0.5;
	};
};