//basic defines
DZ_DEBUG = true;
DZ_MP_CONNECT = false;

//Simulation defines
DZ_TICK = 1;			//how many seconds between each tick
DZ_TICK_COOKING = 1;	//how many seconds between each cooking tick
DZ_THIRST_SEC = 0.13;	// (original was 0.034) how much per second a healthy player needs to drink to stay normal at rest
DZ_METABOLISM_SEC = 0.07; //  (original was 0.05) how much kcal per second a healthy player needs to maintain basal metabolism at rest
DZ_SCALE_SOAK = 1;		//How much an item will soak with water when submerged per tick
DZ_SCALE_DRY = 1;			//Scales how fast things dry
DZ_WET_COOLING = 6;		//The degrees by which a fully wet item will reduce temperature
DZ_COOLING_POINT = 0;	//point at which body changes between warming/cooling
DZ_BODY_TEMP = 36.8;		//Degrees Celcius
DZ_MELEE_SWING = 1.3;		//number of seconds between melee attacks
DZ_FLAME_HEAT = 0.01;	//degrees per second for heating
DZ_BOILING_POINT = 20; //degrees of boiling point
DZ_DEW_POINT = 5;		//below which air will fog from player
DZ_WEATHER_CHANGE = 5;	//number of seconds to smooth weather changes in
DZ_DIGESTION_RATE = 1;	//number of ml to consume per second

//medical defines
DZ_BLOOD_UNCONSCIOUS = 1000;	//minimum blood before player becomes unconscious
unconscious = false;	//remove this with lifeState is synchronized

//control defines
DZ_KEYS_STUGGLE = [17,30,31,32];	//DIK codes for keys that action struggle out of restraints

//zombie defines
dayz_areaAffect = 3;				//used during attack calculations
zombieActivateDistance = 500;		//The distance which to activate zombies and make them move around
zombieAlertCooldown = 60;		//The distance which to activate zombies and make them move around
zombieClass = ["zombieBase"];		//These are the classes of the zombies, and will be woken by players
totalitems = 0;

//cooldowns
meleeAttack = false;	//set to true during a melee attack (client only).
meleeAttempt = false;	//true while player is trying to melee (holding down)
struggling = false;	//set to true when player is struggling (client only)
meleeAttackType = 1;	//alternates between two attacks

//New player defines
DZ_ENERGY = 1000;	// actual energy from all food and drink consumed
DZ_HUNGER = 0;	//0 to 6000ml size content of stomach, zero is empty
DZ_THIRST = 0; 	//0 to 6000ml size content of stomach, zero is empty
DZ_WATER = 1800;	// actual water from all food and drink consumed
DZ_STOMACH = 1000; // actual volume in stomach
DZ_DIET = 0.5; // actual diet state
DZ_HEALTH = 5000;
DZ_BLOOD = 5000;

//publicVariables
effectDazed = false;	//PVEH Client
actionRestrained = -1;	//PVEH Client
actionReleased = -1;	//PVEH Server

if (isServer) then
{
	call compile preprocessFileLineNumbers "\dz\server\scripts\init.sqf";
};

//generate skins
_format = getText(configFile >> "cfgCharacterCreation" >> "format");
DZ_SkinsArray = [];
{
	_v = _x;
	{
		DZ_SkinsArray set [count DZ_SkinsArray,format[_format,_x,_v]]
	} forEach getArray(configFile >> "cfgCharacterCreation" >> "gender");
} forEach getArray(configFile >> "cfgCharacterCreation" >> "race");

_format = getText(configFile >> "cfgCharacterCreation" >> "format");
_gender = getArray(configFile >> "cfgCharacterCreation" >> "gender");
_race = getArray(configFile >> "cfgCharacterCreation" >> "race");
_skin = getArray(configFile >> "cfgCharacterCreation" >> "skin");
_top = getArray(configFile >> "cfgCharacterCreation" >> "top");
_bottom = getArray(configFile >> "cfgCharacterCreation" >> "bottom");	

ui_fnc_createDefaultChar = {
	_lastInv = profileNamespace getVariable ["lastInventory",[]];
	_lastChar = profileNamespace getVariable ["lastCharacter",""];
	if (typeOf demoUnit != _lastChar) then
	{
		deleteVehicle demoUnit;
		demoUnit = _lastChar createVehicleLocal demoPos;
		demoUnit setPos demoPos;
		demoUnit setDir createDir;
	};
	if (isNull demoUnit) exitWith {};
	{
		if !((typeOf _x) in _lastInv) then {deleteVehicle _x};				
	} forEach itemsInInventory demoUnit;
	_myInv = itemsInInventory demoUnit;
	{
		null = demoUnit createInInventory _x;
	} forEach _lastInv;
	demoUnit call ui_fnc_animateCharacter;
};

/*
ui_fnc_animateCharacter =
{
	_shoulder = _this itemInSlot "shoulder";
	_melee = _this itemInSlot "melee";
	diag_log format["UI: %1 / %2",_shoulder,_melee];
	_anim = switch true do
	{
		case (_shoulder isKindOf "MilitaryRifle"): {_this moveToHands _shoulder;"menu_idleRifle0"};
		case (!isNull _shoulder): {_this moveToHands _shoulder;"menu_idlerifleLong0"};
		case (!isNull _melee): {_this moveToHands _melee;"menu_idleHatchet0"};
		case (true): {"menu_idleUnarmed0"};
	};
	_this switchMove _anim;
};
*/
ui_fnc_mouseDrag = 
{
	_startX = uiNamespace getVariable 'mousePosX';
	_dirS = getDir demoUnit;
	demoUnit enableSimulation false;
	while {true} do
	{				
		createDir = _dirS + ((_startX - (uiNamespace getVariable 'mousePosX')) * 360);
		demoUnit setDir createDir;
	};
};
ui_fnc_mouseDragCancel = 
{
	terminate rotateObject;
	demoUnit enableSimulation true;
};

ui_fnc_setDefaultChar =
{
	//sync character
	_inventory = itemsInInventory demoUnit;
	_inventoryStr = [];
	{
		_inventoryStr set [count _inventoryStr,typeOf _x];
	} forEach _inventory;
	profileNamespace setVariable ["defaultInventory",_inventoryStr];
	profileNamespace setVariable ["defaultCharacter",(typeOf demoUnit)];
	saveProfileNamespace;
};

//UI defaults
setAperture -1;
DZ_Brightness = 1;
DZ_Contrast = 1;
DZ_dynamicBlur = 0;
DZ_colorSat = 1;

//enable PP
"DynamicBlur" ppEffectEnable true;
"ColorCorrections" ppEffectEnable true;

//generate skins
_format = getText(configFile >> "cfgCharacterCreation" >> "format");
DZ_SkinsArray = [];
{
	_v = _x;
	{
		DZ_SkinsArray set [count DZ_SkinsArray,format[_format,_x,_v]]
	} forEach getArray(configFile >> "cfgCharacterCreation" >> "gender");
} forEach getArray(configFile >> "cfgCharacterCreation" >> "race");


DZ_BONES = call {
	_cfgClasses = configFile >> "CfgBody";
	_total = ((count _cfgClasses) - 1);
	_bones = [];
	for "_i" from 0 to _total do 
	{
		_bones set [count _bones,configName (_cfgClasses select _i)];
	};
	_bones
};

player_queued = 		compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\player_queued.sqf";

//functions
fnc_generateTooltip = compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\fn_generateTooltip.sqf";
dayz_bulletHit = 		compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\dayz_bulletHit.sqf";
fnc_playerMessage =	compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\fn_playerMessage.sqf";
randomValue =		compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\randomValue.sqf";

//ui
ui_characterScreen =	compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\ui_characterScreen.sqf";
ui_defaultCharacterScreen =	compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\ui_defaultCharacterScreen.sqf";
ui_newScene =		compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\ui_newScene.sqf";

//melee
melee_startAttack = 	compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\melee_startAttack.sqf";
melee_finishAttack = 	compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\melee_finishAttack.sqf";
event_playerBleed = 	compile preprocessFileLineNumbers "\dz\modulesDayZ\scripts\event_playerBleed.sqf";

melee_fnc_checkHitLocal = {
	if (!_processHit) exitWith {};
	_array = lineHit [_this select 0, _this select 1, "fire", _agent,objNull,0];
	if (count _array>0) exitWith 
	{
		_array select 0 requestDamage [_agent, _array select 2, _ammo, _array select 1];
		//statusChat ["hit","colorImportant"];
		_processHit = false;	//possibly select for slashes?
		if (!_unarmed) then
		{
			playerAction ["BaseballAttackHit",{meleeAttack = false}];
		};
	};
};

//loose compiles
randomSelect = {
	private["_array","_item","_num"];
	_array = _this;
	_num = floor (random (count (_array)));
	_item = _array select _num;
	_item
};

syncWeather = {
	[_this select 0, date, overcast, fog, rain,_this select 1] spawnForPlayer 
	{
		if (_this select 5) then {setDate (_this select 1)};
		0 setOvercast (_this select 2);
		//DZ_WEATHER_CHANGE setFog (_this select 3);
		simulSetHumidity (_this select 2);
		0 setRain (_this select 4);
		//hint "Weather Change from server!";
	};
};

randomValue = {
private["_min","_max","_v"];
	if (count _this == 0) exitWith {-1};
	//[2,format["Random %1",_this],"colorStatusChannel"] call fnc_playerMessage;
	_min = (_this select 0);
	_max = (_this select 1);
	_diff = _max - _min;
	_v = round (_min + (random _diff));
	_v
};

fnc_addTooltipText = {
	//used in tooltips to generate array
	_usedText = text _text;
	_usedText setAttributes _attributes;
	_textArray set [count _textArray,lineBreak];
	_textArray set [count _textArray,_usedText];
};

effect_createBreathFog = {
	_agent = _this;
	if (!(_agent getVariable "fog")) exitwith {};
	_cl = 1;
	_int = 1;
	_source = "#particlesource" createVehicleLocal getPosATL _agent;
	_source setParticleParams
	/*Sprite*/		[["\dz\data\data\ParticleEffects\Universal\Universal", 16, 12, 8],"",// File,Ntieth,Index,Count,Loop(Bool)
	/*Type*/			"Billboard",
	/*TimmerPer*/		1,
	/*Lifetime*/		0.1*_int,
	/*Position*/		[0,0,0],
	/*MoveVelocity*/	[0, 0, 0],
	/*Simulation*/	0, 0.05, 0.04, 0.05,	//rotationVel,weight,volume,rubbing
	/*Scale*/		[0.02, 0.1,0.2],
	/*Color*/		[[_cl, _cl, _cl, 0.05],[_cl, _cl, _cl, 0.1],[_cl, _cl, _cl, 0.2],[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.1],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.08],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.05], [1,1,1, 0]],
	/*AnimSpeed*/		[0.8,0.3,0.25],
	/*randDirPeriod*/	1,
	/*randDirIntesity*/	0,
	/*onTimerScript*/	"",
	/*DestroyScript*/	"",
	/*Follow*/		[_agent, [[0,0.1,0.62],["Head",1]]]];
	//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface]
	_source setParticleRandom [2, [0, 0, 0], [0.0, 0.0, 0.0], 0, 0.2, [0, 0, 0, 0.1], 0, 0, 10];
	_source setDropInterval (0.02*_int);
	_agent setVariable ["breathingParticleSource",_source];
	
	null = [_source,_agent] spawn {
		_source = _this select 0;
		_agent = _this select 1;
		while {(alive _agent) and !(isNull _source)} do
		{
			sleep 1;
			_source setDropInterval 2;
			sleep 2;
			_source setDropInterval 0.02;
		};
		deleteVehicle _source;
	};
};

event_fnc_cookerSteam = {
	private["_sfx"];
	_cooker = _this;
	_position = getPosATL _cooker;
	_steamOn = _cooker getVariable ["steam",false];
	if (_steamOn) then
	{		
		call effect_createSteam; 
	}
	else
	{
		_steam = _cooker getVariable ["cookingParticleSource",objNull];
		deleteVehicle _steam;
	};
};

effect_createSteam = {
	_cl = 1;
	_int = 1;
	_source = "#particlesource" createVehicleLocal getPosATL _cooker;
	_source setParticleParams
	/*Sprite*/		[["\dz\data\data\ParticleEffects\Universal\Universal", 16, 12, 8],"",// File,Ntieth,Index,Count,Loop(Bool)
	/*Type*/			"Billboard",
	/*TimmerPer*/		1,
	/*Lifetime*/		0.5*_int,
	/*Position*/		[0,0,0.3],
	/*MoveVelocity*/	[0, 0, 0.5*_int],
	/*Simulation*/	0, 0.05, 0.04, 0.05,	//rotationVel,weight,volume,rubbing
	/*Scale*/		[0.1, 0.6,2],
	/*Color*/		[[_cl, _cl, _cl, 0.05],[_cl, _cl, _cl, 0.2],[_cl, _cl, _cl, 0.4],[0.05+_cl, 0.05+_cl, 0.05+_cl, 0.3],[0.1+_cl, 0.1+_cl, 0.1+_cl, 0.2],[0.2+_cl, 0.2+_cl, 0.2+_cl, 0.05], [1,1,1, 0]],
	/*AnimSpeed*/		[0.8,0.3,0.25],
	/*randDirPeriod*/	1,
	/*randDirIntesity*/	0,
	/*onTimerScript*/	"",
	/*DestroyScript*/	"",
	/*Follow*/		_cooker];
	//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface]
	_source setParticleRandom [2, [0, 0, 0], [0.0, 0.0, 0.0], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
	_source setDropInterval (0.02*_int);
	_cooker setVariable ["cookingParticleSource",_source];
};

event_fnc_gasLight = {
	private["_sfx"];
	_lamp = _this;
	_position = getPosATL _lamp;
	_lightOn = _lamp getVariable ["light",false];
	if (_lightOn) then
	{		
		call effect_gasLight; 
	}
	else
	{
		//stop light
		deleteVehicle (_lamp getVariable ["lightObject",objNull]);
		//stop monitor 
		terminate (_lamp getVariable ["lightMonitor",null]); 
	};
};

effect_gasLight =
{
	_lamp = _this;
	
	//start light
	_light = "#lightpoint" createVehicleLocal _position;
	_light setLightColor [0.5,0.5,0.4];
	_light setLightAmbient [0.2,0.2,0.18];
	_light setLightBrightness 0.2;
	_light lightAttachObject [_lamp, [0,0,0]];
	_lamp setVariable ["lightObject",_light];
	
	//monitor
	_spawn = [_lamp,_light] spawn {
		_lamp = _this select 0;
		_light = _this select 1;
		while {alive _lamp} do
		{
			while {alive _lamp} do {
				if (!isNull (itemParent _lamp)) exitWith {};
				sleep 0.5;
			};
			_parent = itemParent _lamp;
			if (!isNull itemParent _parent) then {
				_parent = itemParent _parent;
			};			
			_light lightAttachObject [_parent, [0,0,0]];
			while {alive _lamp} do {
				if (isNull (itemParent _lamp)) exitWith {};
				sleep 0.5;
			};
			_light lightAttachObject [_lamp, [0,0,0]];
		};
		deleteVehicle _light;
	};
	_lamp setVariable ["lightMonitor",_spawn];
};

effect_playerVomit =
{
	private["_agent","_source"];
	_agent = _this;
	//vomit contents	
	_cl = 1;
	_int = 1;
	_source = "#particlesource" createVehicleLocal getPosATL _agent;
	_source setParticleParams
	/*Sprite*/		[["\dz\data\data\ParticleEffects\Universal\Universal", 16, 12, 1],"",// File,Ntieth,Index,Count,Loop(Bool)
	/*Type*/			"Billboard",
	/*TimmerPer*/		1,
	/*Lifetime*/		0.8,
	/*Position*/		[0,0,0],
	/*MoveVelocity*/	[0,0,0],
	/*Simulation*/		0, 3, 1, 0,//rotationVel,weight,volume,rubbing
	/*Scale*/			[0.06,0.5],
	/*Color*/			[[0.5,0.5,0.5,1]],
	/*AnimSpeed*/		[1],
	/*randDirPeriod*/	0.1,
	/*randDirIntesity*/	0.1,
	/*onTimerScript*/	"",
	/*DestroyScript*/	"",
	/*Follow*/			[_agent, [[0,0.1,0.62],["Head",1]]]];
	//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface]
	_source setParticleRandom [0, [0, 0, 0], [0.06, 0.06, 0.06], 2, 0, [0, 0, 0, 0], 0, 0];
	
	//process effects
	sleep 1.4;	
	_start = diag_tickTime;
	while {(diag_tickTime - _start) < 2.1} do
	{
		_source setDropInterval (random 0.025);
		sleep 0.1;
	};
	deleteVehicle _source;
};