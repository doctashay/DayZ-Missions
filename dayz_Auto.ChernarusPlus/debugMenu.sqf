//DayZ Legacy 0.44
//debugMenu.sqf - A debug menu used to test server functions. 

weedMenu = {

fullLoadout = {
_weapon = player createInInventory "M4A1";
_weapon addMagazine "M_STANAG_30Rnd";
_weapon createWeaponAttachment "Attachment_Optic_ACOG";
_weapon createWeaponAttachment "Attachment_Suppressor_556";
_weapon createWeaponAttachment "Attachment_Buttstock_M4MP_Black";
_weapon createWeaponAttachment "Attachment_Handguard_M4MP_Black";
player createInInventory "BagTaloon_Green";
player createInInventory "BallisticHelmet_Black"; 
player createInInventory "M_STANAG_30Rnd";
player createInInventory "M_STANAG_30Rnd";
player createInInventory "M_STANAG_30Rnd";
player createInInventory "TTsKO_Jacket_Camo";
player createInInventory "MedicalItem_Bloodbag";
player createInInventory "UKAssVest_Black";
player createInInventory "Magnum";
};

nightlight = {
		if (toggle_13) then
		{
			_light = "#lightpoint" createVehicleLocal getpos player; 
			_light setLightBrightness 9; 
			_light setLightAmbient[15, 15, 15]; 
			_light setLightColor[.4, 1, 0]; 
			_light lightAttachObject [player, [0,0,15]];
			systemchat "Night Light ON";
		}
		else
		{
			deleteVehicle _light;
			systemchat "Night Light OFF";
		};
};							

debugcam = {
		systemchat "Debug Camera activated. Press Numpad 0 to Exit";
        _ppos = getPosATL cameraOn;
        _pX = _ppos select 0;
        _pY = _ppos select 1;
        _pZ = _ppos select 2;
        _local = "camera" camCreate [_pX, _pY, _pZ + 2];
        BIS_DEBUG_CAM = _local;
        _local camCommand "MANUAL ON";
        _local camCommand "INERTIA OFF";
        _local cameraEffect ["INTERNAL", "BACK"];
        _local camCommand "COMFY ON";
        showCinemaBorder false;
        BIS_DEBUG_CAM setDir direction (vehicle player);
        waitUntil {isNull BIS_DEBUG_CAM};
        player cameraEffect ["TERMINATE", "BACK"];
        BIS_DEBUG_CAM = nil;
        camDestroy _local;
};

respawn = {
		player setVelocity[0,0,1000];
		sleep 0.2;
		player setVelocity[0,0,-1000];
		sleep 0.3;
};

fastwalk = {
	_doWait = false;
	if(toggle_1) then {hint "SPEED WALK ON!";} else {hint "SPEED WALK OFF!";};
	while{toggle_1} do {
		if(_doWait) then {sleep 0.1;_doWait = false;};
		if(inputAction "MoveForward" > 0|| inputAction "MoveFastForward" > 0|| inputAction "MoveSlowForward" > 0 || inputAction "EvasiveForward" > 0) then {
			_distance = 0.7;
			_dir = getdir vehicle player;
			_pos = getposasl vehicle player;
			if ((_pos select 2) > 5) then 
			{
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
			}
			else
			{
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),getTerrainHeightASL [(_pos select 0),(_pos select 1)]-.1];
			};
			player setPosASL _pos;
			_doWait = true;
		} else {
			if(inputAction "MoveBack" > 0|| inputAction "EvasiveBack" > 0) then {
				_distance = -0.7;
				_dir = getdir vehicle player;
				_pos = getposasl vehicle player;
				if ((_pos select 2) > 5) then 
				{
					_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
				}
				else
				{
					_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),getTerrainHeightASL [(_pos select 0),(_pos select 1)]-.1];
				};
				player setPosASL _pos;
				_doWait = true;
			};
		};
		sleep 0.001;
	};
};

timeday = {
setDate [2022, 2, 6, 8, 0];
};

timenight = {
setDate [2022, 2, 6, 24, 0];
};

cloudyday = {
	0 setOvercast 1;
    0 setRain 0;
	0 setFog 0.3;
	setDate [2022, 2, 6, 9, 0];
	simulWeatherSync;
};

lightrainyday = {
	0 setOvercast 0.7;
    0 setRain 0.8;
	0 setFog 0.5;
	setDate [2022, 2, 6, 10, 0];
	simulWeatherSync;
};

heavyrainyday = {
	0 setOvercast 1;
    0 setRain 1;
	0 setFog 0.7;
	setDate [2022, 2, 6, 10, 0];
	simulWeatherSync;
};

foggyday = {
	0 setOvercast 1;
    0 setRain 0;
	0 setFog 1;
	setDate [2022, 2, 6, 12, 0];
	simulWeatherSync;
};

sunnyday = {
	0 setOvercast 0;
    0 setRain 0;
	0 setFog 0;
	setDate [2022, 2, 6, 12, 0];
	simulWeatherSync;
};

cloudynight = {
	0 setOvercast 1;
    0 setRain 0;
	0 setFog 0.2;
	setDate [2022, 2, 6, 1, 0];
	simulWeatherSync;
};

lightrainynight = {
	0 setOvercast 0.7;
    0 setRain 0.8;
	0 setFog 0.5;
	setDate [2022, 2, 6, 1, 0];
	simulWeatherSync;
};

heavyrainynight = {
	0 setOvercast 1;
    0 setRain 1;
	0 setFog 1;
	setDate [2022, 2, 6, 1, 0];
	simulWeatherSync;
};

foggynight = {
	0 setOvercast 1;
    0 setRain 0;
	0 setFog 1;
	setDate [2022, 2, 6, 1, 0];
	simulWeatherSync;
};

clearnight = {
	0 setOvercast 0;
    0 setRain 0;
	0 setFog 0;
	setDate [2022, 2, 6, 23, 0];
	simulWeatherSync;
};

infammo = {
	if (isnil ("infammoON")) then 
	{
		infammoON = 0;
	};
	if (infammoON==0) then
	{
		systemchat "Infinite Ammo ON!";
		infammoON=1;
	}
	else
	{
		infammoON=0;
		systemchat "Infinite Ammo OFF!";
	};
	sCode = "while {infammoON==1} do{(vehicle player) setVehicleAmmo 1;sleep 0.1;};";
	[] spawn compile sCode;
};

startdebugmenu = {
	createDialog "RscDisplayDebug";
};

ejectVehicle = {
	moveOut player;
};

executer = {
	closedialog 0;
	sleep 0.1;
	createdialog 'rscdisplaynote';
	sleep 0.2;
	disableSerialization;
	ctrlSetText[1600,'Execute'];
	ctrlSettext[1601,'Exit'];
	ctrlSetText[1300,'Weed Script Executer'];
	buttonSetAction[1600,'_text = (ctrlText 1400);[] spawn compile _text;'];
};

removegrass = {
	if(toggle_5) then {
		setTerrainGrid 50.0;hint "Terrain Hack ON";
	} else {
		setTerrainGrid 12.5;hint "Terrain Hack OFF";
	};
};

norecoil = {
	if(toggle_14) then {
		player setUnitRecoilCoefficient 0;
	} else {
		player setUnitRecoilCoefficient 1;
	};
};

nocollide = {
	if(toggle_4) then {hint "NO COLLIDE ON";} else {hint "NO COLLIDE OFF";};
	_objects = [];
	while{toggle_4} do {
		_list = player nearObjects 50;
		{
			if !(_x in _objects) then {
				player disableCollisionWith _x;
				_objects = _objects + [_x];
			};
		} forEach _list;
		sleep 10;
	};
	{
		player enableCollisionWith _x;
		_objects = _objects - [_x];
	} forEach _objects;
};

nwaftele = {
player setPos [4611,10477];
};

balotatele = {
player setPos [4406,2435];
};

chernotele = {
player setPos [7000, 2500];
};

dubkytele = {
player setPos [6528,3555];
};

oakstele = {
player setPos [4817,2223];
};

hmmwvSpawn = {
	"HMMWV" createVehicle (getPosATL player);
};

uralSpawn = {
	"Ural_CDF" createVehicle (getPosATL player);
};

uazSpawn = {
	"UAZ_CDF" createVehicle (getPosATL player);
};

ospreyspawn = {
	"MV22" createVehicle (getPosATL player);
};

mi17spawn = {
	"Mi17_medevac_RU" createVehicle (getPosATL player);
};

ak74spawn = {
	"AK74" createVehicle (getPosATL player);
};

toggle_1 = false;
toggle_2 = false;
toggle_3 = false;
toggle_4 = false;
toggle_5 = false;
toggle_6 = false;
toggle_7 = false;
toggle_8 = false;
toggle_9 = false;
toggle_10 = false;
toggle_11 = false;
toggle_12 = false;
toggle_13 = false;
toggle_14 = false;
teleMenu = [];
vehMenu = [];
weapMenu = [];
genSubMenu = {hint "holder";};

menuScripts = [
	["Vehicle Menu (Client Side)",{tempArray = vehMenu;vehMenu spawn genSubMenu;},false,"",true],
	["Teleport Menu",{tempArray = teleMenu;teleMenu spawn genSubMenu;},false,"",true],
	["Weather Menu",{tempArray = weatherMenu;weatherMenu spawn genSubMenu;},false,"",true],
	["Weapon Menu",{tempArray = weapMenu;weapMenu spawn genSubMenu;},false,"",true],
	["Script Executer",executer,false,"",false],
	["Full Loadout",fullLoadout,false,"",false],
	["Suicide",respawn,false,"",false],
	["Start Debug Menu",startdebugmenu,false,"",false],
	["Eject from vehicles",ejectVehicle,false,"",false],
	["Infinite Ammo",infammo,true,"toggle_7",false],
	["No Recoil",norecoil,true,"toggle_14",false],
	["Time Day",timeday,false,"",false],
	["Time Night",timenight,false,"",false],
	["No Collide",nocollide,true,"toggle_4",false],
	["Debug Camera",debugcam,false,"",false],
	["Night Light",nightlight,false,"",false],
	["Fast Walk", fastwalk,true,"toggle_1",false],
	["No Grass",removegrass,true,"toggle_5",false]
];

teleMenu = [
	["NWAF Teleport",nwaftele,false,""],
	["Cherno Teleport",chernotele,false,""],
	["Balota Teleport",balotatele,false,""],
	["Dubky Teleport",dubkytele,false,""],
	["Balota Teleport",balotatele,false,""],
	["Oaks Teleport",oakstele,false,""]
	];

weatherMenu = [
	["Cloudy Day",cloudyday,false,""],
	["Light Rainy Day",lightrainyday,false,""],
	["Heavy Rainy Day",heavyrainyday,false,""],
	["Foggy Day",foggyday,false,""],
	["Sunny Day",sunnyday,false,""],
	["Cloudy Night",cloudynight,false,""],
	["Light Rainy Night",lightrainynight,false,""],
	["Heavy Rainy Night",heavyrainyday,false,""],
	["Foggy Night",foggynight,false,""],
	["Clear Night",clearnight,false,""]
];

vehMenu = [
	["UAZ",uazSpawn,false,""],
	["Ural",uralSpawn,false,""],
	["HMMWV",hmmwvSpawn,false,""],
	//["Hilux",hiluxspawn,false,""],
	["Mi17",mi17spawn,false,""],
	["MV22 Osprey",ospreyspawn,false,""]
];

weapMenu = [
	["AK74",ak74spawn,false,""]
];


shiftMenu = {
	if ((typeName _this) == "ARRAY") then {
		_control = _this select 0;
		_pos = ctrlPosition _control;
		_control ctrlSetPosition [(_pos select 0)+0.5, (_pos select 1),(_pos select 2)+(_this select 1), (_pos select 3) + (_this select 2)];
		_control ctrlCommit 0;
	} else {
		_control = _this;
		_pos = ctrlPosition _control;
		_control ctrlSetPosition [(_pos select 0)+0.5, (_pos select 1),(_pos select 2), (_pos select 3)];
		_control ctrlCommit 0;
	};
};

fixMenu = {
	_display = _this;
	
	_controlScripts = (_display displayCtrl 1021);
	_pos = ctrlPosition _controlScripts;
	_controlPlayers = (_display displayCtrl 1002);
	_controlPlayers ctrlSetPosition [(_pos select 0)+(_pos select 2)+0.06, (_pos select 1)];
	_controlPlayersBG = (_display displayCtrl 1022);
	_controlPlayersBG ctrlSetPosition [(_pos select 0)+(_pos select 2)+0.06, (_pos select 1)];
	_controlPlayers ctrlCommit 0;
	_controlPlayersBG ctrlCommit 0;
	
	[(_display displayCtrl 1021),0.05,0] call shiftMenu;
	(_display displayCtrl 1022) call shiftMenu;
	
	_mcontrol = (_this displayCtrl 1001);
	_mpos = ctrlPosition _mcontrol;
	_control = (_display displayCtrl 1023);
	_pos = ctrlPosition _control;
	_widthScripts = ctrlPosition (_display displayCtrl 1021) select 2;
	_widthPlayers = ctrlPosition (_display displayCtrl 1022) select 2;
	_control ctrlSetText "Weed's Menu";
	_control ctrlSetPosition [(_mpos select 0)+0.5, (_pos select 1)-0.1, (_widthScripts + _widthPlayers + 0.01),0.1];
	_control ctrlCommit 0;
	
	(_display displayCtrl 1013) ctrlShow false;
	(_display displayCtrl 1013) ctrlSetScale 3;
	(_display displayCtrl 1013) ctrlCommit 1;
};

genPlayers = {
	_control = (_this displayCtrl 1002);
	_control call shiftMenu;
	_control lbAdd "Players:";
	_control lbSetColor [0, [0, 1, 0, 0.5]];
	_control lbAdd "-----------------------------";
	_control lbSetColor [1, [0, 1, 0, 0.5]];
	_list = player nearEntities ["SurvivorBase",850];
	{
		_control lbAdd format["%1",name _x];
	}forEach _list;
};

dbClicked = {
	disableserialization;
	_index = _this;
	_item  = tempArray select _index;
	_text = _item select 0;
	_cmd = _item select 1;
	_isToggle = _item select 2;
	_toggleVar = _item select 3;
	if(_isToggle) then {
		call compile format["%1 = !%1",_toggleVar];
		_bool= call compile _toggleVar;
		if(_bool) then {
			lbSetColor [1001,_index,[0,1,0,1]];
		} else {
			lbSetColor [1001,_index,[1,0,0,1]];
		};
	};
	systemChat ("Weed Menu: Started " + _text);
	[] spawn _cmd;
};

genScripts = {
	_control = (_this displayCtrl 1001);
	_control ctrlRemoveAllEventHandlers "LBSelChanged";
	_control ctrlRemoveAllEventHandlers "LBDblClick";
	_control ctrlRemoveAllEventHandlers "MouseButtonDown";
	_control ctrlRemoveAllEventHandlers "KeyDown";
	_control ctrlAddEventHandler ["LBDblClick","(_this select 1) spawn dbClicked;"];
	_control ctrlCommit 0;
	_control = (_this displayCtrl 1001);
	_pos = ctrlPosition _control;
	[_control,0.05,0] call shiftMenu;
	disableSerialization;
	_display = _this;
	_left = _display displayctrl 1001;
	_counter = 0;
	lbClear _left;
	{
		_left lbAdd (_x select 0);
		if((_x select 2)) then {
			_bool= call compile (_x select 3);
			if(_bool) then {
				_left lbSetColor [_counter,[0,1,0,1]];
			} else {
				_left lbSetColor [_counter,[1,0,0,1]];
			};
		} else {
			if (_x select 4) then {
				_left lbSetColor [_counter,[0,0,0.75,1]];
			} else {
				_left lbSetColor [_counter,[1,1,1,1]];
			};
		};
		_counter = _counter + 1;
	} forEach menuScripts;
	_left ctrlCommit 0;
};

genSubMenu = {
	disableSerialization;
	_display = findDisplay 129;
	_left = _display displayctrl 1001;
	_subscripts = _this;
	_counter = 0;
	lbClear _left;
	{
		_left lbAdd (_x select 0);
		if((_x select 2)) then {
			_bool= call compile (_x select 3);
			if(_bool) then {
				_left lbSetColor [_counter,[0,1,0,1]];
			} else {
				_left lbSetColor [_counter,[1,0,0,1]];
			};
		} else {
			if (_x select 4) then {
				_left lbSetColor [_counter,[0,0,0.75,1]];
			} else {
				_left lbSetColor [_counter,[1,1,1,1]];
			};
		};
		_counter = _counter + 1;
	} forEach _subscripts;
	_left ctrlCommit 0;
};

startMenu = {
	_ok = createDialog "RscDisplayDiary";
	disableSerialization;
	waitUntil{!isNull (findDisplay 129)};
	_display = findDisplay 129;
	
	_display call fixMenu;
	_display call genScripts;
	_display call genPlayers;
	tempArray = menuScripts;
	if (_ok) then {
	};
	disableUserInput false;
};

[] spawn {
	_count = 0;
	while{true} do {
		if(inputAction "NightVision" > 0) then {
			if(isNull (findDisplay 129)) then {
				[] spawn startMenu;
			};
			sleep 0.5;
		};
		sleep 0.001;
		_count = _count + 1;
	};
};
systemchat "Weed Menu Initiated. Press N to open.";
};

[] spawn weedMenu;