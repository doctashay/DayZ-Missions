activateAddons [ 
  "dz_weapons_arma2",
  "hsim_wheeled_h_van_passenger",
  "hsim_wheeled_h_ural",
  "dz_books",
  "dz_pistols_magnum",
  "dz_pistols_fnx45",
  "hsim_wheeled_h_firetruck",
  "ca_air2_su25",
  "hsim_wheeled_h_police_car",
  "dz_animals_bear",
  "dz_animals_cowv2",
  "dz_animals_capra_hircus",
  "hsim_air_h_airliner_a",
  "hsim_air_h_aircraft_a"
];

activateAddons ["dz_weapons_arma2", "hsim_wheeled_h_van_passenger", "hsim_wheeled_h_ural", "dz_books", "dz_pistols_magnum", "dz_pistols_fnx45", "hsim_wheeled_h_firetruck", "ca_air2_su25", "hsim_wheeled_h_police_car", "dz_animals_bear", "dz_animals_cowv2", "dz_animals_capra_hircus", "hsim_air_h_airliner_a", "hsim_air_h_aircraft_a"];

unit_3 = objNull;
_createUnit = 
{
  _this = createAgent ["SurvivorPartsMaleAfrican", [9770.1611, 1834.4303, -3.5866909], [], 0, "CAN_COLLIDE"];
  unit_3 = if (true) then {[_this]} else {_this};
  _this setUnitAbility 0.60000002;
  if (true) then {_id selectPlayer _this};
};
if (true) then {unit_3 = [];onPlayerConnecting _createUnit;} else {if (true) then _createUnit};
