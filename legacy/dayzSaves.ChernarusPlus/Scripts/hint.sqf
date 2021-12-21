weedMenu = {

fullLoadout = {
"M_STANAG_30Rnd_Coupled" createVehicle (getPosATL player);
"M_STANAG_30Rnd_Coupled" createVehicle (getPosATL player);
"Bag_Hunting" createVehicle (getPosATL player);
"BaseballCap_Olive" createVehicle (getPosATL player);
"Hoodie_Black" createVehicle (getPosATL player);
"ItemCompass" createVehicle (getPosATL player);
"ItemRadio" createVehicle (getPosATL player);
"Jeans_Black" createVehicle (getPosATL player);
"MedicalItem_Bandage" createVehicle (getPosATL player);
"MedicalItem_Bloodbag" createVehicle (getPosATL player);
"TacticalVest" createVehicle (getPosATL player);
"M4A1" createVehicle (getPosATL player);
"magnum" createVehicle (getPosATL player);
"M_357_Speedloader" createVehicle (getPosATL player);
"Chainsaw" createVehicle (getPosATL player);
"Medical_Bandage" createVehicle (getPosATL player);
//player addMagazine "100Rnd_762x51_M240";
};

timeday = {
setDate [1986, 2, 25, 12, 0];
};

timenight = {
setDate [1986, 2, 25, 23, 0];
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
	sCode = " while {infammoON==1} do{(vehicle player) setVehicleAmmo 1;sleep 0.1;};";
	[] spawn compile sCode;
};

spawncardriver = {
	_veh = "HMMWV" createVehicle (getPosATL player);
	//player moveInDriver _veh;
};

spawnav8b = {
	_veh = "AV8B" createVehicle (getPosATL player);
	player moveInDriver _veh;
};

spawnosprey = {
	_veh = "MV22" createVehicle (getPosATL player);
	player moveInDriver _veh;
};

executer = {
	closedialog 0;
	sleep 0.1;
	createdialog 'rscdisplaynote';
	sleep 0.2;
	disableSerialization;
	ctrlSetText[1600,'Execute'];
	ctrlSettext[1601,'Exit'];
	ctrlSetText[1300,'Bowens Script Executer'];
	buttonSetAction[1600,'_text = (ctrlText 1400);[] spawn compile _text;'];
};

removegrass = {
	if(toggle_5) then {
		setTerrainGrid 50.0;hint "Terrain Hack ON";
	} else {
		setTerrainGrid 12.5;hint "Terrain Hack OFF";
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

fastwalk = {
	_doWait = false;
	if(toggle_1) then {hint "SPEED WALK ON!";} else {hint "SPEED WALK OFF!";};
	while{toggle_1} do {
		player setVariable ["health", 5000];
		player setVariable ["blood", 5000];
		if(_doWait) then {sleep 0.1;_doWait = false;};
		if(inputAction "MoveForward" > 0|| inputAction "MoveFastForward" > 0|| inputAction "MoveSlowForward" > 0 || inputAction "EvasiveForward" > 0) then {
			_distance = 25;
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
				_distance = 25;
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

teleMenu = [];
genSubMenu = {hint "holder";};

menuScripts = [
	["Teleport Menu",{tempArray = teleMenu;teleMenu spawn genSubMenu;},false,"",true],
	["Suicide",killme,false,"",false],
	["Bowen Executer",executer,false,"",false],
	["Drop Near",dropnear,false,"",false],
	["Spawn HMMWV",spawncardriver,false,"",false],
	["Full Loadout",fullLoadout,false,"",false],
	["Spawn AV8B Jet",spawnav8b,false,"",false],
	["Spawn MV22 Osprey",spawnosprey,false,"",false],
	["Fast Walk",fastwalk,true,"toggle_1",false],
	["Infinite Ammo",infammo,true,"toggle_7",false],
	["Time Day",timeday,false,"",false],
	["Time Night",timenight,false,"",false],
	["No Collide",nocollide,true,"toggle_4",false],
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