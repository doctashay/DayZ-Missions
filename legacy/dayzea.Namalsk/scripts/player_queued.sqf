_id = _this select 0;
_alive = _this select 1;

//create camera
_position = _this select 2;

titleText ["Please wait...","BLACK FADED",10e10];

/*
myCamera = "camera" camCreate _position;
myCamera cameraEffect ["internal","back"];
myCamera camPrepareDir 120;
myCamera camPreparePos _position;
myCamera camCommitPrepared 0;
*/
waitUntil {preloadCamera _position};

if (!_alive) then
{	
	//load data
	_top = getArray(configFile >> "cfgCharacterCreation" >> "top");
	_bottom = getArray(configFile >> "cfgCharacterCreation" >> "bottom");
	_shoe = getArray(configFile >> "cfgCharacterCreation" >> "shoe");
	_format = getText(configFile >> "cfgCharacterCreation" >> "format");

	//find selected skin
	_charType = profileNamespace getVariable ["defaultCharacter",""];
	_charTypeN = DZ_SkinsArray find _charType;
	if (_charTypeN < 0) then {_charTypeN = floor random (count DZ_SkinsArray)};

	//generate inventory array
	_topN = floor random (count _top);
	_bottomN = floor random (count _bottom);
	_shoeN = floor random (count _shoe);
	_array = profileNamespace getVariable ["defaultInventory",[]];
	{
		switch true do
		{
			case (_x isKindOf "TopwearBase"): {
				_topN = (_top find _x);
			};
			case (_x isKindOf "BottomwearBase"): {
				_bottomN = (_bottom find _x);
			};
			case (_x isKindOf "FootwearBase"): {
				_shoeN = (_shoe find _x);
			};
		};
	} forEach _array;
	clientNew = [_charTypeN,[_topN,_bottomN,_shoeN],_id];
	publicVariableServer "clientNew";	
	statusChat ['ready default!',''];
	waitUntil {isSceneReady};
	statusChat ['scene ready...',''];
}
else
{
	clientReady = _id;
	publicVariableServer "clientReady";		
	statusChat ['ready!',''];
};