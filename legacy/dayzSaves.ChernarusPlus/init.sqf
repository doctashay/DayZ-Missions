diag_log "SERVER: START init.sqf.";

DZ_MP_CONNECT = false;
DZ_SCRIPT_DIR = "Scripts\";

//call functions from DayZ modules
diag_log "SERVER: START init modulesDayZ\init.sqf.";
call compile preprocessFileLineNumbers "\dz\modulesDayZ\init.sqf";

//call compile preprocessFileLineNumbers (DZ_SCRIPT_DIR + "hint.sqf");
diag_log "SERVER: END init modulesDayZ\init.sqf.";

//time to wait for scripts
setTimeForScripts 90;

//set max NPC values 
DZ_MAX_ZOMBIES = 0;
DZ_MAX_ANIMALS = 250;
DZ_MAX_VEHICLES = 50;

//defines 
//fnc_addonLoad = compile preprocessFileLineNumbers "addonLoad.sqf";

//start hive
call compile preprocessFileLineNumbers "dbSelectHost.sqf";
sleep 1;

//start player load
diag_log "PLAYER: START load player.";
call dbLoadPlayer;
diag_log "PLAYER: END load player.";

//weather/time 
_humidity = 0.3;
//setDate getSystemTime;
simulSetHumidity _humidity;
0 setOvercast _humidity;
0 setFog 1;

diag_log "SERVER: START proxy export.";
_position = [7500,7500,0];
//exportProxies [_position,200000];
diag_log "SERVER: END proxy export.";

diag_log "SERVER: START loot spawn.";
//importProxies;	
//spawnLoot [_position,15000,25000];
diag_log "SERVER: END loot spawn.";
sleep 1;

diag_log "SERVER: START zombie spawn.";
//call init_spawnZombies;
sleep 1;
diag_log "SERVER: END zombie spawn.";

//Start custom scripts
diag_log "ADDONS: START debug functions";
//[] execVM "hello.sqf";
//call fnc_addonLoad;
//[] execVM "addonLoad.sqf";
[] execVM "debug.sqf";

//fnc_debug = compile preprocessFileLineNumbers "debug.sqf";

//[] spawn fnc_debug;
diag_log "ADDONS: LOADED debug functions";


diag_log "HIVE: START db init for server.";
//dbInitServer;
diag_log "HIVE: END db init for server.";

DZ_MP_CONNECT = true;

//setTimeForScripts 0.03;

diag_log "SERVER: END mission initialization.";

