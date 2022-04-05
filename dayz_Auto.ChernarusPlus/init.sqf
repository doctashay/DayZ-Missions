//DayZ Legacy 0.44
//init.sqf - Begins server initialization. 

diag_log "SERVER: START init.sqf";
setTimeForScripts 90;

DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 1000;
DZ_MAX_ANIMALS = 2000;

diag_log "SERVER: START load DayZ modules";
dzLegacyDebug = true;
dbSelectHost "http://107.172.21.184:5000/DayZServlet/";


call dbLoadPlayer;
diag_log "SERVER: END load DayZ modules";

call compile preprocessFileLineNumbers "\dzlegacy\modulesDayZ\init.sqf";
call compile preprocessFileLineNumbers "spawnCar.sqf";
call compile preprocessFileLineNumbers "spawnAir.sqf";
call compile preprocessFileLineNumbers "spawnArmory.sqf";

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

diag_log "ADDONS: START load custom modules";

if (dzLegacyDebug) then {

};

diag_log "ADDONS: END load custom modules";
diag_log "SERVER: END init.sqf";
setTimeForScripts 0.1;