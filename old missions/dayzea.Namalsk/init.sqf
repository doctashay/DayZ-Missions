setTimeForScripts 90;

activateAddons ["DZ_Vehicles_wheeled"];

call compile preprocessFileLineNumbers "\dz\modulesDayZ\init.sqf";

DZ_MP_CONNECT = true;
DZ_MAX_ZOMBIES = 700;

call dbLoadPlayer;
this addWeapon "Binocular";
this addWeapon "M4A1";

_humidity = 0.3;
setDate getSystemTime;
simulSetHumidity _humidity;
0 setOvercast _humidity;

_position = [7500,7500,0];
exportProxies [_position,200000];
call init_spawnZombies;
sleep 1;
importProxies;	
spawnLoot [_position,15000,25000];

setTimeForScripts 0.03;
while {true} do {

		//Play Intro music
		waitUntil {alive player};

		
	_gridPos = mapGridPosition getPos player;
	hintSilent format ["GPS: %5",_gridPos];

dokeyDown={
     private ["_key"] ;
     _key = _this select 1;
     switch (_key) do {
	dokeyDown= {
     private ["_key"] ;
     _key = _this select 1;
     switch (_key) do {
          case (0x3B): {sleep 1;createDialog "RscDisplayDebug";};
          case (0x3C): {sleep 1;execVM "hint.sqf";};
		  case (0x3D): {sleep 1;execVM "respawn.sqf";};
		  case (0x3E): {sleep 1;createDialog "RscDisplayMissionEditor";};
		  case (0x3F): {sleep 1;createDialog "DZ_CharacterCreation";};
     };     
     _return
	playSound "introSong.ogg";
};

sleep 5;
(FindDisplay 46) DisplaySetEventHandler [
     "keydown",
     "_this call dokeyDown"
     ];
     };     
     _return
};

sleep 5;
(FindDisplay 46) DisplaySetEventHandler [
     "keydown",
     "_this call dokeyDown"
     ];
	sleep 0.1;
};

