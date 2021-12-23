diag_log "SERVER: START init.sqf";

setTimeForScripts 90;

diag_log "SERVER: START load DayZ modules";
call compile preprocessFileLineNumbers "\dz\modulesDayZ\init.sqf";
diag_log "SERVER: END load DayZ modules";



DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 700;

diag_log "SERVER: START call dbLoadPlayer";
call dbLoadPlayer;
diag_log "SERVER: END call dbLoadPlayer";

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

diag_log "SPAWN: START zombie spawn";
call init_spawnZombies;
sleep 1;
diag_log "SPAWN: END zombie spawn";

diag_log "SPAWN: START loot spawn";
_position = [7500, 7500, 0];
importProxies;	
spawnLoot [_position, 30000, 35000];
diag_log "SPAWN: END loot spawn";

//dbInitServer;
dbInitServer;
dbSelectHost "http://localhost:9000/DayZServlet/";
//dbLoadHost;

diag_log "ADDONS: START load custom modules";
//call compile preprocessFileLineNumbers "debugFunctions.sqf";
call compile preprocessFileLineNumbers "spawnCar.sqf";
call compile preprocessFileLineNumbers "spawnAir.sqf";
call compile preprocessFileLineNumbers "dbg.sqf";
diag_log "ADDONS: END load custom modules";

setTimeForScripts 0.03;

diag_log "SERVER: END init.sqf";



waitUntil {isSceneReady};
cutText [format["Welcome to DayZ Legacy, %1.", name player], "PLAIN"];

