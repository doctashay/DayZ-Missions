extensionEnable = true;

if (extensionEnable) then {
	waitUntil {isSceneReady};
	_result = ["Would you like to enable the DayZ Legacy RVExtension?", "Debug", true, true] call BIS_fnc_guiMessage; 
 
    	if (_result) then { 
    		systemChat "RVExtension will be loaded during this session."; 
	 		hint("RVExtension" callExtension "");
    	} else { 
     		systemChat "RVExtension will not be loaded during this session.";
   	 	};
};