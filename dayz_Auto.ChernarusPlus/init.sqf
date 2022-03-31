//DayZ Legacy 0.44
//init.sqf - Begins server initialization. 

diag_log "SERVER: START init.sqf";
setTimeForScripts 90;

DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 1000;
DZ_MAX_ANIMALS = 2000;

diag_log "SERVER: START load DayZ modules";
dzLegacyDebug = true;
dbSelectHost "http://localhost:5000/DayZServlet/";


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
dbLoadLoot; 
importProxies;
spawnLoot [_position, 30000, 35000];
diag_log "SPAWN: END loot spawn";

diag_log "ADDONS: START load custom modules";

if (dzLegacyDebug) then {

};

diag_log "ADDONS: END load custom modules";
diag_log "SERVER: END init.sqf";

build_TentContainer = 
{
	if ( isServer ) then
	{
		_person = (_this select 1);
		_tentType = (_this select 2) select 0;
		_tentOri = (_this select 2) select 1;
		_dist = (_this select 2) select 2;

		_pos = getPos _person;
		_ori = direction _person;
		_xPos = (_pos select 0) + (sin _ori * _dist);
		_yPos = (_pos select 1) + (cos _ori * _dist);
		
		if ( !(surfaceIsWater [_xPos, _yPos]) ) then
		{
			deleteVehicle (_this select 0);
			_tent = _tentType createVehicle [_xPos, _yPos];
			_tent setDir _ori - _tentOri;
		}
		else
		{
			[_person,'I can not pitch the tent in the water!','colorImportant'] call fnc_playerMessage;
		};
	};
};

setTimeForScripts 0.1;