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

vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["FireTruck_Red_H", [9719.666, 1856.8992, 0], [], 0, "CAN_COLLIDE"];
  vehicle_0 = _this;
  _this setPos [9719.666, 1856.8992, 0];
};

vehicle_1 = objNull;
if (true) then
{
  _this = createVehicle ["Su25_Ins", [9701.8096, 1854.1929, 0], [], 0, "CAN_COLLIDE"];
  vehicle_1 = _this;
  _this setPos [9701.8096, 1854.1929, 0];
};

vehicle_2 = objNull;
if (true) then
{
  _this = createVehicle ["Mi17_medevac_CDF", [9682.6006, 1855.2749, 0], [], 0, "CAN_COLLIDE"];
  vehicle_2 = _this;
  _this setPos [9682.6006, 1855.2749, 0];
};

vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["Heli_Medium01_Frostfire_H", [9660.6846, 1855.5459, 0], [], 0, "CAN_COLLIDE"];
  vehicle_3 = _this;
  _this setPos [9660.6846, 1855.5459, 0];
};

vehicle_4 = objNull;
if (true) then
{
  _this = createVehicle ["Heli_Medium01_H", [9643.9102, 1857.4402, 0], [], 0, "CAN_COLLIDE"];
  vehicle_4 = _this;
  _this setPos [9643.9102, 1857.4402, 0];
};

vehicle_5 = objNull;
if (true) then
{
  _this = createVehicle ["Heli_Light01_H", [9733.4639, 1855.5459, 0], [], 0, "CAN_COLLIDE"];
  vehicle_5 = _this;
  _this setPos [9733.4639, 1855.5459, 0];
};

vehicle_6 = objNull;
if (true) then
{
  _this = createVehicle ["Heli_Light01_sheriff_H", [9747.8027, 1856.358, 0], [], 0, "CAN_COLLIDE"];
  vehicle_6 = _this;
  _this setPos [9747.8027, 1856.358, 0];
};

vehicle_7 = objNull;
if (true) then
{
  _this = createVehicle ["Heli_Heavy01_Luxury_Vrana_H", [9645.5342, 1880.7037, 0], [], 0, "CAN_COLLIDE"];
  vehicle_7 = _this;
  _this setPos [9645.5342, 1880.7037, 0];
};

vehicle_8 = objNull;
if (true) then
{
  _this = createVehicle ["Heli_Heavy01_Luxury_President_H", [9675.8359, 1880.4327, 0], [], 0, "CAN_COLLIDE"];
  vehicle_8 = _this;
  _this setPos [9675.8359, 1880.4327, 0];
};

vehicle_9 = objNull;
if (true) then
{
  _this = createVehicle ["Heli_Heavy01_Luxury_H", [9703.7031, 1880.7037, 0], [], 0, "CAN_COLLIDE"];
  vehicle_9 = _this;
  _this setPos [9703.7031, 1880.7037, 0];
};

vehicle_10 = objNull;
if (true) then
{
  _this = createVehicle ["IND_Heli_Heavy01_H", [9728.3242, 1879.8916, 0], [], 0, "CAN_COLLIDE"];
  vehicle_10 = _this;
  _this setPos [9728.3242, 1879.8916, 0];
};

vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle ["PoliceCar_H", [9687.1992, 1906.4016, 0], [], 0, "CAN_COLLIDE"];
  vehicle_11 = _this;
  _this setPos [9687.1992, 1906.4016, 0];
};

vehicle_12 = objNull;
if (true) then
{
  _this = createVehicle ["Bear", [9665.2842, 1906.1316, 0], [], 0, "CAN_COLLIDE"];
  vehicle_12 = _this;
  _this setPos [9665.2842, 1906.1316, 0];
};

vehicle_13 = objNull;
if (true) then
{
  _this = createVehicle ["CowV2_03", [9715.0664, 1905.8606, 0], [], 0, "CAN_COLLIDE"];
  vehicle_13 = _this;
  _this setPos [9715.0664, 1905.8606, 0];
};

vehicle_14 = objNull;
if (true) then
{
  _this = createVehicle ["CowV2_01", [9631.4648, 1903.9663, 0], [], 0, "CAN_COLLIDE"];
  vehicle_14 = _this;
  _this setPos [9631.4648, 1903.9663, 0];
};

vehicle_15 = objNull;
if (true) then
{
  _this = createVehicle ["Animal_CapraHircus_Black", [9742.9336, 1904.2373, 0], [], 0, "CAN_COLLIDE"];
  vehicle_15 = _this;
  _this setPos [9742.9336, 1904.2373, 0];
};

vehicle_16 = objNull;
if (true) then
{
  _this = createVehicle ["Airliner_A_H", [9636.6055, 1935.3461, 0], [], 0, "CAN_COLLIDE"];
  vehicle_16 = _this;
  _this setPos [9636.6055, 1935.3461, 0];
};

vehicle_17 = objNull;
if (true) then
{
  _this = createVehicle ["Aircraft_A_H", [9673.9424, 1936.4282, 0], [], 0, "CAN_COLLIDE"];
  vehicle_17 = _this;
  _this setPos [9673.9424, 1936.4282, 0];
};

vehicle_18 = objNull;
if (true) then
{
  _this = createVehicle ["MH60S", [9784.8701, 1901.803, 0], [], 0, "CAN_COLLIDE"];
  vehicle_18 = _this;
  _this setPos [9784.8701, 1901.803, 0];
};

