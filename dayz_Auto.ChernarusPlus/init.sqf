//DayZ Legacy 0.44
//init.sqf - Begins server initialization. 

diag_log "SERVER: START init.sqf";
setTimeForScripts 90;

DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 2000;
DZ_MAX_ANIMALS = 200;

diag_log "SERVER: START load DayZ modules";
dzLegacyDebug = false;
//dbSelectHost "http://localhost:5000/DayZServlet/";

call dbLoadPlayer;

call compile preprocessFileLineNumbers "\dz\modulesDayz\init.sqf";
call compile preprocessFileLineNumbers "spawnCar.sqf";
diag_log "SERVER: END load DayZ modules";

diag_log "SERVER: START world functions";
_humidity = random 1;
//setDate getSystemTime;
setDate [2022, 2, 6, 15, 0];
0 setOvercast 1;
0 setFog 1;

//simulWeatherSync;
//setAccTime 60;
//skipTime 10.5;
diag_log "SERVER: END world functions";
//exportProxies [_position, 200000];

diag_log "SPAWN: START zombie spawn";
call init_spawnZombies;
diag_log "SPAWN: END zombie spawn";

diag_log "SPAWN: START loot spawn";
_position = [7500, 7500, 0];
//dbLoadLoot; 
importProxies;
spawnLoot [_position, 30000, 35000];
diag_log "SPAWN: END loot spawn";

diag_log "ADDONS: START load custom modules";

if (dzLegacyDebug) then {
call compile preprocessFileLineNumbers "spawnAir.sqf";
//call compile preprocessFileLineNumbers "spawnArmory.sqf";
call compile preprocessFileLineNumbers "scripts\weatherManager.sqf";
};

diag_log "ADDONS: END load custom modules";
diag_log "SERVER: END init.sqf";


setTimeForScripts 0.1;