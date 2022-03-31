extensionEnable = true;
isExtensionOn = false;

extensionCheck = {
		sleep 20;
		_result = ["Would you like to enable the DayZ Legacy RVExtension?", "Debug", true, true] call BIS_fnc_guiMessage; 
    		if (_result) then { 
				statusChat ["RVExtension will be loaded during this session.", "ColorFriendly"];
	 			hint("RVExtension" callExtension "");
				isExtensionOn = true;
    		} else { 
				statusChat ["RVExtension will not be loaded during this session.", "ColorImportant"];
				isExtensionOn = false;
   	 		};
};

