//DayZ Legacy 0.44
//init.sqf - Begins server initialization. 

diag_log "SERVER: START init.sqf";
setTimeForScripts 90;

DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 1000;
DZ_MAX_ANIMALS = 2000;

dzLegacyDebug = true;

dbSelectHost "http://localhost:5000/DayZServlet/";

diag_log "SERVER: START load DayZ modules";
call compile preprocessFileLineNumbers "\dzlegacy\modulesDayZ\init.sqf";
call compile preprocessFileLineNumbers "spawnCar.sqf";
call compile preprocessFileLineNumbers "spawnAir.sqf";

_obj = createVehicle ["HMMWV", [2227.16, 5116.78, 0], [], 0, "CAN_COLLIDE"]; //base test
_obj setObjectTexture [0, "C:\Flag_Ukraine_co.paa"];

_obj2 = createVehicle ["BallisticHelmet_Black", [2227.16, 5116.78, 0], [], 0, "CAN_COLLIDE"]; //base test
_obj2 setObjectTexture [0, "C:\Flag_Ukraine_co.paa"];

_obj3 = createVehicle ["TTSKO_Jacket_Camo", [2227.16, 5116.78, 0], [], 0, "CAN_COLLIDE"]; //base test
_obj3 setObjectTexture [0, "C:\Flag_Ukraine_co.paa"];

_obj4 = createVehicle ["ttsko_pants_Beige", [2227.16, 5116.78, 0], [], 0, "CAN_COLLIDE"]; //base test
_obj4 setObjectTexture [0, "C:\Flag_Ukraine_co.paa"];

_obj5 = createVehicle ["CombatBoots_Black", [2227.16, 5116.78, 0], [], 0, "CAN_COLLIDE"]; //base test
_obj5 setObjectTexture [0, "C:\Flag_Ukraine_co.paa"];



call dbLoadPlayer;
diag_log "SERVER: END load DayZ modules";

diag_log "SERVER: START world functions";
_humidity = random 1;
//setDate getSystemTime;
setDate [2022, 2, 6, 11, 0];
0 setOvercast _humidity;
simulWeatherSync;
//setAccTime 60;
//skipTime 10.5;
diag_log "SERVER: END world functions";
//exportProxies [_position, 200000];

diag_log "SPAWN: START zombie and loot spawn";
call init_spawnZombies;

_position = [7500, 7500, 0];
importProxies;
spawnLoot [_position, 30000, 35000];
diag_log "SPAWN: END loot spawn";

//dbInitServer;
dbSelectHost "http://localhost:5000/DayZServlet/";

diag_log "ADDONS: START load custom modules";

if (dzLegacyDebug) then {
_result = ["Would you like to enable the DayZ Legacy RVExtension?", "Debug", true, true] call BIS_fnc_guiMessage; 
 
    if (_result) then { 
     systemChat "RVExtension will be loaded during this session."; 
	 hint("RVExtension" callExtension "");

    } else { 
     systemChat "RVExtension will not be loaded during this session.";
    };
}

diag_log "ADDONS: END load custom modules";
diag_log "SERVER: END init.sqf";
setTimeForScripts 0.1;