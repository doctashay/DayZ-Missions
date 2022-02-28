//DayZ Legacy 0.44
//init.sqf - Begins server initialization. 

diag_log "SERVER: START init.sqf";
setTimeForScripts 90;

DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 700;

diag_log "SERVER: START load DayZ modules";
call compile preprocessFileLineNumbers "\dzlegacy\server_data\scripts\init.sqf";
call compile preprocessFileLineNumbers "spawnCar.sqf";
call compile preprocessFileLineNumbers "spawnAir.sqf";
call dbLoadPlayer;
diag_log "SERVER: END load DayZ modules";

diag_log "SERVER: START world functions";
_humidity = random 1;
//setDate getSystemTime;
setDate [2013, 12, 16, 15, 0];
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



diag_log "ADDONS: END load custom modules";

diag_log "SERVER: END init.sqf";
setTimeForScripts 0.1;