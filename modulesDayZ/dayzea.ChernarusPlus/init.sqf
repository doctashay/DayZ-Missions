setTimeForScripts 90;

call compile preprocessFileLineNumbers "\dz\modulesDayZ\init.sqf";

DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 700;

//call dbLoadPlayer;

_humidity = 0.3;
//setDate getSystemTime;
simulSetHumidity _humidity;
0 setOvercast _humidity;

_position = [7500,7500,0];
//exportProxies [_position,200000];
call init_spawnZombies;
sleep 1;
//importProxies;	
//spawnLoot [_position,15000,25000];

setTimeForScripts 0.03;