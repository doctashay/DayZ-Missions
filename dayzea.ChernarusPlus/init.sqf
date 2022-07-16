//DayZ Legacy 0.44
//init.sqf - Begins server initialization. 

diag_log "SERVER: START init.sqf";
setTimeForScripts 90;

call compile preprocessFileLineNumbers "\dz\modulesDayZ\init.sqf";

DZ_MP_CONNECT = true;
dzLegacyDebug = true;
DZ_MAX_ZOMBIES = 1000;
DZ_MAX_ANIMALS = 800;

diag_log "SERVER: START load DayZ modules";

//dbSelectHost "http://localhost:5000/DayZServlet/";

call dbLoadPlayer;


diag_log "SERVER: END load DayZ modules";

diag_log "SERVER: START world functions";
//_humidity = random 1;
//setDate getSystemTime;
setDate [2022, 2, 6, 15, 0];
0 setOvercast 1;
0 setFog 1;
diag_log "SERVER: END world functions";

_position = [7500,7500,0];
//exportProxies [_position,200000];

sleep 1;
importProxies;	
spawnLoot [_position,15000,25000];



call init_spawnZombies;

//call init_spawnServerEvent;






call init_spawnWildAnimals;

if (dzLegacyDebug) then {
call compile preprocessFileLineNumbers "spawnAir.sqf";
call compile preprocessFileLineNumbers "spawnCar.sqf";
//call compile preprocessFileLineNumbers "spawnArmory.sqf";
//call compile preprocessFileLineNumbers "scripts\weatherManager.sqf";
};

diag_log "ADDONS: END load custom modules";
diag_log "SERVER: END init.sqf";


setTimeForScripts 0.1;
