extensionEnable = true;

extensionCheck = {
	while {extensionEnable} do {
		waitUntil {alive player};
		_result = ["Would you like to enable the DayZ Legacy RVExtension?", "Debug", true, true] call BIS_fnc_guiMessage; 
 
    		if (_result) then { 
    			systemChat "RVExtension will be loaded during this session."; 
	 			hint("RVExtension" callExtension "");
				extensionEnable = false;
    		} else { 
     			systemChat "RVExtension will not be loaded during this session.";
				extensionEnable = false;
   	 		};
	};
};

