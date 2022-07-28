activateAddons [ 
];


//this is a default player that will load if there is some sort of script error that would prevent the game from loading normally.
//if you spawn on the coast with no clothes, you've triggered this fallback somehow!
unit_1 = objNull;
_createUnit = 
{
  _this = createAgent ["SurvivorPartsMaleAfrican", [9770.1611, 1834.4303, -3.5866909], [], 0, "CAN_COLLIDE"];
  unit_3 = if (true) then {[_this]} else {_this};
  _this setUnitAbility 0.60000002;
  if (true) then {_id selectPlayer _this};
};
if (true) then {unit_3 = [];onPlayerConnecting _createUnit;} else {if (true) then _createUnit};

